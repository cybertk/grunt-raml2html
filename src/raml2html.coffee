raml2html = require 'raml2html'
async = require 'async'

module.exports = (grunt) ->
  grunt.registerMultiTask 'raml2html', 'Compile raml files to html', ->
    done = @async()
    {mainTemplate, templatesPath} = @options()
    mainTemplate ?= false
    templatesPath ?= false

    async.eachSeries @files, ({src, dest}, next) ->
      grunt.log.debug "Compiling #{src} to #{dest}"

      [source] = src

      config = raml2html.getDefaultConfig mainTemplate, templatesPath

      raml2html.render source, config
      .then (html)->
        grunt.file.write dest, html
        grunt.log.writeln "file #{dest.cyan} created"
        next()
      .fail (error)->
        grunt.log.error error
        done false

      grunt.log.debug "Compiled #{src}"

    , done

    fileCount = @files.length
    grunt.log.ok "#{fileCount} #{grunt.util.pluralize fileCount, 'file/files'} compiled to html."

