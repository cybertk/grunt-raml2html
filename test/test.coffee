chai = require 'chai'

chai.should()

fs = require 'fs'

path = (filename) ->
  "#{__dirname}/../#{filename}"

# Actual test is started by `grunt raml2html`, here we only check the results of grunt task
describe 'raml2html task', ->

  before (done) ->
    # Actual test is started by `grunt raml2html`.
    done()

  describe 'compareDefault', ->

    it 'should compiles valid raml files to html', ->
      fs.existsSync(path 'assets/song.html').should.be.ok
