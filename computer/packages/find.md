# find

List all files in and below this path:

```sh
find
```

...non-recursive:
```sh
-maxdepth 1
```

...by name:
```sh
find -name NAME
```

..by partial name:
```sh
find -name "*MATCH*"
```

..case insensitive:
```sh
find -iname "*MATCH*"
```

...exclude files with a certain path component
```sh
-not -wholename '*match*'
```

Files modified on 20171002

```bash
find . -type f -newermt 2017-10-02 ! -newermt 2017-10-03 -exec ls '{}' ';'
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
```sh
-mtime +4.5
```

...files modified &lt;3 minutes ago

```sh
-mmin -3
```

# Comparative time tests

...files modified more recently than FOO

```sh
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

```sh
-exec {{command}} '{}' ';'
```

...pipe results to xargs:

```sh
find -name NAME -print0 | xargs -0 ...
```

# Cookbook

## Changed files

Files modified in the last 10 minutes, ordered by modification time:

```
find -mmin -10 -exec ls -ldtr '{}' ';'
```

## Chaining alternatives

Find all matching files:

```sh
find -name '*.html' -o -name '*.htm'
```

Find all non-matching files:

```sh
find -name '*.html' -prune -o -name '*.htm' -prune -o -type d -o -print
```
