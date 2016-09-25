Helpdesk.Views.TicketsIndex = Backbone.View.extend({
  template: JST['tickets/index'],

  el: '#content',

  events: {
    'click a.create-ticket': 'createTicket'
  },

  render: function () {
    this.collection = new Helpdesk.Collections.Tickets;
    this.collection.fetch({
      success: function () {
        this.$el.html(this.template());
        this.collection.each(this.renderItem);
      }.bind(this),
      error: function() {
        console.log("fail to fetch tickets");
      }
    });
  },

  renderItem: function (model) {
    var itemView = new Helpdesk.Views.Ticket({model: model});
    this.$("tbody").append(itemView.render().el);
  },

  createTicket: function (el) {
    console.log('createTicket');
    el.preventDefault();
    Helpdesk.router.navigate('/tickets/new', true);
  }
});
