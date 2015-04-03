
console.log "running cname generator"


hexo.extend.generator.register(
  'cname', 
  require("./cname-generator")
  )