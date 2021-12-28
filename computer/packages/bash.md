# Configuration

If a line starts with a space, don't add it to history
If a line is repeated, don't add it to history

* HISTCONTROL=ignoreboth

# Subshells

```
$(...commands)
```

# Arguments

* $@ - all arguments
* $# - argument count

# Text

## HEREDOC

<<DELIMITER
...
DELIMITER

# Variables

## set default value

Return first parameter if set, otherwise the supplied value:

```
${1:-foo};
```

Access variable, and fail if unset

${VARIABLE?ERROR_MESSAGE}

Access variable, and fail if unset or empty

${VARIABLE:?ERROR_MESSAGE}

## calculated default value

# Commands

Perform expansion, without other commands:
```
: {command}
```

# `[...]`


# `[[...]]`


# Conditions ("Tests")

[Files](http://tldp.org/LDP/abs/html/fto.html):

* `-d` - is a directory
* `-e` - exists
* `-f` - is a file
* `-s` - is not zero size

Integers:

* `-eq` - equal
* `-ne` - not equal
* `-gt` - greater than

Strings:

* `=` - equal
* `==` - equal
* `<` - less than (ASCII ordering)
* `-z` - is zero length
* `-n` - is not zero length

Examples:

File exists:

```
if [ -e "$FILENAME" ]
then
  ...
fi
```

File does not exist:

```
if [ ! -f "$FILENAME" ]
then
  ...
fi
```

# Structures

## case

```
case "$foo" in
  bar)
     ...
     ;;
  *)
     ...
esac
```

## for

## numerical loop over range

```
for i in {1..20}; do echo $i; done
```

## loop over files

```
for file in {{GLOB PATTERN}}; do COMMAND; done
```

Use "${file}" to avoid problems with spaces in file names.

## while

```
while true
do
  echo "Hi"
  sleep 1
done
```

# functions

```sh
foo() {
}
```

# Scripts

## Shebang

Use `env` to get the correct path of the command:

```sh
#!/usr/bin/env bash
```

## Error handling

```sh
set -euo pipefail
```

```sh
set -e
set -u
set -o pipefail
```

## Trap Exit

finish() (
  ...
)
trap finish EXIT
