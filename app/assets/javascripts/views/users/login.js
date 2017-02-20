Helpdesk.Views.Login = Backbone.View.extend({
  template: JST['users/login'],

  el: 'body',

  events: {
    'click .sign-in': 'signIn',
    'click .sign-up': 'signUp'
  },

  render: function () {
    this.$el.html(this.template());
    //TODO development
    this.$el.find('#inputEmail').val('admin@example.com');
    this.$el.find('#inputPassword').val('very_secret_password');
  },

  showErrorMessage: function (message) {
  },

  formData: function() {
   return {
     email: this.$el.find('#inputEmail').val(),
     password: this.$el.find('#inputPassword').val()
   }
  },

  successLogin: function (model, response) {
    Helpdesk.storage.set('authToken', response.token);
    Helpdesk.trigger('authentication:login');
  },

  errorLogin: function (model, response) {

  },

  errorSignIn: function (model, response) {

  },

  signIn: function (ev) {
    ev.preventDefault();
    var login = new Helpdesk.Models.UserLogin();
    login.save(this.formData(),
      {
        success: this.successLogin,
        error: this.errorSignIn.bind(this)
      }
    );
  },

  signUp: function (ev) {
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
