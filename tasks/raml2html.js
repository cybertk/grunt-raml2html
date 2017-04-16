(function() {
  var raml2html;

  raml2html = require('raml2html');

  module.exports = function(grunt) {
    return grunt.registerMultiTask('raml2html', 'Compile raml files to html', function() {
      var async, fileCount, item, main, resource, rootObject, templates, use_https, _ref;
      async = this.async;
      _ref = this.options(), rootObject = _ref.rootObject, use_https = _ref.use_https, templates = _ref.templates;
      if (rootObject == null) {
        rootObject = false;
      }
      if (use_https == null) {
        use_https = false;
      }
      if (templates == null) {
        templates = false;
      }
      main = templates.main, resource = templates.resource, item = templates.item;
      if (main == null) {
        main = false;
      }
      if (resource == null) {
        resource = false;
      }
      if (item == null) {
        item = false;
      }
      this.files.forEach(function(_arg) {
        var config, dest, done, source, src;
        src = _arg.src, dest = _arg.dest;
        grunt.log.debug("Compiling " + src + " to " + dest);
        source = src[0];
        done = async();
        config = raml2html.getDefaultConfig(use_https, main, resource, item);
        raml2html.render(source, config, function(html) {
          grunt.file.write(dest, html);
          grunt.log.writeln("File " + dest.cyan + " created.");
          return done();
        }, function(error) {
          grunt.log.error(error);
          return done();
        });
        return grunt.log.debug("Compiled " + src);
      });
      fileCount = this.files.length;
      return grunt.log.ok("" + fileCount + " " + (grunt.util.pluralize(fileCount, 'file/files')) + " compiled to html.");
    });
  };

}).call(this);
