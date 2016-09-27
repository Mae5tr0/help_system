Helpdesk.Views.TicketsIndex = Backbone.View.extend({
  template: JST['tickets/index'],

  events: {
    'click a.create-ticket': 'createTicket',
    'submit #search-form': 'search'
  },

  render: function () {
    this.collection = new Helpdesk.Collections.Tickets;
    this.collection.fetch({
      success: function () {
        this.$el.html(this.template());
        this.render_collection(this.collection);
      }.bind(this)
    });
  },

  renderItem: function (model) {
    var itemView = new Helpdesk.Views.Ticket({model: model});
    this.$("tbody").append(itemView.render().el);
  },

  createTicket: function (el) {
    el.preventDefault();
    Helpdesk.router.navigate('/tickets/new', {trigger: true});
  },

  search: function (ev) {
    ev.preventDefault();
    ev.stopPropagation();
    var value = $(ev.currentTarget).find('#search-input').val();
    $.get({
      url: '/api/v1/tickets/search',
      data: ('query=' + value),
      headers: { 'Authorization': Helpdesk.storage.get('authToken') },
      success: function (response) {
        this.render_collection(new Helpdesk.Collections.Tickets(response));
      }.bind(this),
      error: function () {
        this.render_collection(new Helpdesk.Collections.Tickets([]));
      }.bind(this)
    });
  },

  render_collection: function (collection) {
    this.$("tbody").empty();
    collection.each(this.renderItem);
  }
});
