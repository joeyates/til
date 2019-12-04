{module}.module_info()
:beam_lib.chunks({type}) - see erlang-standard-library

quote: http://elixir-lang.org/getting-started/meta/quote-and-unquote.html
Macro.to_string - on a quoted structure does the same as inspect()

# Internal code represention

function_tuple_rep = {atom | tuple_rep, metadata (keyword list), arguments list}
variable_tuple_rep = {atom | tuple_rep, metadata (keyword list), atom}

* function_exported?(mod, method, arity)
* System.schedulers_online() 
