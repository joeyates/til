# Run With Password

```sh
LIVEBOOK_PASSWORD=pizza123pizza livebook server 
```

# Download a file

```elixir
Mix.install([
  {:req, ">= 0.0.0"},
])
 
{:ok, %Req.Response{status: 200} = response} =
  Req.new(url: encoded)
  |> Req.get()

response.body
```

# Unzip

```
unzipped = :zlib.gunzip(compressed_binary)
```

# Access an environment variable

First, set up the environment variable, either
as one of your 'Hub secrets' or as live
secrets (that only last as long as the session)

Prefix with `LB_`

```
api_key = System.fetch_env!("LB_API_KEY")
```
