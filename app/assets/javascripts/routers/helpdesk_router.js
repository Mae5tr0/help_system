Helpdesk.Router = Backbone.Router.extend({
  initialize: function () {
    this.currentView = null;
    this.mainView = null;
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
    this.currentView = new Helpdesk.Views.Login();
    this.currentView.render();
    $('body').html(this.currentView.el);
  },

  show: function (contentView) {
    if (this.currentView) {
      this.currentView.remove();
    }
    if (this.mainView) {
      this.mainView.remove();
    }
    this.currentView = contentView;
    this.mainView = new Helpdesk.Views.Main({model: contentView});
    this.mainView.render();
    $('body').html(this.mainView.el);
  }
});
