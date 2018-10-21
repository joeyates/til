
* `-e {{script}}` - script to run
* `-i` - in-place substitution
* `-r` - extended regexp

# Scripting

## Replacements

`s/{{match}}/{{replacement}}/`

Matching:

* capture: `(...)`

Replacing:

* insert capture: `\1`

# Cookbook

## Extended regex replace in multiple files

sed -i -r 's#page_main_section#partials\/page_main_section#' *.slim

## Recursive replace

sed -i -r "s#{{match}}#{{replacement}}#" {{file glob}}

find {{directory}} -type f -name '{{file glob}}' -print0 | xargs -0 sed -i -r "s#{{match}}#{{replacement}}#" '{}' ';'

find priv/source -type f -name '*.html.slim' -print0 | xargs -0 sed -i -r "s#\bt\(['\"]([a-z\_]+)['\"]\)#t(\"\\1\", locale)#"
