# Reference

* Values: https://nixos.org/manual/nix/stable/language/values

# String ("string")

Delimiter: " (or `''TEXT''`)
Concatenation: `+`
Escape: `\`
Interpolation: `"${VALUE}"`

String with `"` and `''` delimiters are multiline

`''` is for indented strings strip leading spaces

# Number ("int")

nix only has integers

# Set

Associative arrays.
Keys are strings.

```
{ KEY1 = VALUE1; KEY2 = VALUE2; }
```

Access via `SET.KEY`

## `//` Set union operator

```
SET1 // SET2
```

Precedence to the values in the right-hand set

# `rec` - recursive sets

Same as sets, except keys can be used in values.

# List

```
[VALUE1 VALUE2]
```

# Function ("lambda")

Always anonymous.
Multi-parameter functions are achieved through currying.

```
(PARAMETER: [PARAMETER:] EXPRESSION(S))
```

# Set-pattern Function Arguments - Destructuring

It's handy to pass a single Set argument to a function
rather than define a series of nested curried functions.

To make extraction of the Set keys easier, they can be destructured

```
({PARAM1, PARAM2, ...}: PARAM1 + " " + PARAM2) {PARAM1 = "Hello"; PARAM2 = "World!";}
```

Defaults are indicated via `?`

```
({PARAM1, PARAM2 ? "World!"}: PARAM1 + " " + PARAM2) {PARAM1 = "Hello";}
```

# Path ("path")

Characters with at least one slash

```
/foo/bar
```

Relative paths are resolved relative to the file in which the occur.

# `let` expression

`let BINDING[; BINDING] in BODY`

BINDING: `NAME = VALUE`

# Modules

Modules are files containing a `let` expression.

The values assigned in the body are available
when the module is `import`-ed

# `if` ... `then` ... `else` expression

# `abort`

Throw an error

# `import` expression

```
(import PATH)
```

Returns a Set of the module's body's assignments

Imports can be circular.

# `with` expression

```
with SET;
EXPRESSION
```

Makes the values in SET available in EXPRESSION.

# `assert` expression
