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

```
mix local.hex

Check latest release:

https://github.com/phoenixframework/phoenix/release```

Install Phoenix as an archive

```
mix archive.install hex phx_new <version>
```

Create the project

```
mix phx.new [options] <name>
```

* `name` - the project name in snake_case

Project creation options:

* --database postgres|mysql
* --no-html - no HTML views (for APIs)
* --no-gettext - no i18n
* --no-webpack

Create the database

```
mix ecto.create
```

# Database

Create

```
$ mix ecto.create
```

Generate migration:

```
???
```

Migrate

```
$ mix ecto.migrate
```

## Run the development server

```
mix phx.server
```

The server runs on port 4000

Run under Iex

```
iex -S mix phx.server
```

## Debugging

In Elixir code:

With simple values:

```elixir
IO.puts "count: #{count}"
```

With structures:

```elixir
IO.puts "attrs: #{inspect(attrs, [pretty: true, width: 0])}"
```

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

# Heroku

Add a database

## Postgis

```sh
heroku addons:create heroku-postgresql:standard-0 -r {{remote}}
```

```sh
$ heroku psql
> create extension postgis
```

## Add buildpack

```sh
heroku -r {{remote}} buildpacks:set https://github.com/HashNuke/heroku-buildpack-elixir.git
```
