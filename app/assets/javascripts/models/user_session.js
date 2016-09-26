Helpdesk.Models.UserSession = Backbone.Model.extend({
  url: 'api/v1/users/sign_in',

  defaults: {
    "email": "",
    "password": ""
  }
});
