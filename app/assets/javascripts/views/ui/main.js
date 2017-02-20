Helpdesk.Views.Main = Backbone.View.extend({
  template: JST['ui/main'],
  el: 'body',

  events: {
    'click .logout': 'logout',

    //navigation
    'click .nav-sidebar a.tickets': 'tickets',
    'click .nav-sidebar a.users': 'users',

    'click a.navbar-brand': 'index'
  },

  render: function () {
    this.$el.html(this.template());
    this.model.setElement(this.$el.find('#content'));
    this.model.render();
    this.$el.find('.nav-sidebar a' + '.' + this.currentLocation()).parent().addClass('active')
  },

  logout: function (ev) {
    ev.preventDefault();
    var session = new Helpdesk.Models.UserLogout({id: 1});
    session.destroy({
      success: function () {
        Helpdesk.storage.del('authToken');
        Helpdesk.profile = undefined;
        Helpdesk.trigger('authentication:logout');
      }
    });
  },

  currentLocation: function () {
    return window.location.pathname.split('/')[1];
  },

  index: function (ev) {
    ev.preventDefault();
    Helpdesk.router.navigate('tickets', { trigger: true });
  },

  tickets: function (ev) {
    ev.preventDefault();
    Helpdesk.router.navigate('tickets', { trigger: true });
  },

  users: function (ev) {
    ev.preventDefault();
    Helpdesk.router.navigate('users', {trigger: true});
  }
});
