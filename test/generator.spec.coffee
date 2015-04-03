should = require('should')
Hexo = require('hexo')

describe 'Given a cname generator', ->
  hexo = new Hexo( __dirname, { silent: true } )
  generator = require('./../src/generator').bind(hexo)

  describe 'When we pass "hexo.io" as the cname', ->
    hexo.config = {
      cname: "hexo.io"
    }
    result = generator( null )

    it 'Then the file path should be CNAME', ->
      result.path.should.equal('CNAME')

    it 'Then the data  should be "hexo.io"', ->
      result.data.should.equal("hexo.io")

  describe 'When cname is an empty string', ->
    hexo.config = { cname: "" }
    sut = () -> generator( null )
    
    it 'Then an error should be thrown', ->
      should(sut).throw("You must add a cname property to _config.yml - i.e 'cname: hexo.io'")

  describe 'When cname is null', ->
    hexo.config = { cname: null }
    sut = () -> generator( null )
    
    it 'Then an error should be thrown', ->
      should(sut).throw("You must add a cname property to _config.yml - i.e 'cname: hexo.io'")

  describe 'When cname is undefined', ->
    hexo.config = { cname: null }
    sut = () -> generator( null )

    it 'Then an error should be thrown', ->
      should(sut).throw("You must add a cname property to _config.yml - i.e 'cname: hexo.io'")

