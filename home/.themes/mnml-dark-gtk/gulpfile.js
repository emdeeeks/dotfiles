var gulp        = require('gulp'),
    concat      = require('gulp-concat'),
    rename      = require('gulp-rename'),
    util        = require('gulp-util'),
    less        = require('gulp-less'),
    cssmin      = require('gulp-cssmin');


gulp.task('less', function() {
    gulp.watch('gtk-3.0/less/*.less', function() {
        gulp.src('gtk-3.0/less/*.less')
        .pipe(concat('gtk.less'))
//          .pipe(gulp.dest('gtk-3.0'))
        .pipe(less())
        .pipe(gulp.dest('gtk-3.0'))
//        .pipe(cssmin())
//        .pipe(rename('gtk.css'))
//        .pipe(gulp.dest('gtk-3.0'))
        util.log('Compiled .css');
    })
});

gulp.task('default', ['less']);
