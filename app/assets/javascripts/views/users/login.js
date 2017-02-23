Helpdesk.Views.Login = Backbone.View.extend({
  template: JST['users/login'],
  className: 'container',

  events: {
    'click .sign-in': 'signIn',
    'click .sign-up': 'signUp'
  },

  render: function () {
    this.$el.html(this.template());

    //TODO development
    // admin
    // this.$el.find('#inputEmail').val('admin@example.com');
    // this.$el.find('#inputPassword').val('12345678');

    // support
    // this.$el.find('#inputEmail').val('support@example.com');
    // this.$el.find('#inputPassword').val('12345678');

    // customer
    // this.$el.find('#inputEmail').val('customer@example.com');
    // this.$el.find('#inputPassword').val('12345678');

    this.$formErrorMessage = this.$el.find('.base-error')
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

  errorSignUp: function (model, response) {
    response.errors.forEach(function(error) {
      var $attributeFormGroup = this.$el.find('.' + error.attribute + '-group');
      $attributeFormGroup.addClass('has-error');
      $attributeFormGroup.find('.error-message').text(error.message).show();
    }.bind(this));
  },

  errorSignIn: function (model, response) {
    this.$formErrorMessage.text(response.message).show();
  },

  signIn: function (ev) {
    ev.preventDefault();
    this.hideErrorMessage();

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
    this.hideErrorMessage();

    var user = new Helpdesk.Models.User();
    user.save(this.formData(),
      {
        success: this.successLogin,
        error: this.errorSignUp.bind(this)
      }
    );
  },

  hideErrorMessage: function () {
    this.$formErrorMessage.text('').hide();
    this.$el.find('.form-group .error-message').text('').hide();
  }
});
