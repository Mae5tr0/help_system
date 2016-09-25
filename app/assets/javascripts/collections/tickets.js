Helpdesk.Collections.Tickets = Backbone.Collection.extend({
  model: Helpdesk.Models.Ticket,
  url: '/api/v1/tickets',
  parse: function (response) {
    return response.tickets;
  }
});
