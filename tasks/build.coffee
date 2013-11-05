###
grunt-build
@usage:
  "build" : {
    "options": {
      "default": "development"
    }
    "production" : ["coffee", "compass:production"],
    "production" : ["coffee", "compass:staging"],
    "development": ["coffeelint", "coffee", "compass:staging",
      "phpcs", "phpdoc"]
  }
###
module.exports = (grunt) ->
  desc = 'Task lists for different environment builds'
  grunt.registerTask('build', desc, (env) ->
    options = this.options({'default': 'staging'})

    #if the env isn't set, or doesn't exist, use the default
    if !env || !grunt.config('build.' + env)
      env = options.default

    grunt.config.requires('build.' + env)
    grunt.task.run(grunt.config('build.' + env))
  )