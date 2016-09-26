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

    'login': 'login'
  },

  index: function () {
    console.log("index");
    this.navigate("tickets", {trigger: true});
  },

  indexTickets: function () {
    console.log("indexTickets");
    this.show(new Helpdesk.Views.TicketsIndex);
    //var view = new Helpdesk.Views.Main(new Helpdesk.Views.TicketsIndex);
    //var view = new Helpdesk.Views.TicketsIndex;
    //view.render();
  },

  showTicket: function (ticketId) {
    console.log("showTicket");
    var view = new Helpdesk.Views.TicketShow(ticketId);
    view.render();
  },

  editTicket: function (tickedId) {
    console.log("editTicket");
    var view = new Helpdesk.Views.TicketEdit(ticketId);
    view.render();
  },

  newTicket: function () {
    console.log("newTicket");
    var view = new Helpdesk.Views.TicketNew();
    view.render();
  },

  indexUsers: function () {
    console.log("indexTickets");
    var view = new Helpdesk.Views.TicketShow();
    view.render();
  },

  showUser: function (userId) {
    console.log("showTickets");
    var view = new Helpdesk.Views.UserShow(userId);
    view.render();
  },

  editUser: function (userId) {
    console.log("editTicket");
    var view = new Helpdesk.Views.UserEdit(userId);
    view.render();
  },

  login: function () {
    console.log("login");
    var view = new Helpdesk.Views.Login();
    view.render();
  },

  show: function (contentView) {
    var view = new Helpdesk.Views.Main({model: contentView});
    view.render();
  }
});
