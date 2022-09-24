```elixir
@modules = [Foo, :bar]

Process.list() |> Enum.filter(fn pid ->
  pi = Process.info(pid)
  module = elem(pi[:current_function], 0)
  module in @modules
end)
|> Enum.each(pids, &:erlang.garbage_collect/1)
```
