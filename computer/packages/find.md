# find

List all files in and below this path:

```shell
find
```

...non-recursive:
```shell
-maxdepth 1
```

...by name:
```shell
find -name NAME
```

..by partial name:
```shell
find -name "*MATCH*"
```

..case insensitive:
```shell
find -iname "*MATCH*"
```

...exclude files with a certain path component
```shell
-not -wholename '*match*'
```

# Tests

## Time

```
[+|-][a|c|m][min|time]
```

* `+` more than
* `-` less than
* `a` accessed
* `c` status changed
* `m` contents modified
* `min` minutes
* `time` days

...files modified &gt;4 1/2 days ago:
```shell
-mtime +4.5
```

...files modified &lt;3 minutes ago

```shell
-mmin -3
```

# Comparative time tests

...files modified more recently than FOO

```shell
-newercc FOO
```

## Permissions

File permissions match a value:

```
-perm {mode}
```

File permission bits include supplied value:

```
-perm {mode}
```

At least one file permissions bit matches the supplied value:

```
-perm /mode
```

# Output

...execute a command on each result:

```shell
-exec {{command}} '{}' ';'
```

...pipe results to xargs:

```shell
find -name NAME -print0 | xargs -0 ...
```

# Cookbook

## Changed files

Files modified in the last 10 minutes, ordered by modification time:

```
find -mmin -10 -print0 | xargs -0 ls -ldtr
```

## Chaining alternatives

Find all matching files:
```shell
find -name '*.html' -o -name '*.htm'
```

Find all non-matching files:

```shell
find -name '*.html' -prune -o -name '*.htm' -prune -o -type d -o -print
```
