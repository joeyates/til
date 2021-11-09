{module}.module_info()
:beam_lib.chunks({type}) - see erlang-standard-library

quote: http://elixir-lang.org/getting-started/meta/quote-and-unquote.html
Macro.to_string - on a quoted structure does the same as inspect()

# Internal code represention

function_tuple_rep = {atom | tuple_rep, metadata (keyword list), arguments list}
variable_tuple_rep = {atom | tuple_rep, metadata (keyword list), atom}

* function_exported?(mod, method, arity)
* System.schedulers_online()

# Get the Current OTP Application

{:ok, app} = :application.get_application(module)

# Get the Current Application under Mix

Mix.Project.config[:app]

# Get the Application root (HACK)

```
deps_path = Mix.Project.config[:deps_path]
app_path = Path.dirname(deps_path)
```

# Open the Inspector

```
iex> :observer.start()
```
