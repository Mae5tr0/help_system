window.Helpdesk = {
  Models: {},
  Collections: {},
  Views: {},
  Libs: {},
  initialize: function() {
    console.log("start app");
    this.router = new Helpdesk.Router();
    this.storage = new Helpdesk.Libs.Storage();
    var token = Helpdesk.storage.get('authToken');
    if (token == undefined) {
      window.history.pushState('', '', '/login');
      Backbone.history.start({pushState: true});
      return;
    }
    this.loadProfile(function () {
      Backbone.history.start({pushState: true});
    });

    Helpdesk.on('authentication:login', function () {
      this.loadProfile(function () {
        Helpdesk.router.navigate('tickets', {trigger: true});
      });
    }.bind(this));
    Helpdesk.on('authentication:logout', function () {
      Helpdesk.router.navigate('login', {trigger: true});
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

$(document).ready(function(){
  _.extend(Helpdesk, Backbone.Events);
  Helpdesk.initialize();
});
