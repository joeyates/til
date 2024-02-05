# resource/3

```elixir
Stream.resource(
  fn ->
    INITIAL_STATE
  end,
  fn STATE ->
    if ??? do
      {STREAMED_VALUE, NEXT_STATE}
    else
      {:halt, HALT_STATE}
    end
  end,
  fn HALT_STATE ->
    ...
  end
)
```
