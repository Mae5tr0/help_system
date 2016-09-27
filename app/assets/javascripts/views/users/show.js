Helpdesk.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  events: {
    'click a.user-edit': 'editUser'
  },

  initialize: function (userId) {
    this.userId = userId;
  },

  render: function () {
    this.model = new Helpdesk.Models.User({id: this.userId});
    this.model.fetch({
      success: function () {
        this.$el.html(this.template({user: this.model}));
      }.bind(this)
    });
  },

  editUser: function (el) {
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id + '/edit', {trigger: true});
  }
});
