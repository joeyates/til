```elixir
System.get_env()
|> Enum.sort(fn ({k1, _v1}, {k2, _v2}) -> k1 <= k2 end)
|> IO.inspect(limit: :infinity); nil
```
