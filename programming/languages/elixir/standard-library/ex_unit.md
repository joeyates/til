# [ExUnit.Assertions][exuinit-assertion-docs]

* assert(expression)
* assert_in_delta(v1, v2, delta, message \\ nil)
* assert_raise(exception, function)
* [assert_receive(attern, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout), failure_message \\ nil)][assert_receive]

[exuinit-assertion-docs]: http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html
[exunit-assert-receive-3]: https://hexdocs.pm/ex_unit/ExUnit.Assertions.html#assert_receive/3

# ExUnit.Case

http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Case.html
https://github.com/elixir-lang/elixir/tree/master/lib/ex_unit

## Project setup

test/test_helper.exs:

```elixir
ExUnit.start()
```

## Minimal Test

test/my_test.exs:

```elixir
defmodule My.ModuleTest do
  use ExUnit.Case, async: true

  test "foo" do
    assert(true)
  end
end
```

## Fixtures

Roll your own

test/support/fixture_helper.ex:

```elixir
defmodule Test.Support.FixtureHelper do
  def fixtures_path, do: Path.join("test", "fixtures")

  def read_fixture(filename) do
    Path.join(fixtures_path(), filename)
    |> File.read!
  end

  def json_fixture!(name) do
    {:ok, data} =
      read_fixture(name <> ".json")
      |> Jason.decode(keys: :atoms)

    data
  end
end
```

Ensure loading:

mix.exs:

```elixir
  ...
  def project do
    [
      ...
      elixirc_paths: elixirc_paths(Mix.env),
      ...
    ]
  ...
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
  ...
```

Use:

```elixir
defmodule My.Test do
  use ExUnit.Case, async: true
  import Test.Support.FixtureHelper

  setup do
    foo = json_fixture!("foo")
  end

  ...
end
```

## Tag with data

```elixir
@tag foo: 1
test 'bar', context do
  assert(context[:foo] == 1)
end
```
