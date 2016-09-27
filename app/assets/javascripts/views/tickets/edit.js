Helpdesk.Views.TicketEdit = Backbone.View.extend({
  template: JST['tickets/edit'],

  events: {
    'click button.close-ticket': 'closeTicket'
  },

  initialize: function (ticketId) {
    this.ticketId = ticketId;
  },

  render: function () {
    this.model = new Helpdesk.Models.Ticket({id: this.ticketId});
    this.model.fetch({
      success: function () {
        this.$el.html(this.template({ticket: this.model}));
      }.bind(this)
    });
  },

  showError: function () {
  },

  closeTicket: function (el) {
    el.preventDefault();
    this.model.save({status: 'closed'}, {
      patch: true,
      success: function () {
        Helpdesk.router.navigate('tickets', {trigger: true});
      },
      error: this.showError.bind(this)
    });
  }
});
