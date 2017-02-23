window.FAKE_SEVER = {
  validResponse: function(fixtureName) {
    return [
      200,
      {"Content-Type": "application/json"},
      JSON.stringify(window.FIXTURES[fixtureName])
    ];
  }
};