# Download a file

```elixir
:inets.start()
:ssl.start()

{:ok, {{_, 200, _}, _headers, body}} = :httpc.request(url)
```

...with headers

```
headers = [
  {'Key', Value},
  ...
]

_result = :httpc.request(
  :get,
  {String.to_charlist(url), headers}, [], []
)
```
