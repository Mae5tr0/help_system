describe("View.TicketsIndex", function() {

  beforeEach(function() {
    this.view = new Helpdesk.Views.TicketsIndex();
  });

  describe("Instantiation", function() {
    it("should create a list element", function() {
      expect(this.view.el.nodeName).toEqual("DIV");
    });
  });
});