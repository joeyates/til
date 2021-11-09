# Create a Static App

dokku apps:create {{app}}
git remote add dokku dokku@$DOKKU_HOST:{{app}}
touch .static
dokku config:set --no-restart $DOKKU_APP BUILDPACK_URL=https://github.com/dokku/buildpack-nginx
dokku config:set --no-restart $DOKKU_APP NGINX_ROOT=build
git push dokku

# Password protection with http_auth module

dokku config:set --no-restart $DOKKU_APP BUILDPACK_URL=https://github.com/cantierecreativo/buildpack-nginx

Then: Set up HTTPS

# Create an App with Postgres

http://dokku.viewdocs.io/dokku/deployment/application-deployment/

dokku apps:create {{app}}

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

http://dokku.viewdocs.io/dokku/deployment/methods/dockerfiles/

Conditions for Dockerfile Deployments

    There must be a Dockerfile at the root of the repo
    There must not be a .buildpacks file at the root of the repo
    The app must not have a BUILDPACK_URL environment variable


# Create an Elixir Phoenix App

First, "Create an App with Postgres"

Create a file .buildpacks:
https://github.com/HashNuke/heroku-buildpack-elixir

## Run Phoenix Migrations

Put the following in Procfile:
release: ./.platform_tools/elixir/bin/mix ecto.migrate

# Deploy

git remote add dokku dokku@$DOKKU_HOST:{{app}}
git push dokku master

# Set up HTTPS

Configure DNS
Via DNS nameserver

Set up nginx with a self-signed certificate
dokku certs:generate $DOKKU_APP {{domain}}

Set up domains
dokku domains:report $DOKKU_APP
dokku domains:add $DOKKU_APP {{domain}}

dokku domains:set $DOKKU_APP {{domain}}


Set the PORT

dokku proxy:ports $DOKKU_APP
dokku proxy:ports-add $DOKKU_APP https:443:{{port}}


# Configure Let's Encrypt

dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_EMAIL=admin@{{domain}}

## Dry Run

dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER=staging
dokku letsencrypt $DOKKU_APP

## Get Certificate

dokku config:unset --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER
dokku letsencrypt $DOKKU_APP

## Ensure the cron job is enabled

    dokku letsencrypt:cron-job --add

# Database

## Dump


## Restore

Get the db name:

dokku postgres:app-links $DOKKU_APP

Restore using pg_restore:

dokku postgres:import {{db name}} < {{dump file}}

Restore a plain SQL dump:

dokku postgres:enter {{db name}} psql -l -U postgres


Deploy From GitLab

Create key pair

ssh-keygen -t rsa -b 4096 -N "" -C "myapp-dokku-deploy" -f id_myapp_dokku

Copy private key to GitLab (under project -> Settings -> CI / CD -> Variables)

xclip -selection clipboard -in id_myapp_dokku

add public key to user `dokku` on Dokku server /home/dokku/.ssh/authorized_keys

# Cron Jobs

Log into machine as root
Create a cron task
$ crontab -e

Example:

23 02 * * * bundle exec foo bar

# Debugging

dokku logs {{app}}

Database
dokku postgres:connect {{db name}}

Application
dokku ps:restart {{app}}
