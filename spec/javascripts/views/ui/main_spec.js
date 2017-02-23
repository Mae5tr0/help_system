describe("Views.Main", function() {

  beforeEach(function() {
    this.view = new Helpdesk.Views.Main({model: new Backbone.View()});
    Helpdesk.profile = new Helpdesk.Models.Profile({role: 'customer'});
  });

  describe("Instantiation", function() {
    it("should create a list element", function() {
      this.view.render();
      expect(this.view.el.nodeName).toEqual("DIV");
    });
  });
});