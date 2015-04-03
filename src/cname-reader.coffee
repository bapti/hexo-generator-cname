module.exports = (hexo) ->
  unless hexo?.config?.cname?
   throw new Error "You must add a cname property to _config.yml - i.e 'cname: google.com'"
  hexo.config.cname