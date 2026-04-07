```elixir
defp time(function) do
  {time, result} = :timer.tc(function)
  IO.inspect(time, label: "time")
  result
end
```
