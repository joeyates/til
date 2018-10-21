# Standard Library

http://elixir-lang.org/docs/stable/elixir/

# Application

* Application.get_env(:app_name, key)

The environment can be set in mix.exs in the `application` method, i.e.

```
def application do
  [env: [my: :value]]
end
```

Also, `Mix.Config` can be used to set values.

# Enum

* all?/1
* all?/2
* any?/1
* any?/2
* at/2
* at/3
* chunk/2
* chunk/3
* chunk/4
* chunk_by/2
* concat/1
* concat/2
* count/1
* count/2
* dedup/1
* dedup_by/2
* drop/2
* drop_every/2
* drop_while/2
* each/2
* empty?/1
* fetch/2
* fetch!/2
* filter/2 `filter(enumerable, fun)` - return matching elements (like select)
* filter_map/3
* find/2 `find(collection, fun)`
* find/3
* find_index/2
* find_value/2
* find_value/3
* flat_map/2
* flat_map_reduce/3
* group_by/2
* group_by/3
* intersperse/2
* into/2
* into/3
* join/1
* join/2
* map/2
* map_every/3
* map_join/2
* map_join/3
* map_reduce/3
* max/1
* max/2
* max_by/2
* max_by/3
* member?/2
* min/1
* min/2
* min_by/2
* min_by/3
* min_max/1
* min_max/2
* min_max_by/2
* min_max_by/3
* module_info/0
* module_info/1
* partition/2
* random/1
* reduce/2
* reduce/3
* reduce_while/3
* reject/2
* reverse/1
* reverse/2
* reverse_slice/3
* scan/2
* scan/3
* shuffle/1
* slice/2
* slice/3
* sort/1
* sort/2
* sort_by/2
* sort_by/3
* split/2
* split_while/2
* split_with/2
* sum/1
* take/2
* take_every/2
* take_random/2
* take_while/2
* to_list/1
* uniq/1
* uniq/2
* uniq_by/2
* unzip/1
* with_index/1
* with_index/2
* zip/1
* zip/2

# ExUnit

See `testing.md`

# HashSet

# IEx

* pry

```
require IEx
IEx.pry
```

Interactive commands:
* h - help

# IO

* puts/1
* inspect/1

# Kernel

* ! (value) - true for falsey and vice versa
* ||/2 (value1, value2) - first truthy or last falsey value
* &&/2 (value1, value2) - first falsey or last truthy value

## Conditions

* if

```
if {condition} do
end
```

```
if {condition} do
else
end
```

* unless

http://elixir-lang.org/docs/stable/elixir/Kernel.html

# Kernel.SpecialForms

* left . right (or ./2)
  * call a method in another module

* =/2
  * the 'match operator'
  * does destructuring:
```
{:ok, foo} = {:ok, 1}
a = 1
```
  * divides head and tail:
```
[h | t] = list
```
  * rebinds:
```
x = 1
x = 2
```

* ^=/2
  * the 'pin' operator,
  * does not rebind, just matches.

* case - match against a value

```
case {expression} do
  {value} -> {expression}
  _ -> {the default}
end
```

* cond - check a series of conditions

```
cond do
  {condition} ->
    ...
end
```

cond raises an error if none of the conditions evaluates as true.

http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms.html

# Stream

* timer

# String

* length/1
* upcase/1

# System

* argv

# Time

* Time.diff(t2, t1, :microsecond)
