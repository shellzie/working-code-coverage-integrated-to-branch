'use strict';

module.exports = function(grunt) {

    require('load-grunt-tasks')(grunt);

    // Define the configuration for all the tasks
    grunt.initConfig({

        // Project settings
        dirs: {
            // configurable paths
            app: 'dev',
            coverageE2E: 'coverage/e2e',
            instrumentedE2E: '<%= dirs.coverageE2E %>/instrumented',     //dev/coverage/e2e/instrumented/dev
            jsAppDir: '<%= dirs.instrumentedE2E %>/<%= dirs.app %>/spec/dummy/app/assets/javascripts',
            jsLibDir: '<%= dirs.instrumentedE2E %>/<%= dirs.app %>/spec/dummy/lib/assets/javascripts/harmony/assets/standard/js'
        },

        clean: {
            coverageE2E: {   //delete whole coverage dir
                src: ['<%= dirs.coverageE2E %>/']
            },
            javascriptApp: {     //delete js files under coverage/e2e/instrumented/spec/dummy/app
                src: ['<%= dirs.jsAppDir %>/*.js']
            },
            javascriptLib: {     //delete js files under coverage/e2e/instrumented/spec/dummy/lib
                src: ['<%= dirs.jsLibDir %>/*.js']
            }
        },

        // Copies all source files to /coverage/e2e/instrumented    (js, html, css, images, etc)
        copy: {
            coverageE2E: {
                files: [{
                    expand: true,
                    dot: true,
                    cwd: '<%= dirs.app %>',
                    dest: '<%= dirs.instrumentedE2E %>/<%= dirs.app %>',
                    src: [
                        './**/*'
                    ]
                }]
            }
        },

        instrument: {
            files: [
                '<%= dirs.app %>/spec/dummy/app/assets/javascripts/*.js',
                '<%= dirs.app %>/spec/dummy/lib/assets/javascripts/harmony/assets/standard/js/*.js'
                //'<%= dirs.app %>/app/assets/javascripts/*.js',
                //'<%= dirs.app %>/lib/assets/javascripts/harmony/assets/**/*.js'
            ],
            options: {
                lazy: true,        //take instrumented js files and save them to dev/coverage/e2e/instrumented/dev/spec/dummy.....
                basePath: '<%= dirs.instrumentedE2E %>/'
            }
        },

        boot_rails_async: {
            default_options: {
                options: {
                    cwd: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/coverage/e2e/instrumented/dev/spec/dummy',
                    gem_path: '/Users/mkam1/.rvm/gems/ruby-1.9.3-p194@showroom_harmony_cms:/Users/mkam1/.rvm/gems/ruby-1.9.3-p194@global'
                }
            }
        },

        protractor_coverage: {
            options: {
                configFile: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/dev/spec/dummy/test/js/functional/protractor/protractorConf.js', // '<%= dirs.app %>/spec/dummy/test/js/functional/protractor/protractorConf.js',
                keepAlive: true, // If false, the grunt process stops when the test fails.
                noColor: false, // If true, protractor will not use colors in its output.
                coverageDir: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/coverage/e2e/instrumented',//<%= dirs.instrumentedE2E %>',
                args: {}
            },
            chrome: {
                options: {
                    args: {
                        baseUrl: 'http://localhost:3000/',
                        // Arguments passed to the command
                        'browser': 'chrome'
                    }
                }
            }
        },

        makeReport: {
            src: '<%= dirs.instrumentedE2E %>/*.json',
            options: {
                type: 'lcov',
                dir: '<%= dirs.coverageE2E %>/reports',
                print: 'detail'
            }
        }
    });

    grunt.registerTask('default', ['instrumentation', 'server', 'execution']);

    grunt.registerTask('instrumentation', [
        'clean:coverageE2E',
        'copy:coverageE2E',
        'clean:javascriptApp',
        'clean:javascriptLib',
        'instrument'
    ]);

    grunt.registerTask('rails', [
        'boot_rails_async'
        ]);

    grunt.registerTask('execution', [
        'protractor_coverage:chrome',
        'makeReport'
    ]);

    grunt.registerTask('all', [
        'clean:coverageE2E',
        'copy:coverageE2E',
        'clean:javascriptApp',
        'clean:javascriptLib',
        'instrument',
        'boot_rails_async:default_options',
        'protractor_coverage:chrome',
        'makeReport'
    ]);
};