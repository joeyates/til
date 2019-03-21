# Source code

## Extensions

* script file: .exs
* compilable file: .ex

Both are structurally the same.

## Execution

Run a script:
```
elixir SCRIPT
```

# iex REPL

* h - show help
* h METHOD/ARITY

# Resources

* https://github.com/h4cc/awesome-elixir
* http://learnxinyminutes.com/docs/elixir/

# Ideas

* Use Render protocols for presenters:
```elixir
defmodule Foo do
  defprotocol Render do
    def render(entity) do
    end
  end
end
```

## Introspection

* Kernel.inspect/2

* `MODULE.__info__/1`
Call with: :functions, :macros, :module

# Code
`match?("https://" <> _, "https://xx")`
