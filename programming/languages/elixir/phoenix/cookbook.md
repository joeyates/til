# Project Generator

Install the project generator command:

```
mix archive.install hex phx_new
```

# Create a Project

```sh
mix phx.new {{NAME}}
```

* NAME must be /[a-z_]+/

## ...without a Database

```sh
--no-ecto
```

# Project Structure

* migrations -> priv/migrations

# Database

* create:
$ mix ecto.create

* migrate
$ mix ecto.migrate

# Debugging

In Elixir code:

With simple values:

```elixir
IO.puts "count: #{count}"
```

With structures:

```elixir
IO.puts "attrs: #{inspect(attrs, [pretty: true, width: 0])}"
```
