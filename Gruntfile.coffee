module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffee:
      dist:
        files: "src/<%= pkg.name %>.src.js": ["src/<%= pkg.name %>.coffee"]
      app:
        files: "examples/js/app.js": ['examples/coffee/app.coffee']
    uglify:
      options:
        banner: "/*! <%= pkg.name %> by <%= pkg.author %> on <%= grunt.template.today(\"dd-mm-yyyy\") %> */\n"
        compress:
          drop_console: true
      dist:
        files:
          "dist/<%= pkg.name %>.min.js": ["src/<%= pkg.name %>.src.js"]

    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: ['build']
      app:
        files: ['examples/coffee/app.coffee']
        tasks: ['coffee:app']

  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "build", [
    "coffee:dist"
    "uglify:dist"
  ]
  grunt.registerTask "dev", [
    "build"
    "watch"
  ]
  return
