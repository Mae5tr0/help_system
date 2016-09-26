Helpdesk.Views.Main = Backbone.View.extend({
  template: JST['ui/main'],
  el: 'body',

  events: {
    'click .logout': 'logout'
  },

  render: function () {
    this.$el.html(this.template());
    this.model.setElement(this.$el.find('#content'));
    this.model.render();
  },

  logout: function (ev) {
    console.log("logout");
    ev.preventDefault();
    var session = new Helpdesk.Models.UserLogout();
    session.destroy({
      success: function () {
        console.log("logout success");
        Helpdesk.storage.del('authToken');
        Helpdesk.trigger('authentication:logout');
      }
    });
  }
});
