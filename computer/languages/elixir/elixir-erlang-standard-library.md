:elixir_compiler.file_to_path({Elixir source file}, {destination path})

## rpc

```
$ iex  --name "node@127.0.0.1" -S mix
iex(node@127.0.0.1)2> :rpc.call(:"node@127.0.0.1", Elixir.List, :last, [[1]])
# => 1
```
