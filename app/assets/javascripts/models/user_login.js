Helpdesk.Models.UserLogin = Backbone.Model.extend({
  url: 'api/v1/users/sign_in',

  defaults: {
    "email": "",
    "password": ""
  }
});
