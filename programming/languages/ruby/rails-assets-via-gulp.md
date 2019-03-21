# gulp asset pipeline

# gulp-ruby-sass:

* doesn't handle globbing
* handles a file at a time, so doesn't get mixins, etc

# gulp-sass (node-sass):

* doesn't do '@import *' globbing
* simply listing all files as gulp src-es doesn't work as the files that
  sass processes must include the own dependencies
* solution: stop using import globbing in application.sass. list all sass
  files explicitly.
