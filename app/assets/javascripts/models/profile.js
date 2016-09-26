Helpdesk.Models.Profile = Backbone.Model.extend({
  url: 'api/v1/users/profile',
  authorize: true,
  defaults: {
    "email": "",
    "password": "",
    "role": "guest"
  },
  isAdmin: function () {
    return this.get('role') == 'admin';
  },
  isSupport: function () {
    return this.get('role') == 'support';
  },
  isCustomer: function () {
    return this.get('role') == 'customer';
  }
});
