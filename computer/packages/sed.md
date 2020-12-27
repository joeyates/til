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

## Single File Global Replace

```
sed -ir "###g"
```

## Extended regex replace in multiple files

```
sed -i -r 's#{{match}}#{{replacement}}#' *.slim
```

Slashes are escaped:

```
sed -i -r 's#this#this\/that#' *.slim
```

## Recursive replace

sed -i -r "s#{{match}}#{{replacement}}#g" {{file glob}}

find {{directory}} -type f -name '{{file glob}}' -print0 | xargs -0 sed -i -r "s#{{match}}#{{replacement}}#g" '{}' ';'

Captures:

find -type f -print0 | xargs -0 sed -i -r "s#([a-z]+)#\\1\\1#g"
