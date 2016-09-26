Helpdesk.Views.Login = Backbone.View.extend({

  template: JST['users/login'],

  el: 'body',

  events: {
    'click .sign-in': 'signIn',
    'click .sign-up': 'signUp'
  },

  render: function () {
    this.$el.html(this.template())
  },

  showErrorMessage: function (message) {
    console.log("show error message");
    console.log(message);
  },

  formData: function() {
   return {
     email: this.$el.find('#inputEmail').val(),
     password: this.$el.find('#inputPassword').val()
   }
  },

  successLogin: function (model, response) {
    console.log("success login");
    console.log(response);
    var token = response.value;
    Helpdesk.storage.set('authToken', response.value);
    Helpdesk.trigger('authentication:login');
  },

  errorLogin: function (model, response) {
    console.log("error login");
    console.log(response);
    //var errorMessage = response.responseJSON.meta.error_message;
    //console.log(errorMessage);
    //this.showErrorMessage(errorMessage);
  },

  signIn: function (ev) {
    console.log('sign in');
    ev.preventDefault();
    var session = new Helpdesk.Models.UserSession();
    session.save(this.formData(),
      {
        success: this.successLogin,
        error: this.errorLogin.bind(this)
      }
    );
  },

  signUp: function (ev) {
    console.log('sign up');
    ev.preventDefault();
    var user = new Helpdesk.Models.User();
    user.save(this.formData(),
      {
        success: this.successLogin,
        error: this.errorLogin.bind(this)
      }
    );
  }
});
