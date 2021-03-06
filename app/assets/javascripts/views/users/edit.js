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
        this.$el.html(this.template({user: this.model}));
      }.bind(this)
    });
  },

  changeRole: function (ev) {
    ev.preventDefault();
    ev.stopPropagation();
    this.$el.find('.error-message').text('').hide();

    this.model.save({role: this.$el.find('#roles option:selected').text()}, {
      patch: true,
      success: function () {
        Helpdesk.router.navigate('users', {trigger: true});
      },
      error: function (model, error) {
        this.$el.find('.error-message').text(error.message).show();
      }.bind(this)
    });
  }
});
