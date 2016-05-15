var gulp = require('gulp');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');

gulp.task('default', ['watch']);

gulp.task('coffee', function(){
  return gulp.src(["./src/**/*.coffee"])
      .pipe(coffee())
      .pipe(concat('game.js'))
      .pipe(gulp.dest('./build/'));
});

gulp.task('watch', ['coffee'], function() {
  gulp.watch("./src/**/*.coffee", ['coffee'])
});
