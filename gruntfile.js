'use strict';

module.exports = function(grunt) {

    require('load-grunt-tasks')(grunt);

    // Define the configuration for all the tasks
    grunt.initConfig({

        // Project settings
        dirs: {
            // configurable paths
            home: '/Users/mkam1',  //Replace this with your own home directory
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
            ],
            options: {
                lazy: true,        //take instrumented js files and save them to dev/coverage/e2e/instrumented/dev/spec/dummy.....
                basePath: '<%= dirs.instrumentedE2E %>/'
            }
        },

        boot_server_async: {
            rails: {
                options: {
                    cwd: '<%= dirs.instrumentedE2E %>/dev/spec/dummy',
                    cmd: 'rails server',
                    matchString: 'Ctrl-C',
                    env: {
                        GEM_PATH: '<%= dirs.home %>/.rvm/gems/ruby-1.9.3-p194@showroom_harmony_cms:<%= dirs.home %>/.rvm/gems/ruby-1.9.3-p194@global'
                    }
                }
            },
            cq: {
               options: {
                   cmd: "~/cq5/author/crx-quickstart/bin/start",
                   matchString: 'HTTP server port: 4502'   //the string to look for which signals server has successfully booted
               }
            },
            selenium: {
                options: {
                    cmd: "webdriver-manager start",
                    matchString: 'Started org.openqa.jetty.jetty.Server'   //the string to look for which signals server has successfully booted
                }
            }
        },

        protractor_coverage: {
            options: {
                configFile: '<%= dirs.app %>/spec/dummy/test/js/functional/protractor/protractorConf.js',
                keepAlive: true, // If false, the grunt process stops when the test fails.
                noColor: false, // If true, protractor will not use colors in its output.
                coverageDir: '<%= dirs.instrumentedE2E %>',
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
        },

        open: {  //shutdown selenium server used for running our functional tests
            selenium_quit : {
                path: 'http://localhost:4444/selenium-server/driver/?cmd=shutDownSeleniumServer'
            }
        },

        shell: {
            rails_quit: {
                //kill rails server. see example: http://stackoverflow.com/questions/12445331/killing-processes-shell
                command: "ps | grep rails | grep -v grep | awk '{print $1}' | xargs -I{} kill -9 {} > /dev/null"
            },
            cq_quit: {
                command: "ps | grep apache | grep -v grep | awk '{print $1}' | xargs -I{} kill -9 {} > /dev/null",
                failOnError: false
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


    grunt.registerTask('execution', [
        'protractor_coverage:chrome',
        'makeReport'
    ]);    grunt.registerTask('start_servers', [
        'boot_server_async:rails',
        'boot_server_async:cq',
        'boot_server_async:selenium'
    ]);


    grunt.registerTask('quit_servers', [
        'shell:rails_quit', //kill pid in terminal
        'shell:cq_quit',     //run the 'stop' script
        'open:selenium_quit'  //visit given URL for stopping server
    ]);

    grunt.registerTask('all', [
        'clean:coverageE2E',
        'copy:coverageE2E',
        'clean:javascriptApp',
        'clean:javascriptLib',
        'instrument',
        'open:selenium_quit',
        'shell:cq_quit',
        'shell:rails_quit',
        'boot_server_async:rails',
        'boot_server_async:cq',
        'boot_server_async:selenium',
        'protractor_coverage:chrome',
        'makeReport',
        'open:selenium_quit',
        'shell:cq_quit',
        'shell:rails_quit'
    ]);
};