module.exports = (grunt) ->

  # configuration
  grunt.initConfig

    # grunt sass
    sass:
      build:
        options:
          style: 'expanded'
        files: 
          'dist/css/style.css': 'app/stylesheets/style.sass'

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
        files: ['**/*.scss', '**/*.css', '**/*.sass']
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

    #grunt uglify
    uglify:
      build:
        files: 'dist/js/app.js' : ['app/javascripts/app.js', 'node_modules/jquery/dist/jquery.min.js', 'node_modules/bootstrap-sass/assets/javascripts/bootstrap.js']      

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
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  # tasks
  grunt.registerTask 'default', ['uglify', 'sass', 'slim', 'connect', 'watch']