Helpdesk.Views.TicketShow = Backbone.View.extend({
  template: JST['tickets/show'],

  el: '#content',

  events: {
    'click a.edit-ticket': 'editTicket'
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

  editTicket: function (el) {
    console.log('editTicket');
    el.preventDefault();
    Helpdesk.router.navigate('/tickets/' + this.model.id + '/edit', true);
  },
});
