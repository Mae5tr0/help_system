Helpdesk.Views.Ticket = Backbone.View.extend({
  template: JST['tickets/ticket'],
  tagName: 'tr',

  events: {
    'click a.show-ticket': 'showTicket',
    'click a.edit-ticket': 'editTicket',
    'click a.delete-ticket': 'deleteTicket'
  },

  render: function () {
    this.$el.html(this.template({ticket: this.model}));
    return this;
  },

  editTicket: function (el) {
    console.log('editTicket');
    el.preventDefault();
    Helpdesk.router.navigate('/tickets/' + this.model.id + '/edit', {trigger: true});
  },
  showTicket: function (el) {
    console.log('showTicket');
    el.preventDefault();
    Helpdesk.router.navigate('/tickets/' + this.model.id, {trigger: true});
  },
  deleteTicket: function (el) {
    console.log('deleteTicket');
    el.preventDefault();
    this.model.destroy();
    this.remove();
  }
});
