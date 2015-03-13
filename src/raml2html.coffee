raml2html = require 'raml2html'

module.exports = (grunt) ->
  grunt.registerMultiTask 'raml2html', 'Compile raml files to html', ->
    async = @async
    {rootObject, use_https, templates} = @options()
    rootObject ?= false
    use_https ?= false

    {main, resource, item} = templates
    main ?= false
    resource ?= false
    item ?= false

    @files.forEach ({src, dest}) ->
      grunt.log.debug("Compiling #{src} to #{dest}")

      [source] = src

      done = async()
      config = raml2html.getDefaultConfig(use_https, main, resource, item);
      raml2html.render source, config, (html) ->
        grunt.file.write dest, html
        grunt.log.writeln("File #{dest.cyan} created.")
        done()

      , (error) ->
        grunt.log.error(error)
        done()

      grunt.log.debug("Compiled #{src}")


    fileCount = @files.length
    grunt.log.ok("#{fileCount} #{grunt.util.pluralize(fileCount, 'file/files')} compiled to html.")
