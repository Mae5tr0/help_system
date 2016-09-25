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
    }
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
  _.extend(Helpdesk, Backbone.Events);
  Helpdesk.initialize();
});
