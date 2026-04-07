```elixir
defmodule Foo do
  def joiner(list) do
    &Enum.join(list, &1)
  end
end

joiner = Foo.joiner(["a", "b", "c"])
IO.puts joiner.("-")
```
