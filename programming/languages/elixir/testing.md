# ExUnit

## [ExUnit.Assertions][exuinit-assertion-docs]

* assert(expression)
* assert_in_delta(v1, v2, delta, message \\ nil)
* assert_raise(exception, function)
* [assert_receive(attern, timeout \\ Application.fetch_env!(:ex_unit, :assert_receive_timeout), failure_message \\ nil)][assert_receive]

[exuinit-assertion-docs]: http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html
[exunit-assert-receive-3]: https://hexdocs.pm/ex_unit/ExUnit.Assertions.html#assert_receive/3

## ExUnit.Case

http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Case.html
https://github.com/elixir-lang/elixir/tree/master/lib/ex_unit

* test

```elixir
test 'foo' do
end
```

Tag with data:
```elixir
@tag foo: 1
test 'bar', context do
  assert(context[:foo] == 1)
end
```

# Cookbook

## Send and receive

### In the same process

```
send self(), {__MODULE__, {{method}}, {{arguments}}}
```

```
assert_receive {{{module}}, {{method}}, {{arguments}}}, {{timeout ms}}
```
