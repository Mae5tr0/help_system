Helpdesk.Views.Login = Backbone.View.extend({

  template: JST['users/login'],

  el: 'body',

  events: {
    'click .sign-in': 'signIn',
    'click .sign-up': 'signUp'
  },

  initialize: function () {

  },

  render: function () {
    this.$el.html(this.template())
  },

  signIn: function (ev) {
    console.log('sign in');
    ev.preventDefault();
  },

  showErrorMessage: function (message) {
    console.log("show error message");
    console.log(message);
  },

  signUp: function (ev) {
    console.log('sign up');
    ev.preventDefault();
    var book = new Helpdesk.Models.User();
    book.save(
      {
        email: this.$el.find('#inputEmail').val(),
        password: this.$el.find('#inputPassword').val()
      },
      {
        success: function (model, response) {
          console.log("success sign up");
          var token = response.value;
          console.log(token);
          Helpdesk.storage.set('authToken', token);
          Helpdesk.trigger('login');
        },
        error: function (model, response) {
          console.log("error sign up");
          var errorMessage = response.responseJSON.meta.error_message;
          console.log(errorMessage);
          this.showErrorMessage(errorMessage);
        }.bind(this)
      }
    );
  }
});
