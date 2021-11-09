# Inspect a Context

`pry/1` allows inspection of a context, it is not a stepping
debugger.

```
require IEx
IEx.pry()
...
respawn()
```

# Print anything

```
IO.puts inspect(foo)
IO.puts "foo: #{inspect(foo)}"
```

# Erlang Debugging

```elixir
:debugger.start()
:int.ni({{module}}) # prepare a module for debugging
:int.break({{module}}, {{line}})

http://erlang.org/doc/apps/debugger/debugger_chapter.html
