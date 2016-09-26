Helpdesk.Views.TicketNew = Backbone.View.extend({
  template: JST['tickets/new'],

  events: {
    'submit #new-ticket': 'save'
  },

  initialize: function () {
  },

  render: function () {
    this.$el.html(this.template());
  },

  showError: function (errorMessage) {

  },

  formData: function (form) {
    var result = {};
    _.each($(form).serializeArray(), function (obj) {
      result[obj.name] = obj.value;
    });
    return result;
  },

  save: function (ev) {
    console.log('save');
    ev.preventDefault();
    ev.stopPropagation();
    var collection = new Helpdesk.Collections.Tickets();
    collection.create(this.formData(ev.currentTarget), {
      success: function () {
        console.log('success create');
        Helpdesk.router.navigate('tickets', {trigger: true});
      },
      error: this.showError.bind(this)
    })
  }
});
