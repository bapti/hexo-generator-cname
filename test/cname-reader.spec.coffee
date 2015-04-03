should = require("should")
cnameReader = require("./../src/cname-reader")


describe 'Given a cname reader', ->
  describe 'When invalid config is passed', ->
    it 'Then an error should be thrown for undefined', ->
      sut = () -> cnameReader(undefined)
      should(sut).throw

    it 'Then an error should be thrown for undefined', ->
      sut = () -> cnameReader(null)
      should(sut).throw

    it 'Then an error should be thrown for empty', ->
      sut = () -> cnameReader({
        config: {
          cname: ""
        }
      })
      should(sut).throw

  describe 'When valid config is passed', ->
    it 'Then cname should be returned', ->
      result = cnameReader({
        config: {
          cname: "hexo.io"
        }
      })
      result.should.equal("hexo.io")