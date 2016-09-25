Helpdesk.Router = Backbone.Router.extend({
  initialize: function () {
    console.log("initialize router");
  },

  routes: {
    '.*': 'index',

    'tickets': 'indexTickets',
    'tickets/:id': 'showTicket',
    'tickets/:id/edit': 'editTicket',
    'tickets/new': 'newTicket',

    'users': 'indexUsers',
    'users/:id': 'showUser',
    'users/:id/edit': 'editUser',

    'sign_up': 'newUser',
    'sign_in': 'sign_in'
  },

  index: function () {
    console.log("index");
    this.navigate("tickets", {trigger: true});
  },

  indexTickets: function () {
    console.log("indexTickets");
    var view = new Helpdesk.Views.TicketsIndex;
    view.render();
  },

  showTicket: function (ticketId) {
    console.log("showTicket");
    var view = new Helpdesk.Views.TicketShow(ticketId);
    view.render();
  },

  editTicket: function () {
    console.log("editTicket");
  },

  newTicket: function () {
    console.log("newTicket");
  },


  indexUsers: function () {
    console.log("indexTickets");
  },

  showUser: function () {
    console.log("showTickets");
  },

  editUser: function () {
    console.log("editTicket");
  },

  newUser: function () {
    console.log("newUser");
  }
});
