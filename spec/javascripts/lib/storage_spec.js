describe("Storage", function() {
  describe('default namespace', function () {
    var storage;

    beforeEach(function () {
      storage = new Helpdesk.Libs.Storage();
      localStorage.clear();
    });

    it('#get', function () {
      localStorage['helpdesk:key'] = 'test';

      expect(storage.get('key')).toEqual('test');
    });

    it('#set', function () {
      storage.set('long_key', 'value');

      expect(localStorage['helpdesk:long_key']).toEqual('value');
    });

    it('#del', function () {
      localStorage['helpdesk:secret'] = 'pass';

      storage.del('secret');

      expect(localStorage['helpdesk:secret']).toBeUndefined();
    });
  });

  it('custom namespace', function () {
    var storage = new Helpdesk.Libs.Storage('another_namespace');
    storage.set('long_key', 'value');

    expect(localStorage['another_namespace:long_key']).toEqual('value');
  });
});
