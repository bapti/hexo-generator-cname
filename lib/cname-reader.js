(function() {
  module.exports = function(hexo) {
    var ref;
    if ((hexo != null ? (ref = hexo.config) != null ? ref.cname : void 0 : void 0) == null) {
      throw new Error("You must add a cname property to _config.yml - i.e 'cname: google.com'");
    }
    return hexo.config.cname;
  };

}).call(this);
