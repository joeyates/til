# Get

```elixir
...> Req.get!("https://httpbin.org/get")
%Req.Response{}
```

Options (see below):

```elixir
...> Req.get!("https://httpbin.org/get", key: value)
%Req.Response{}
```

# Options

## `headers`

A list of two-ples, `{String.t(), String.t()}`:

```elixir
...> headers = [
...>   {"Accept", "application/json"}
...> ]
...> Req.get!("https://httpbin.org/get", headers: headers)
```

## `connect_options`

```
connect_options: [timeout: :infinity]
```
