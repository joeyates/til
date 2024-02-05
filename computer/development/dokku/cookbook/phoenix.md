# Assumptions

* direnv is used locally
* asdf is used locally

# Create App

...

# Secrets

```
cat <<CONFIG > .envrc
export APP_DOMAIN=
export DATABASE_NAME=
export DOMAIN_EMAIL=
export DOKKU_APP=
export DOKKU_HOST=
export LIVE_VIEW_SALT=
export SECRET_KEY_BASE=

[[ -f .envrc.private ]] && source_env .envrc.private
CONFIG
```

```
direnv allow
```

Avoid compilation when we call `mix phx.gen.secret`

```
mix compile
```

```
cat <<CONFIG > .envrc.private
export APP_DOMAIN=
export DATABASE_NAME=
export DATABASE_URL=postgres://postgres:postgres@localhost/my_app_dev
export DOMAIN_EMAIL=
export DOKKU_APP=
export DOKKU_HOST=
export LIVE_VIEW_SALT=$(mix phx.gen.secret)
export SECRET_KEY_BASE=$(mix phx.gen.secret)
CONFIG
```

Edit .envrc.private

Load the values from .envrc.private

```
direnv allow
```

# Create App

```
dokku apps:create $DOKKU_APP
dokku domains:set $DOKKU_APP $APP_DOMAIN
```

# Set Up TLS/https

Set up DNS for app domain on nameserver.

Obtain a staging certificate

```
dokku letsencrypt:set $DOKKU_APP email $DOMAIN_EMAIL
dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER=staging
dokku letsencrypt:enable $DOKKU_APP
```

Obtain real certificate

```
dokku config:unset --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER
dokku letsencrypt:enable $DOKKU_APP
```

# Prepare Database

dokku-root plugin:install https://github.com/dokku/dokku-postgres.git postgres

```
dokku postgres:create $DATABASE_NAME

dokku postgres:link $DATABASE_NAME $DOKKU_APP
```

This also sets the DATABASE_URL config (i.e. environment variable)

# Prepare Phoenix

```
cat <<BUILDPACK > .buildpacks
https://github.com/HashNuke/heroku-buildpack-elixir
BUILDPACK
```

Assumption: the locally installed Erlang and Elixir versions are to be used
in the deployed app.

```
cat <<CONFIG > elixir_buildpack.config
erlang_version=$(asdf current erlang | cut -d ' ' -f 1)
elixir_version=$(asdf current elixir | cut -d ' ' -f 1)
hook_post_compile="mix assets.deploy"
CONFIG
```

```
git add .buildpacks elixir_buildpack.config
git commit -m "Configure Dokku buildpacks for Phoenix"
```

```sh
git remote add dokku dokku@$DOKKU_HOST:$DOKKU_APP
dokku config:set --no-restart $DOKKU_APP \
  LIVE_VIEW_SALT=$LIVE_VIEW_SALT \
  SECRET_KEY_BASE=$SECRET_KEY_BASE \
  PHX_HOST=$APP_DOMAIN \
  PHX_SERVER=true
git push dokku
```

# Run Phoenix Migrations when Deploying

Put the following in Procfile:

```
web: ...
release: ./.platform_tools/elixir/bin/mix ecto.migrate
```

# Access Production Shell

Put the node name in Procfile when starting the application:

```
web: elixir --sname {{app}} -S mix phx.server
```

Access the container as herokuishuser:

```sh
dokku enter $DOKKU_APP
iex --sname console --remsh {{app}}
```

Or, from the deployed machine:

```sh
docker exec -u herokuishuser -ti {{app}}.web.1 bash
cd /app
. <(cat /app/.profile.d/*)
iex --sname console --remsh {{app}}
```
