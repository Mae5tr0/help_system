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
        console.log("success");
        this.$el.html(this.template({ticket: this.model}));
      }.bind(this)
    });
  },

  showError: function () {
    console.log('show error');
  },

  closeTicket: function (el) {
    console.log('closeTicket');
    el.preventDefault();
    this.model.save({status: 'close'}, {
      patch: true,
      success: function () {
        console.log('success closeTicket');
        Helpdesk.router.navigate('tickets', {trigger: true});
      },
      error: this.showError.bind(this)
    });
  }
});
