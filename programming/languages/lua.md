* manual: https://www.lua.org/manual/5.4/
* introduction: https://www.lua.org/pil/contents.html
* playground: https://www.lua.org/cgi-bin/demo

# Data Types

## String

Strings can be either single- or double-quoted

```lua
> 'a'
a
> "a"
a
```

Double square brackets can also be used

```lua
> [[a]]
a
```

They can be used for multiline strings

```lua
[[Muiltiple
lines]]
```

String concatenation is done with `..`

```lua
> 'a' .. 'b'
ab
```

The `'` and `"` characters can be inserted in strings delimited
by those characters by escaping them with `\`.

```lua
> "\""
"
> '\''
'
```

Lua does not have a built-in method for string interpolation.

## Table

Table is the associative or simple array type.
Keys are written as bare text, but count as strings.

```lua
> t = {a = 1}
> t.a
1
> t['a']
1
```

Tables can contain lists of values, without an explicit key.
Indexing is 1-based.

```
t = {'a', 'b', 'c'}
t[2]
```

Tables can mix numeric indexed values with keys values

```lua
> t = {'a', 'b', ciao = 'hello'}
> t[2]
b
> t.ciao
hello
```

Indexed values and keyed values can be supplied in any order

```lua
> t = {'a', ciao = 'hello', 'b'}  
> t[2]
a
> t.ciao
hello
```

# Structures

* if
* for "case" use a Table

# Functions

A function can any parameters, use `arg` to access them

```
function(...)
  arg
end
```

To simulate named parameters, pass a table:

```lua
> foo = function(arg)
  print(arg.bar)
end
> foo({bar = 1})
1
```

# Code

## Comments

Single line

```lua
-- Comment
```

Multiline

```lua
--[
Comment
--]
```

Handle embedded `[` in multiline comments

```lua
--[=[
Comment
--]=]
```

# Introspection and Debugging

Get variable type

```lua
type(v)
```

```
$ luarocks install inspect
```

In REPL

```lua
inspect = require('inspect')

inspect(...)
```
