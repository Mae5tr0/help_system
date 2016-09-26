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
    console.log('editUser');
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id + '/edit', {trigger: true});
  },
  showUser: function (el) {
    console.log('showUser');
    el.preventDefault();
    Helpdesk.router.navigate('/users/' + this.model.id, {trigger: true});
  }
});
