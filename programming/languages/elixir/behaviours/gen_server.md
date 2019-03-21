# Basics

```elixir
defmodule MyModule do
  use GenServer

  @impl GenServer
  def init(args) do
    {:ok, args}
  end
end
```
