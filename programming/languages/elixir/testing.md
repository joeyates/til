# doctest

Put tests in comments.
Use four space indent followed by `iex>`

`lib/foo/bar.ex`:

```elixir
defmodule Foo.Bar do
  @doc ~S"""
  Bazzes the quuxes.

    iex> baz(1)
    {:ok, :quux}
  """
  def baz(x)
    ...
```

Reference the doctest in the `test` directory:

`test/foo/bar_test.exs`:

```elixir
defmodule Foo.BarTest do
  use ExUnit.Case, async: true
  doctest Foo.Bar
end
```

# ExUnit

[See file](standard-library/ex_unit.md)

# Cookbook

## Send and receive

### In the same process

```
send self(), {__MODULE__, {{method}}, {{arguments}}}
```

```
assert_receive {{{module}}, {{method}}, {{arguments}}}, {{timeout ms}}
```
