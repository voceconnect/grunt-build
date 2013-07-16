/*
 * grunt-build
 * Executes build steps targeting a specific environment
 *
 * Copyright (c) 2013 Mark Parolisi, Michael Pretty
 * Licensed under the MIT license.
 */

/*global module */
module.exports = function (grunt) {
    "use strict";
    grunt.initConfig({
        build: {
            options: {default: 'development'},
            development: ['coffeelint']
        },
        coffeelint: {
            app: ['tasks/*.coffee']
        }
    });

    grunt.loadTasks('tasks');

    grunt.loadNpmTasks('grunt-coffeelint');

    grunt.registerTask('default', ['build']);
};