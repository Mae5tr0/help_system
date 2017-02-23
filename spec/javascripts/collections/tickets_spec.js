describe("Tickets", function() {
  it("should be defined", function() {
    expect(Helpdesk.Collections.Tickets).toBeDefined();
  });

  var server, tickets;

  // beforeEach(function() {
  //   server = sinon.fakeServer.create();
  //   server.respondWith(
  //     "GET",
  //     "/todos",
  //     'temp' //validResponse(fixture)
  //   );
  //   tickets = new Helpdesk.Collections.Tickets();
  // });
  //
  // afterEach(function() {
  //   server.restore();
  // });

  it("correct parse response from server", function() {
    // tickets.fetch();
    // server.respond();
    //
    // expect(this.todos.length).toEqual(this.fixture.response.todos.length);
    // expect(this.todos.get(1).get('title')).toEqual(this.fixture.response.todos[0].title)
    expect(Helpdesk.Collections.Tickets).toBeDefined();
  });
});
