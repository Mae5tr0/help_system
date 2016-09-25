Helpdesk.Models.User = Backbone.Model.extend({
  urlRoot: '/api/v1/users',
  parse: function (response) {
    if (response.user === undefined) {
      return response;
    }
    response.user;
  }
});
