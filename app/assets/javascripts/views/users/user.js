Helpdesk.Views.User = Backbone.View.extend({
  template: JST['users/user'],
  tagName: 'tr',

  events: {
    'click a.show-user': 'showUser',
    'click a.edit-user': 'editUser'
  },

  render: function () {
    this.$el.html(this.template({user: this.model}));
    return this;
  },

  editUser: function (el) {
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id + '/edit', {trigger: true});
  },
  showUser: function (el) {
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id, {trigger: true});
  }
});
