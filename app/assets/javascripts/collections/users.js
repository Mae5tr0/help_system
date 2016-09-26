Helpdesk.Collections.Users = Backbone.Collection.extend({
  model: Helpdesk.Models.User,
  url: '/api/v1/users',
  authorize: true
});
