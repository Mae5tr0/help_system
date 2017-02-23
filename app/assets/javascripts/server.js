window.Helpdesk = {
  Models: {},
  Collections: {},
  Views: {},
  Libs: {},
  initialize: function() {
    this.router = new Helpdesk.AppRouter();
    this.storage = new Helpdesk.Libs.Storage();

    Helpdesk.on('authentication:login', function () {
      this.loadProfile(function () {
        Helpdesk.router.navigate('tickets', {trigger: true});
      });
    }.bind(this));
    Helpdesk.on('authentication:logout', function () {
      Helpdesk.router.navigate('login', {trigger: true});
    });

    var token = Helpdesk.storage.get('authToken');
    if (token == undefined) {
      window.history.pushState('', '', '/login');
      Backbone.history.start({pushState: true});
      return;
    }
    this.loadProfile(function () {
      Backbone.history.start({pushState: true});
    });
  },

  loadProfile: function (cb) {
    Helpdesk.profile = new Helpdesk.Models.Profile();
    Helpdesk.profile.fetch({
      success: cb,
      error: function () {
        Helpdesk.router.navigate('login', {trigger: true});
      }
    })
  }
};