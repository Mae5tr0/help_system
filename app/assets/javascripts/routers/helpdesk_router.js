Helpdesk.Router= Backbone.Router.extend({
  initialize: function () {
    console.log("initialize routes");
  },

  routes: {
    'tickets': 'tickets',
    'users': 'users'
  },

  tickets: function () {
    //@view = new Blog.Views.Posts.IndexView(collection: @posts)
    //$("#posts").html(@view.render().el)
    console.log("tickets");
    //self.view = new Helpdesk.Views.UsersIndex({collection: self.tickets});
  },

  users: function () {
    console.log("users");
  }
});
