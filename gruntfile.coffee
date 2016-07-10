module.exports = (grunt) ->

  # configuration
  grunt.initConfig

    # grunt sass
    sass:
      build:
        options:
          style: 'expanded'
        files: 
          'dist/css/style.css': 'app/stylesheets/style.scss'

    # grunt slim
    slim:
      build:
        files:
          'dist/index.html' : 'app/index.slim'

    # grunt watch (or simply grunt)
    watch:
      html:
        files: ['**/*.html']
      sass:
        files: ['**/*.scss']
        tasks: ['sass']
      slim:
        files: ['**/*.slim']
        tasks: ['slim']
      options:
        livereload: true

    # grunt connect
    connect:
      server:
        options:
          base: 'dist'
          open: true

    # grunt gh-pages
    'gh-pages':
      options:
        base: 'dist'
      src: ['index.html']     

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  # tasks
  grunt.registerTask 'default', ['sass', 'slim', 'connect', 'watch']