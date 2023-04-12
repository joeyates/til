# Running iex

Parameters can be passed to the Erlang system with the `--erl` parameter

# Modules

Load a beam file:
```
l({module name}) #=> {:module, {module name}}
```

Compile a file:
```
c({path.ex}) #=> [{module name}]
```

# Cookbook

## Save shell history

See https://github.com/ferd/erlang-history.git
