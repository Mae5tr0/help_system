Helpdesk.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  render: function () {
    this.collection = new Helpdesk.Collections.Users;
    this.collection.fetch({
      success: function () {
        this.$el.html(this.template());
        this.collection.each(this.renderItem);
      }.bind(this)
    });
  },

  renderItem: function (model) {
    var itemView = new Helpdesk.Views.User({model: model});
    this.$("tbody").append(itemView.render().el);
  }
});
