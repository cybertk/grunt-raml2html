## grunt-raml2html

> Compile RAML to HTML

[![Build Status](http://img.shields.io/travis/cybertk/grunt-raml2html.svg?style=flat)](https://travis-ci.org/cybertk/grunt-raml2html)
[![Dependency Status](https://david-dm.org/cybertk/grunt-raml2html.png)](https://david-dm.org/cybertk/grunt-raml2html)
[![devDependency Status](https://david-dm.org/cybertk/grunt-raml2html/dev-status.svg)](https://david-dm.org/cybertk/grunt-raml2html#info=devDependencies)
[![Coverage Status](https://coveralls.io/repos/cybertk/grunt-raml2html/badge.png?branch=master)](https://coveralls.io/r/cybertk/grunt-raml2html?branch=master)

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-raml2thml --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-raml2html');
```

## The "raml2html" task

### Overview
In your project's Gruntfile, add a section named `raml2html` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  raml2html: {
    options: {
      // Task-specific options go here.
    },
    default: {
      // Target-specific file lists and/or options go here.
    },
  },
});
```

### Options

#### options.separator
Type: `String`
Default value: `',  '`

A string value that is used to do something with whatever.

#### options.punctuation
Type: `String`
Default value: `'.'`

A string value that is used to do something else with whatever else.

### Usage Examples

#### Default Options
In this example, the default options are used to do something with whatever. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result would be `Testing, 1 2 3.`

```js
grunt.initConfig({
  raml2html: {
    options: {},
    files: {
      'dest/api.html': ['api.raml'],
    },
  },
});
```

#### Custom Options
In this example, custom options are used to do something else with whatever else. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result in this case would be `Testing: 1 2 3 !!!`

```js
grunt.initConfig({
  raml2html: {
    options: {
      separator: ': ',
      punctuation: ' !!!',
    },
    files: {
      'dest/api.html': ['src/github.raml'],
    },
  },
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).
