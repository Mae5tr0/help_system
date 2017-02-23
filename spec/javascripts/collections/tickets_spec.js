describe("Tickets", function() {
  describe('server interaction', function () {
    var server, tickets;

    beforeEach(function() {
      server = sinon.fakeServer.create();
      server.respondWith(
        "GET",
        "/api/v1/tickets",
        FAKE_SEVER.validResponse('tickets')
      );
      tickets = new Helpdesk.Collections.Tickets();
    });

    afterEach(function() {
      server.restore();
    });

    it("should make the correct request", function() {
      Helpdesk.storage = { get: sinon.stub().withArgs('authToken').returns('token') };

      tickets.fetch();
      expect(server.requests.length).toEqual(1);
      expect(server.requests[0].method).toEqual("GET");
      expect(server.requests[0].url).toEqual("/api/v1/tickets");
      expect(server.requests[0].requestHeaders['Authorization']).toEqual("token");
    });

    it("correct parse response from server", function() {
      Helpdesk.storage = { get: sinon.stub() };
      tickets.fetch();
      server.respond();

      expect(tickets.length).toEqual(2);
      expect(tickets.get('id_2').get('title')).toEqual('Ticket 2')
    });
  });
});
