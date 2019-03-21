# Language

## Code

Conventionally, structure is indicated by whitespace (newlines and indentation)
Indentation is conventonally 2 spaces.
But whitespace is not significant, except `case` and `let`

* `--` - comments
* `{-- ... --}` - multiline comment

## Literals

* `True`
* `False`
* `42` - Int - numerics are interpreted according to usage
* `13.33` - Float
* `'A'` - Char
* `"Ciao"` - String
* `""" ... """` - String (multiline)
* `[1]` - List
* `{ key = "value" }` - Record
* `foo p = p` - Function

## Operators

* `&&`
* `||`
* `::` - push head on list
* `args |> fn1` - `fn1(args)`
* `fn1 <| args` - `fn1(args)`
* `fn1 << fn2` - `\parms -> fn1(fn2(parms))`
* `fn1 >> fn2` - `\parms -> fn2(fn1(parms))`
* `++` - join lists
* `( op ) arg1 arg2` - apply operator `op` to `arg1` and `arg2`

## Keywords

* `import`

## Structures

* `\n -> n^2` - anonymous function
* `if ... then ... else ...`
* `name : Type` - type annotation
* `type alias Name = String` - type alias
* `type Name = (Strig String)` - type definition
* `port foo : args` - port definition
* `case`

```elm
case thing of
  Just x -> x
  _      -> "Nope"
```

* `let ... in ...` - declare locals

```elm
let
  foo = "bar"
in
  foo ++ "!"
```

# Runtime

Every Elm program has a set of
[default imports from elm/core](https://github.com/elm/core#default-imports)

# Records

```elm
foo = { name = "Bar" }
```

* `foo.name` - access fields
* `{ foo | name = "Baz" }` - update
* `... .name ...` - field accessor

# Modules

# Package Management

## Find a package

https://package.elm-lang.org

Package names are at the top of each package page.

## Add a package

```
elm install {{package name}}
```

# Resources

* https://ellie-app.com/ - playground

# Cookbook

* `{--} ... --}` - re-enable commented code
* `if ... then ... else if ... then ...` - chained conditionals
