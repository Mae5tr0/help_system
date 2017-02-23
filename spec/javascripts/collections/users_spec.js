describe("Users", function() {
  describe('server interaction', function () {
    var server, users;

    beforeEach(function() {
      server = sinon.fakeServer.create();
      server.respondWith(
        "GET",
        "/api/v1/users",
        FAKE_SEVER.validResponse('users')
      );
      users = new Helpdesk.Collections.Users();
    });

    afterEach(function() {
      server.restore();
    });

    it("should make the correct request", function() {
      Helpdesk.storage = { get: sinon.stub().withArgs('authToken').returns('token') };

      users.fetch();
      expect(server.requests.length).toEqual(1);
      expect(server.requests[0].method).toEqual("GET");
      expect(server.requests[0].url).toEqual("/api/v1/users");
      expect(server.requests[0].requestHeaders['Authorization']).toEqual("token");
    });

    it("correct parse response from server", function() {
      Helpdesk.storage = { get: sinon.stub() };
      users.fetch();
      server.respond();

      expect(users.length).toEqual(2);
      expect(users.get('uid_user_2').get('email')).toEqual('support@test.com')
    });
  });
});
