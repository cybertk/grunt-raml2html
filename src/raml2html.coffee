raml2html = require 'raml2html'
async = require 'async'

module.exports = (grunt) ->
  grunt.registerMultiTask 'raml2html', 'Compile raml files to html', ->
    done = @async()
    {rootObject, use_https, templates} = @options()
    rootObject ?= false
    use_https ?= false
    templates ?= false

    {main, resource, item} = templates
    main ?= false
    resource ?= false
    item ?= false

    async.eachSeries @files, ({src, dest}, next) ->
      grunt.log.debug("Compiling #{src} to #{dest}")

      [source] = src

      config = raml2html.getDefaultConfig(use_https, main, resource, item);
      raml2html.render source, config, (html) ->
        grunt.file.write dest, html
        grunt.log.writeln("File #{dest.cyan} created.")
        next()

      , (error) ->
        grunt.log.error(error)
        next()

      grunt.log.debug("Compiled #{src}")

    , done


    fileCount = @files.length
    grunt.log.ok("#{fileCount} #{grunt.util.pluralize(fileCount, 'file/files')} compiled to html.")
