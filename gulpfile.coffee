gulp        = require('gulp')
browserSync = require('browser-sync')
sass        = require('gulp-sass')
prefix      = require('gulp-autoprefixer')
cp          = require('child_process')

jekyll = 'jekyll'

src =
  html: [
    '*.html'
    '**/*.html'
  ]
  sass: 'stylesheets/*.sass'

# Build the Jekyll Site
gulp.task 'jekyll-build', (done) ->
  browserSync.notify 'jekyll rebuilt'
  cp.spawn(jekyll, [ 'build' ], stdio: 'inherit').on 'close', done

# Rebuild Jekyll & do page reload
gulp.task 'jekyll-rebuild', [ 'jekyll-build' ], ->
  browserSync.reload()

# Wait for jekyll-build, then launch the Server
gulp.task 'browser-sync', ['sass', 'jekyll-build'], ->
  browserSync server: baseDir: '_site'

# Compile files from _scss into both _site/css (for live injecting) and site (for future jekyll builds)
gulp.task 'sass', ->
  gulp.src 'stylesheets/main.sass'
    .pipe sass includePaths: [ 'scss' ], onError: browserSync.notify
    .pipe prefix ['last 15 versions', '> 1%', 'ie 8', 'ie 7'], cascade: true
    .pipe gulp.dest '_site/stylesheets'
    .pipe browserSync.reload stream: true
    # .pipe gulp.dest 'stylesheets'

# Watch scss files for changes & recompile
# Watch html/md files, run jekyll & reload BrowserSync
gulp.task 'watch', ->
  gulp.watch src.sass, [ 'sass' ]
  gulp.watch src.html, [ 'jekyll-rebuild' ]

# Default task, running just `gulp` will compile the sass,
# compile the jekyll site, launch BrowserSync & watch files.

gulp.task 'default', [
  'browser-sync'
  'watch'
]
