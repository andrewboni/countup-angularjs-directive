module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffee:
      dist:
        files: "src/<%= pkg.name %>.src.js": ["src/<%= pkg.name %>.coffee"]
    uglify:
      options:
        banner: "/*! <%= pkg.name %> by <%= pkg.author %> on <%= grunt.template.today(\"dd-mm-yyyy\") %> */\n"
      dist:
        files:
          "dist/<%= pkg.name %>.min.js": ["src/<%= pkg.name %>.src.js"]
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.registerTask "build", [
    "coffee:dist"
    "uglify:dist"
  ]
  return
