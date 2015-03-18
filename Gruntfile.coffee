module.exports = (grunt) ->

  require('time-grunt') grunt

  # Dynamically load npm tasks
  require('jit-grunt') grunt

  # Actually load this plugin's task(s).
  grunt.loadTasks('tasks')

  grunt.initConfig

    # Watching changes files *.js,
    watch:
      all:
        files: [
          "Gruntfile.coffee"
          "src/**/*.coffee"
          "test/**/*.coffee"
        ]
        tasks: [
          "coffee"
          "mochaTest"
        ]
        options:
          nospawn: true

    coffee:
      compile:
        expand: true,
        flatten: true,
        src: ['src/*.coffee'],
        dest: 'tasks/',
        ext: '.js'

    coffeecov:
      compile:
        src: 'src'
        dest: 'tasks'

    mochaTest:
      test:
        options:
          reporter: 'mocha-phantom-coverage-reporter'
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']

    shell:
      coveralls:
        command: 'cat coverage/coverage.lcov | ./node_modules/coveralls/bin/coveralls.js src'

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ['assets']

    # Configuration to be run (and then tested).
    raml2html:
      compileDefault:
        expand: true,
        flatten: true,
        src: ['test/fixtures/song.raml'],
        dest: 'assets/',
        ext: '.html'


  grunt.registerTask 'uploadCoverage', ->
    return grunt.log.ok 'Bypass uploading' unless process.env['TRAVIS'] is 'true'

    grunt.task.run 'shell:coveralls'

  grunt.registerTask "default", [
    "watch"
  ]

  grunt.registerTask "test", [
    "coffeecov"
    "raml2html"
    "mochaTest"
    "uploadCoverage"
  ]

  return
