# Add a User to the Dokku Host

# Set the Default Git Branch to 'main'

dokku git:set --global deploy-branch main

# Set a Single App's Default Git Branch

dokku git:set $DOKKU_APP deploy-branch {{BRANCH NAME}}

# Config

## Encode Config Variables

```
dokku config:set --encoded {{app}} {{variable}}="$(echo -n {{value}} | base64)"
```

# Storage

Create the directory /var/lib/dokku/data/storage/$DOKKU_APP :

```
dokku storage:ensure-directory "$DOKKU_APP"
```

Mount storage

```
dokku storage:mount $DOKKU_APP /var/lib/dokku/data/storage/$DOKKU_APP/data:/data
```

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

```
export DOKKU_HOST={{host}}
export DOKKU_APP={{app}}
dokku apps:create $DOKKU_APP

dokku-root plugin:install https://github.com/dokku/dokku-postgres.git postgres

dokku postgres:create {{db name}}
dokku postgres:link {{db name}} {{app}} # sets DATABASE_URL
```

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

# Deploy

git remote add dokku dokku@$DOKKU_HOST:{{app}}
git push dokku

# Set up HTTPS with Letsencrypt

Configure DNS
Via DNS nameserver

```sh
dokku domains:set $DOKKU_APP $APP_DOMAIN
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
