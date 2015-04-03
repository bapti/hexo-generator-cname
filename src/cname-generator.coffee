reader = require './cname-reader'

module.exports = (locals) -> 
  return {
    path: 'CNAME'
    data: reader(hexo)
  }