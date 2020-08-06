# Modules

* requiring is not necessary - whatever is in mix.exs is available.

## importing

import imports module methods into the local namespace:
```
import Foo

bar()
```

import can be partial:
```
import Foo, only: [bar: 1]
```

alias makes modules available via the last element in their namespace:
```
defmodule Foo
  alias Bar.Baz
  Baz.xyz()
end
```

# Kernel

All of Kernel.SpecialForms is always imported.
By default all of Kernel is imported.

## {module}.module_info/0
alias for `erlang.get_module_info({module})`

## {module}.module_info({type})
alias for `erlang.get_module_info({module}, {type})`

## {module}.__info__({type}) - returns info of a certain type

Types:
* :attributes - alias for `:erlang.get_module_info(:attributes)`
* :compile - alias for `:erlang.get_module_info(:compile)`
* :functions - alias for `:erlang.get_module_info(:exports)`
* :macros - returns Elixir macros and their arity 
* :module - returns the module

# Call Erlang

```
:{module}.{function}
```

# Control structures

## case - match against a value

```
case {expression} do
  {value} -> {expression}
  _ -> {the default}
end
```

## cond - check a series of conditions

```
cond do
  {condition} ->
    ...
end
```

cond raises an error if none of the conditions evaluates as true.

http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms.html

## with

```elixir
with {{match}} <- {{expression}},
     {{match1}} <- {{expression1}}
do
  {{expression}}
else
   {{match}} -> {{expression}}
end
```

## functions

```
def @name@(@args@) do
  ...
end
```

Default parameters:
```
def @name@(arg \\ {val})
```

Private function:

```
defp @name@(@args@) do
  ...
end
```

Guards:
```
def @name@(@args@) when {condition} do
  ...
end
```

## Comprehensions

```
for n <- [1, 2, 3, 4], do: n * n
```

# Sources

* http://elixir-lang.org/crash-course.html
