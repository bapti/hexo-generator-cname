var gulp = require('gulp');
var del = require('del');
var coffee = require('gulp-coffee');
var bump = require('gulp-bump');
var mocha = require('gulp-mocha');
var register = require('coffee-script/register');
var git = require('gulp-git');
//
// Default "gulp"
//
gulp.task('default', ['test'] );

//
// Clean the lib folder
//
gulp.task('clean', function(done) {
  del(["./lib"], done);
});

//
// Build the coffees into lib
//
gulp.task('build', ['clean'], function() {
  return gulp
    .src("./src/**/*.coffee")
    .pipe(coffee())
    .pipe(gulp.dest("./lib"));
});

//
// Watch and rerun tests on coffees
//
gulp.task('watch', ['test'], function() {
  gulp.watch("./src/**/*.coffee", ['test']);
  gulp.watch("./test/**/*.coffee", ['test']);
});

//
// Testing
//
gulp.task('test', ['build'], function () {
  return gulp
    .src('./test/**/*.coffee', {read: false})
    .pipe(coffee())
    .pipe(mocha({reporter: 'Spec'}))
    .on('error', function(err){
      console.log(err.toString());
      this.emit('end');
    });
});

//
// Version bumping
//
gulp.task('bump', function(){
  gulp.src('./package.json')
  .pipe(bump())
  .pipe(gulp.dest('./'));
});

gulp.task('bump-minor', function(){
  gulp.src('./package.json')
  .pipe(bump({type:'minor'}))
  .pipe(gulp.dest('./'));
});

gulp.task('bump-major', function(){
  gulp.src('./package.json')
  .pipe(bump({type:'major'}))
  .pipe(gulp.dest('./'));
});

//
// Publishing
//
gulp.task('publish', ['build'], function(done){
  var p = require('./package.json')
  return gulp.src('./package.json')
    .pipe( git.add() )
    .pipe( git.commit('Bumped version to ' + p.version) );
});