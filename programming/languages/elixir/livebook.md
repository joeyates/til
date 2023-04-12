# Install

```sh
mix escript.install hex livebook
```

With asdf installs:

```sh
asdf reshim elixir
```

# Create

```sh
livebook server new
```

# Start

```sh
livebook server
```

## Run From Source

Run Livebook from iex:

mix deps.get
(cd assets && npm install)
iex -S mix phx.server

...load a livebook:
LivebookCLI.Server.call(["input-tests.livemd"])

# Environment

https://github.com/livebook-dev/livebook#environment-variables

* LIVEBOOK_COOKIE
* LIVEBOOK_DEFAULT_RUNTIME - standalone|mix|mix:PATH|attached:NODE:cookie|embedded
* LIVEBOOK_DISTRIBUTION - sname*|name - set the type of distributed node
* LIVEBOOK_IP
* LIVEBOOK_NODE - set the distributed node name
* LIVEBOOK_PASSWORD - {{min 12 chars}}
* LIVEBOOK_PORT
* LIVEBOOK_ROOT_PATH
* LIVEBOOK_SECRET_KEY_BASE

## Secrets

Secrets added to a Livebook are available with an "LB_" prefix.

# Project Integration

Choose "Mix standalone" as the runtime (left hand toolbar of the UI)

# Debugging

Use `IO.puts/1` and `IO.inspect/1` - the output is printed in a box before the result of the section

Specify line colour choices:

|> Vl.encode_field(:color, "label", type: :nominal, scale: %{range: ["green", "blue"]})
