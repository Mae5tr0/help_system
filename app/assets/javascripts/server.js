window.Helpdesk = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    console.log("start app");
    window.router = new Helpdesk.Router();
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
    Helpdesk.initialize();
});
