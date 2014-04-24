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
//
//        shell: {
//            rails_server: {
//                command: 'rails server',
//                options: {
//                    async: true,     //an async process will be terminated when grunt finishes
//                    execOptions: {
//                        cwd: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/dev/spec/dummy/coverage/instrumented'
//                    }
//                }
//            },
//            selenium_server: {
//                command: 'webdriver-manager start',
//                options: {
//                    async: true, //if false, process is kept running in background after grunt finishes. if true, process runs in background when grunt is finished.
//                    execOptions: {
//                        cwd: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/dev/spec/dummy/node_modules/protractor/'
//                        //detached: false //if true, process is kept running after grunt completes. but either set to true or false, the server seems to just
//                        // hang after starting up and grunt does not progress through the rest of tasks in the script ==> this value does not seem to make a difference
//                        //whether true or false.
//                    }
//                }
//            },
//            istanbul_cover: {
//                command: 'istanbul cover protractor -- protractorConf.js',
//                options: {
//                    async: true,     //an async process will be terminated when grunt finishes
//                    execOptions: {
//                        cwd: '/Users/mkam1/michelle_sbm_workspace/CMT/harmony_cms/dev/spec/dummy/test/js/functional/protractor'
//                    }
//                }
//            }
//        },

        protractor_coverage: {
            options: {
                configFile: '/Users/mkam1/harmony_cms_sandbox/dev/spec/dummy/test/js/functional/protractor/protractorConf.js', // '<%= dirs.app %>/spec/dummy/test/js/functional/protractor/protractorConf.js',
                keepAlive: true, // If false, the grunt process stops when the test fails.
                noColor: false, // If true, protractor will not use colors in its output.
                coverageDir: '<%= dirs.instrumentedE2E %>',
                args: {}
            },
            phantom: {
                options: {
                    args: {
                        baseUrl: 'http://localhost:3000/',
                        // Arguments passed to the command
                        'browser': 'phantomjs'
                    }
                }
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

    grunt.registerTask('default', [
        'clean',
        'copy:appFiles',
        'copy:libFiles',
        'instrument',
//        'shell:rails_server',
//        'shell:selenium_server',
//        'shell:istanbul_cover',
//        'storeCoverage',
//        'protractor_coverage:chrome',
//        'makeReport'
    ]);

    grunt.registerTask('instrumentation', [
        'clean:coverageE2E',
        'copy:coverageE2E',
        'clean:javascriptApp',
        'clean:javascriptLib',
        'instrument'
    ]);

    grunt.registerTask('execution', [
        'protractor_coverage:chrome',
        'makeReport'
    ]);


};