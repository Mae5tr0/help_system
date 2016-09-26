Helpdesk.Views.UserEdit = Backbone.View.extend({
  template: JST['users/edit'],

  events: {
    'submit #change-role': 'changeRole'
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

  showError: function () {
    console.log('show error');
  },

  changeRole: function (ev) {
    console.log('changeRole');
    ev.preventDefault();
    ev.stopPropagation();
    this.model.save({role: this.$el.find('#roles option:selected').text()}, {
      patch: true,
      success: function () {
        console.log('success changeRole');
        Helpdesk.router.navigate('users', {trigger: true});
      },
      error: this.showError.bind(this)
    });
  }
});
