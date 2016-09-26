Helpdesk.Router = Backbone.Router.extend({
  initialize: function () {
    console.log("initialize router");
  },

  routes: {
    '.*': 'index',

    'tickets': 'indexTickets',
    'tickets/new': 'newTicket',
    'tickets/:id': 'showTicket',
    'tickets/:id/edit': 'editTicket',

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
  },

  showTicket: function (ticketId) {
    console.log("showTicket");
    this.show(new Helpdesk.Views.TicketShow(ticketId));
  },

  editTicket: function (ticketId) {
    console.log("editTicket");
    this.show(new Helpdesk.Views.TicketEdit(ticketId));
  },

  newTicket: function () {
    console.log("newTicket");
    this.show(new Helpdesk.Views.TicketNew());
  },

  indexUsers: function () {
    console.log("indexUsers");
    this.show(new Helpdesk.Views.UsersIndex());
  },

  showUser: function (userId) {
    console.log("showUser");
    this.show(new Helpdesk.Views.UserShow(userId));
  },

  editUser: function (userId) {
    console.log("editUser");
    this.show(new Helpdesk.Views.UserEdit(userId));
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
