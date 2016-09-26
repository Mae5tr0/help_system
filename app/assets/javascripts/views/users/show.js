Helpdesk.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  events: {
    'click a.edit-user': 'editUser'
  },

  initialize: function (userId) {
    this.userId = userId;
  },

  render: function () {
    this.model = new Helpdesk.Models.User({id: this.userId});
    this.model.fetch({
      success: function () {
        console.log("success");
        this.$el.html(this.template({user: this.model}));
      }.bind(this)
    });
  },

  editUser: function (el) {
    console.log('editTicket');
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id + '/edit', {trigger: true});
  }
});
