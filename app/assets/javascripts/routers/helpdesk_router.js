Helpdesk.Router = Backbone.Router.extend({
  initialize: function () {
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
    this.navigate("tickets", {trigger: true});
  },

  indexTickets: function () {
    this.show(new Helpdesk.Views.TicketsIndex);
  },

  showTicket: function (ticketId) {
    this.show(new Helpdesk.Views.TicketShow(ticketId));
  },

  editTicket: function (ticketId) {
    this.show(new Helpdesk.Views.TicketEdit(ticketId));
  },

  newTicket: function () {
    this.show(new Helpdesk.Views.TicketNew());
  },

  indexUsers: function () {
    this.show(new Helpdesk.Views.UsersIndex());
  },

  showUser: function (userId) {
    this.show(new Helpdesk.Views.UserShow(userId));
  },

  editUser: function (userId) {
    this.show(new Helpdesk.Views.UserEdit(userId));
  },

  login: function () {
    var view = new Helpdesk.Views.Login();
    view.render();
  },

  show: function (contentView) {
    var view = new Helpdesk.Views.Main({model: contentView});
    view.render();
  }
});
