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

```
<<DELIMITER
...
DELIMITER
```

# Expansion

* `'...'` - literal value
* `"..."` - do variable expansion
* `...*...` - all matching substrings

# Parameters

* $@ - all parameters
* $0 - script name
* $1, $2, ... - parameters

* `shift [n]` - remove n (default 1) parameters from parameters

# Variables

## set default value

Return first parameter if set, otherwise the supplied value:

```
${VARIABLE:-foo};
```

Access variable, and fail if unset

```
${VARIABLE?ERROR_MESSAGE}
```

Access variable, and fail with an error message if unset or empty

```
${VARIABLE:?ERROR_MESSAGE}
```

As above, but avoiding error as bash tries to execute the result of the expression
```
: ${VARIABLE:?ERROR_MESSAGE}
```

## Use a variable as a variable name

```
local foo="Hi"
local name=foo
echo ${!name}
```

# Commands

Perform expansion, without invoking commands:

```
: {command}
```

# `[...]`


# `[[...]]`

# Structures

## if

```sh
if ... ; then
  ...
fi
```

```sh
if ... ; then
  ...
else
  ...
fi
```

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

# Conditions ("Tests")

See ./bash/conditions.md

# functions

```sh
foo() {
}
```

# set

https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html

Options with '-' set the options
Options with '+' unset the options

* -x - trace output

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

```bash
finish() (
  ...
)
trap finish EXIT
```
