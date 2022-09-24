```elixir
[1, 2]
|> IO.inspect()  # <--- IO.inspect/1 returns its first argument)
|> Enum.map(&(1 + &1))
```
