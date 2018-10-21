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
