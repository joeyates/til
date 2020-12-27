# ets - Erlang Term Storage

Store data in the runtime system.

* `:ets.insert({{name}}, {key, value1, value2, ...})` - insert an item
* `:ets.insert({{name}}, [{key, value1, value2, ...}, ...])` - insert multiple items
* `:ets.lookup({{name}}, {{key}})` - fetch items by key
* `:ets.new({{name}}, {{options}})` - create a table
* `:ets.tab2list({{name}})` - dump table contents as a list
* `:ets.match({{name}}, {{pattern}})` - extract filds from matching records

## `new`

Options

* :named_table - allow access to a table via its name,
  without this, the ref returned by `new/2` is needed.

## `insert`

Inserts single tuples, or lists of tuples.
The first element of the tuples is its key.

## `lookup`

Fetch items via their key.

## `match`

Fetch items matching values other than the first (key) value:
The result is a list of lists, where the inner lists
where the fields selected via the atoms `:"$n"` in the order indicated by n.

If `:"$n"` fields are repeated, for example `:"$1", :"$1"` the results will be
records with identical values in the indicated fields.

`:_` is used to match anything.


```elixir
:ets.match(:foo, {:"$1", "Hi"}}
```
