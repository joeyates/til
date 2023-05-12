# Set the Default Git Branch to 'main'

dokku git:set --global deploy-branch main

# Set a Single App's Default Git Branch

dokku git:set $DOKKU_APP deploy-branch {{BRANCH NAME}}

# Create a Static App

```
dokku apps:create {{app}}
git remote add dokku dokku@$DOKKU_HOST:{{app}}
touch .static
dokku config:set --no-restart $DOKKU_APP BUILDPACK_URL=https://github.com/dokku/buildpack-nginx
dokku config:set --no-restart $DOKKU_APP NGINX_ROOT=build
git push dokku
```

# Password protection with http_auth module

dokku config:set --no-restart $DOKKU_APP BUILDPACK_URL=https://github.com/cantierecreativo/buildpack-nginx

Then: Set up HTTPS

# Create an App with Postgres

http://dokku.viewdocs.io/dokku/deployment/application-deployment/

export DOKKU_HOST={{host}}
export DOKKU_APP={{app}}
dokku apps:create $DOKKU_APP

dokku-root plugin:install https://github.com/dokku/dokku-postgres.git postgres

dokku postgres:create {{db name}}
dokku postgres:link {{db name}} {{app}} # sets DATABASE_URL

# Create a Rails App

First, "Create an App with Postgres"

Set the env for the Rails application server (e.g. Puma):
dokku config:set {{app}} PORT={{application port}}

Optionally, set the Rails environment:
dokku config:set {{app}} RAILS_ENV=staging|...

## Bundler 2 Compatibility

dokku config:set --no-restart {{app}} BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-ruby.git#v203

## Sidekiq

* set up redis
* create Procfile

```
release: bin/rails db:migrate
web: bundle exec puma -p $PORT -C ./config/puma.rb
sidekiq: bundle exec sidekiq -t 1
```

* activate worker:

dokku ps:scale $DOKKU_APP web=1 {{name of sidekiq process}}=1

## Rails Console

dokku run {app}} rails console

# Create a Dockerfile App

https://dokku.com/docs/deployment/builders/dockerfiles/

Conditions for Dockerfile Deployments

* There must be a Dockerfile at the root of the repo
* There must not be a .buildpacks file at the root of the repo
* The app must not have a BUILDPACK_URL environment variable

```sh
dokku apps:create $DOKKU_APP
# Set options
dokku docker-options:add $DOKKU_APP run "-v /var/log/node-js-app:/app/logs"
# Set ports
dokku config:set node-js-app DOKKU_DOCKERFILE_PORTS="1234/tcp 80/tcp"
```

# Create an Elixir Phoenix App

Create a file .buildpacks:

```
https://github.com/HashNuke/heroku-buildpack-elixir
```

Set versions, etc, in `elixir_buildpack.config`:

```
erlang_version=...
elixir_version=...
hook_post_compile="mix assets.deploy"
```

```sh
export APP_DOMAIN=
export DOMAIN_EMAIL=
export DOKKU_APP=...
export DOKKU_HOST=...
export LIVE_VIEW_SALT=...
export SECRET_KEY_BASE=...
```

Use `mix phx.gen.secret` to create secrets.

```sh
git remote add dokku dokku@$DOKKU_HOST:$DOKKU_APP
dokku apps:create $DOKKU_APP
dokku config:set --no-restart $DOKKU_APP \
  DOKKU_LETSENCRYPT_EMAIL=$DOMAIN_EMAIL \
  LIVE_VIEW_SALT=$LIVE_VIEW_SALT \
  SECRET_KEY_BASE=$SECRET_KEY_BASE \
  PHX_HOST=$APP_DOMAIN \
  PHX_SERVER=true
dokku domains:set $DOKKU_APP $APP_DOMAIN
git push dokku
```

## Run Phoenix Migrations

Put the following in Procfile:
release: ./.platform_tools/elixir/bin/mix ecto.migrate

# Deploy

git remote add dokku dokku@$DOKKU_HOST:{{app}}
git push dokku

# Set up HTTPS with Letsencrypt

Configure DNS
Via DNS nameserver

```sh
dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_EMAIL=admin@{{domain}}
dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER=staging
dokku letsencrypt:enable $DOKKU_APP
dokku config:unset --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER
dokku letsencrypt:enable $DOKKU_APP
```

## Ensure the cron job is enabled

    dokku letsencrypt:cron-job --add

# Docker Setup

## Give App Access to a Directory

By creating a docker volume

If necessary, on host, create the directory.

Add Docker volume

```sh
dokku storage:mount $DOKKU_APP {{host path}}:{{container path}}
```

# Database

## Dump

## Restore

Get the db name:

dokku postgres:app-links $DOKKU_APP

Restore using pg_restore:

dokku postgres:import {{db link name}} < {{dump file}}

Restore a plain SQL dump:

dokku postgres:connect {{db link name}} psql -l -U postgres


Deploy From GitLab

Create key pair

ssh-keygen -t rsa -b 4096 -N "" -C "myapp-dokku-deploy" -f id_myapp_dokku

Copy private key to GitLab (under project -> Settings -> CI / CD -> Variables)

xclip -selection clipboard -in id_myapp_dokku

add public key to user `dokku` on Dokku server /home/dokku/.ssh/authorized_keys

# Cron Jobs

Log into machine as root
Create a cron task

```sh
$ crontab -e
```

Example:

```cron
23 02 * * * bundle exec foo bar
```

# Debugging

```sh
dokku logs {{app}}
```

Database

```sh
dokku postgres:connect {{db name}}
```

Restart

```sh
dokku ps:restart {{app}}
```

# Use 'main' as the Git deploy Branch

```sh
dokku git:set $DOKKU_APP deploy-branch main
```
