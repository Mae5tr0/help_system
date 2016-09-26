var _sync = Backbone.sync;
Backbone.sync = function (method, model, options) {
  if (model.authorize) {
    options.beforeSend = function (xhr) {
      xhr.setRequestHeader('Authorization' , Helpdesk.storage.get('authToken'));
    };
  }
  var errorCallback = options.error;
  options.error = function (xhr, status, errorThrown) {
    //logout after any unauthorized request
    if (model.authorize && xhr.status == 401) {
      Helpdesk.storage.del('authToken');
      Helpdesk.trigger('authentication:logout');
      return;
    }
    errorCallback.call(this, xhr, status, errorThrown)
  };
  _sync.call(this, method, model, options);
};