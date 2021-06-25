# Types

* atom: :foo
* binary: `<<N1, N2>>`
* bitstring
* boolean: `true`|`false`
* character list: `'text'`
* float
* function
* integer: `1`, `0x1F`
* List: `[1, 2, 3]`
* keyword list: (list of 2-ples with atom keys)
   `[{:a, 1}, {:b, 2}]`
   `[a: 1, b: 2]`
* Map: `%{a: 1}`
* PID
* Port
* Reference
* String: `"text"`
* struct: %Foo{name: "bar"}
* tuple: `{1, 2, 3}`

# Atom

* `is_atom/1`

* Atom.to_string/1

# Binary

* a sequence of bytes (0 - 255)
* equivalent to a bitstring where the number of bits is divisible by 8.

* byte_size/1
* String.length/1

# Bitsring

```
<<15::size(4)>>
```

# Boolean

* are actually atoms

* `is_boolean/1`
* and\2
* or\2

# Character list - a list of characters

cl = 'character list' # => 'character list'
is_list(cl) # => true
to_string(cl) # => "character list"

# Function

* `is_function/1`
* `is_function/2` - with arity

```
foo = fn PARAM1[, PARAM2] -> BODY end
```

Invocation:
```
foo.(arg)
```

# Integer

## Literals

* decimal: `31`
* hex: `0x1f` or `0x1F`

## Functions

* is_integer

* Integer.to_string(int)

# List

* are printed as strings if they contain only ASCII bytes

Kernel functions:
* length/1 (list) - the number of items in the list
* is_list/1

* `++/2`
  * join two lists: l1 ++ l2

* `--/2`
  * subtract two lists: l1 -- l2
  * items in l2 are removed at most once.

* hd/1 - return the head
* tl/1 - return the tail
* | operator - prepend
```
[1 | list]
```

Get nth item:
```
{:ok, item} = Enum.fetch(list, index)
```

Find item in List:

```
Enum.find(list, fn item -> item.foo == :bar end)
```

Make a List of n items:

```
List.duplicate(1, 10)
```

# Keyword list

https://hexdocs.pm/elixir/Keyword.html

kl = [k: 1, n: 2]
kl[:k] # => 1

Keyword.keyword?(value) - is `value` a keyword list?

* `Keyword.keys({{keyword list}})` - get keys
* update: Keyword.put(list, key, value)
* Keyword.has_key?(list, key)
* Keywords.merge(kw1, kw2)

# Map

* `is_map/1`
* `has_key?/2`
* map["key"] # => value
* map[:key] # => value
* map.key # => value
* `%{%{a: 1, b: 2} | a: 42}` # => %{a: 42, b: 2}

# Regex

* named_captures/2
* replace
* run
* scan

# String

* double quotes,
* use UTF-8 encoding,
* internally are 'binaries' - sequences of bytes.

## Literals

* double quoted: `"Hello"`
* interpolation in double quoted: `"#{...}"`
* binary strings: `<<44>>`, `<<0x2c>>`

## Functions

* `<>/2` (string1, string2) - concatenate
* `to_char_list` - returns a list of the string's character codes (UTF-8 expanded)
* Map.merge/2
* String.to_atom/1

# Struct

A named map with specific keys and default values.

```
defmodule Foo do
  defstruct bar: "Default", baz: nil
end

foo1 = %Foo{bar: "Hello"}
```

Access members via '.':

```
IO.puts foo1.bar
```

Update

%SomeStruct{struct | key: :value}

with key checking

struct!(%SomeStruct{}, key: :value)

# Tuple

* is_tuple/1

* `Tuple.insert_at/3` (tuple, index, item)
  * return a copy of tuple with the nth item replaced.
* `Tuple.to_list/1`
* `elem(`tuple`, `index`)`
  * get nth item

# Pattern Matching

* tuples - you must match the number of elements
