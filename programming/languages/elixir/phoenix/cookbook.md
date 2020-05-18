# Phoenix

Add a project generator command:

```
mix archive.install hex phx_new 1.5.0-rc.0
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
