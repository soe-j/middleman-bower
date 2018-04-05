module.exports = function (grunt) {
  grunt.initConfig({
    bower: {
      install: {
        options: {
          targetDir: './tmp/bower_components',
          layout: 'byComponent', // dir layout by component
          install: true, // bower install
          verbose: false,
          cleanTargetDir: true,
          cleanBowerDir: false
        }
      }
    },
  });
  grunt.loadNpmTasks('grunt-bower-task');
};
