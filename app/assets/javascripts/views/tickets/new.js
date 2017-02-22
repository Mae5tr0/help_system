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

  showError: function (model, response) {
    response.errors.forEach(function(error) {
      console.log(error);

      var $attributeFormGroup = this.$el.find('.' + error.attribute + '-group');
      $attributeFormGroup.addClass('has-error');
      $attributeFormGroup.find('.error-message').text(error.message).show();
    }.bind(this));
  },

  formData: function () {
    return {
      title: this.$el.find('#title').val(),
      content: this.$el.find('#content').val()
    };
  },

  save: function (ev) {
    ev.preventDefault();
    ev.stopPropagation();

    var collection = new Helpdesk.Collections.Tickets();
    collection.create(this.formData(ev.currentTarget), {
      success: function () {
        Helpdesk.router.navigate('tickets', {trigger: true});
      },
      error: this.showError.bind(this)
    })
  }
});
