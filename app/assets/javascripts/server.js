window.Helpdesk = {
  Models: {},
  Collections: {},
  Views: {},
  initialize: function() {
    console.log("start app");
    this.router = new Helpdesk.Router();
    Backbone.history.start({pushState: true});
  }
};

$(document).ready(function(){
    Helpdesk.initialize();
});
