Helpdesk.Models.Ticket = Backbone.Model.extend({
  urlRoot: '/api/v1/tickets',
  parse: function (response) {
    if (response.ticket === undefined) {
      return response;
    }
    response.ticket;
  }
});
