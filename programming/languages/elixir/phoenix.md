# Phoenix Framework

# Project layout

* [From docs][phoenix-directory-layout]

[phoenix-directory-layout]: http://www.phoenixframework.org/docs/adding-pages

```
config/
deps/
lib/
  {app}/
    endpoint.ex
    repo.ex
  {app}.ex
priv/
  ecto/
    migrations/
  static/
test/
web/
  channels/
  controllers/
  models/
  static/
  views/
  web.ex - shared stuff for controllers, views, etc
  router.ex
mix.exs
mix.lock
```

# Phoenix.Router

* http://www.phoenixframework.org/docs/routing

## Single routes

```
get "/", FooController, :action
```

## RESTful resources

```
resources "/foos", FooController
```

## List routes

```
mix phoenix.routes
```

# Phoenix.Model

Models are structs.

Changesets, see Ecto.Changeset

# Cookbook

## Create a project

Optionally update Hex:

mix local.hex

Install Phoenix as an archive

mix archive.install hex phx_new <version>

Create the project

mix phx.new <name>

Create the database

mix ecto.create

## Run the development server

mix phx.server

The server runs on port 4000

Run under Iex

iex -S mix phx.server

## Debugging

In liveview sigils:

```elixir
~L"""
<div><%= inspect(assigns, [pretty: true, width: 0]) %></div>
"""
```

In Slime templates:

```slim
pre
  = inspect(@search, [pretty: true, width: 0])
```
