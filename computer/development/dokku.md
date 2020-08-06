# Install

wget https://raw.githubusercontent.com/dokku/dokku/v0.20.4/bootstrap.sh
DOKKU_TAG=v0.20.4 bash bootstrap.sh

Packages:

* docker-ce

Pulls Docker image gliderlabs/herokuish

# Users

Dokku users have specific ssh configuration in
/home/dokku/.ssh/authorized_keys that uses /usr/bin/dokku as their
shell (instead of /usr/bin/bash)

Create a user:

```sh
cat {{ssh public key}} | ssh root@{{Dokku host}} "sudo sshcommand acl-add dokku {{Dokku user}}"
```

This simply adds a line to /home/dokku/.ssh/authorized_keys

# Deployment types

* Heroku-style
* Docker

# Client

* Either run `dokku` commands as user `dokku` on the server.
* Or use `ssh -t dokku@{{host}} {{command}}`

On client:

```sh
alias dokku='ssh -t dokku@$DOKKU_HOST'
alias dokku-root='ssh -t root@$DOKKU_HOST dokku'
export DOKKU_HOST={{IP}}
```

# Commands

* apps:list - list apps
* apps:create {{app}}
* apps:report {{app}} - show app info
* config {{app}} - list app environment variables
* config:set {{app}} {{NAME}}={{VALUE}} [{{NAME2}}={{VALUE2}}]
* help
* plugin:list
* plugin:install {{URL}}
* postgres:help - list postgres commands
* proxy:ports {{app}}
* ps:rebuild {{app}} - force a full rebuild
* run [ --env KEY=VALUE | -e KEY=VALUE ] <app> <cmd>  # Run a command in a new container using the current application image

# System

* apps: /home/dokku
* plugin installation path: /var/lib/dokku/plugins/available

# Plugins

## Postgres

* postgres:help
* postgres:list
* postgres:app-links {{app}} - list postgres databases linked to an app
* postgres:create
* postgres:link {{db name}} {{app}} - sets DATABASE_URL
* dokku postgres:enter {{service}} {{command}} chimera_production psql -l -U postgres

## Redis

```sh
dokku-root plugin:install https://github.com/dokku/dokku-redis.git
```

* redis:create {{redis app}}
* redis:app-links {{app}} - list Redis services linked to an app
* redis:link {{redis app}} {{app}}

## Letsencrypt

Use staging:

```sh
dokku config:set --no-restart {{app}} DOKKU_LETSENCRYPT_SERVER=staging
```

## Logs

* logs {{app}}
* logs:failed {{app}}

Tail:

```sh
dokku logs -t
```

# Cookbook

# Deploy a Rails Site

http://dokku.viewdocs.io/dokku/deployment/application-deployment/

dokku apps:create {{app}}

dokku plugin:install https://github.com/dokku/dokku-postgres.git

dokku postgres:create {{db name}}

## Bundler 2 Compatibility

dokku config:set --no-restart {{app}} BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-ruby.git#v203

## Deploy an app

```ssh
git remote add dokku dokku@$DOKKU_HOST:{{app}}
git push dokku master
```

## Set up HTTPS

### If necessary to make nginx work with a self-signed certificate

dokku certs:generate {{app}} {{domain}}

### Set up domains

* domains:report {{app}}
* domains:add {{app}} {{domain}}
* domains:set {{app}} {{domain}}

### Find the PORT for the app

```sh
dokku proxy:ports {{app}}
```

### Add https

```sh
dokku proxy:ports-add {{app}} https:443:{{port}}
dokku config:set --no-restart {{app}} DOKKU_LETSENCRYPT_EMAIL={{email}}
dokku letsencrypt {{app}}
dokku letsencrypt:cron-job --add
```

## Restore db

Get the db name:

```sh
dokku postgres:app-links {{app}}
```

Restore using pg_restore:

```sh
dokku postgres:import {{db name}} < {{dump file}}
```

Restore a plain SQL dump:

```sh
dokku postgres:enter chimera_production psql -l -U postgres
```

# Sidekiq

* set up redis
* create Procfile

```
release: bin/rails db:migrate
web: bundle exec puma -p $PORT -C ./config/puma.rb
sidekiq: bundle exec sidekiq -t 1
```

* activate worker:

```sh
dokku ps:scale {{app}} web=1 {{name of sidekiq process}}=1
```

# GitLab Deploy

Create key pair

ssh-keygen -t rsa -b 4096 -N "" -C "myapp-dokku-deploy" -f id_myapp_dokku

Copy private key to GitLab (under project -> Settings -> CI / CD -> Variables)

xclip -selection clipboard -in id_myapp_dokku

add public key to user `dokku` on Dokku server

## Cron Jobs

Log into machine as root
Create a cron task
$ crontab -e

Example

```
23 02 * * * bundle exec foo bar
```

# Rails Console

```
$ dokku run {{app}} rails c
```

# Debugging

dokku logs {{app}}

dokku postgres:connect {{db name}}

dokku ps:restart {{app}}

# Docker-style Deployments

Create a Git repo with a Dockerfile in the root.

## Docker Options

dokku docker-options:add {{app}} {{key}} {{value}}

build '--build-arg {{KEY}}={{value}}'
build '--file {{Dockerfile path}}'

## ENTRYPOINT Options

dokku config:set {{app}} DOKKU_DOCKERFILE_START_CMD="{{options}}"
