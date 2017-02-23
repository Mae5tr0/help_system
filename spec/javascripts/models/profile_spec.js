describe("Profile", function() {
  describe('server interaction', function() {
    var server, profile;

    beforeEach(function() {
      server = sinon.fakeServer.create();
      server.respondWith(
        "GET",
        "/api/v1/user/profile",
        FAKE_SEVER.validResponse('profile')
      );
      profile = new Helpdesk.Models.Profile();
    });

    afterEach(function() {
      server.restore();
    });

    it("should make the correct request", function() {
      Helpdesk.storage = { get: sinon.stub().withArgs('authToken').returns('token') };

      profile.fetch();
      expect(server.requests.length).toEqual(1);
      expect(server.requests[0].method).toEqual("GET");
      expect(server.requests[0].url).toEqual("/api/v1/user/profile");
      expect(server.requests[0].requestHeaders['Authorization']).toEqual("token");
    });

    it("correct parse response from server", function() {
      Helpdesk.storage = { get: sinon.stub() };
      profile.fetch();
      server.respond();

      expect(profile.get('email')).toEqual("customer@test.com");
      expect(profile.get('id')).toEqual("uid_user_1");
      expect(profile.get('role')).toEqual("customer");
    });
  });

  describe('roles', function() {
    it('admin', function(){
      var profile = new Helpdesk.Models.Profile({role: 'admin'});

      expect(profile.isAdmin()).toBeTruthy();
      expect(profile.isCustomer()).toBeFalsy();
      expect(profile.isSupport()).toBeFalsy();
    });

    it('customer', function() {
      var profile = new Helpdesk.Models.Profile({role: 'customer'});

      expect(profile.isAdmin()).toBeFalsy();
      expect(profile.isCustomer()).toBeTruthy();
      expect(profile.isSupport()).toBeFalsy();
    });

    it('support', function() {
      var profile = new Helpdesk.Models.Profile({role: 'support'});

      expect(profile.isAdmin()).toBeFalsy();
      expect(profile.isCustomer()).toBeFalsy();
      expect(profile.isSupport()).toBeTruthy();
    });
  })
});
