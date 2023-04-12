* `-e {{script}}` - script to run
* `-i` - in-place substitution
* `-r` - extended regexp
* - E - extended regular expressions

# Scripting

## Replacements

`s/{{match}}/{{replacement}}/`

Matching:

* capture: `(...)`

Replacing:

* insert capture: `\1`

# Matches



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

```sh
sed -i -r 's#{{match}}#{{replacement}}#' **/*.*
```

Or, using find to allow more filtering

```
find {{directory}} -type f -name '{{file glob}}' -print0 | xargs -0 -I{} sed -i -r "s#{{match}}#{{replacement}}#g" '{}'
```

Captures:

```
find -type f -print0 | xargs -0 sed -i -r "s#([a-z]+)#\\1\\1#g"
```
