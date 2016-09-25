Helpdesk.Libs.Storage = function Storage(userNameSpace) {
  var namespace = userNameSpace;
  if (namespace == undefined) {
    namespace = 'helpdesk';
  }

  function storageKey(key) {
    return namespace + ":" + key;
  }
  this.get = function get(key) {
    return localStorage[storageKey(key)];
  };
  this.set = function set(key, value) {
    localStorage[storageKey(key)] = value;
  };
  this.remove = function remove(key) {
    localStorage.removeItem(storageKey(key));
  };
};