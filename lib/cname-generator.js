(function() {
  var reader;

  reader = require('./cname-reader');

  module.exports = function(locals) {
    return {
      path: 'CNAME',
      data: reader(hexo)
    };
  };

}).call(this);
