module.exports = (locals) -> 
  return {
    path: 'CNAME'
    data: readCNAME(@.config)
  }

readCNAME = (config) ->
  unless config?.cname?
   throw new Error "You must add a cname property to _config.yml - i.e 'cname: hexo.io'"
  config.cname