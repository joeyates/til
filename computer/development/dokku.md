# Deployment types

* Heroku-style

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

* apps:list
* apps:create {{app name}}
* config {{app name}}
* config:set {{app name}} {{NAME}}={{VALUE}}
* plugin:list
* plugin:install {{URL}}
* proxy:ports {{app name}}
* ps:rebuild {{app name}} - force a full rebuild

# System

* apps: /home/dokku
* plugin installation path: /var/lib/dokku/plugins/available

# Deploy a site

http://dokku.viewdocs.io/dokku/deployment/application-deployment/

dokku apps:create {{app name}}

dokku plugin:install https://github.com/dokku/dokku-postgres.git

dokku postgres:create {{db name}}

## Bundler 2 Compatibility

dokku config:set --no-restart {{app name}} BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-ruby.git#v203

## Deploy the app

git remote add dokku dokku@$DOKKU_HOST:{{app name}}
git push dokku master

dokku postgres:link {{db name}} {{app name}}

## Set up HTTPS

# If necessary to make nginx work with a self-signed certificate

dokku certs:generate {{app name}} {{domain}}

# Set up domains

dokku domains:report {{app name}}
dokku domains:add {{app name}} {{domain}}

# Find the PORT for the app
dokku proxy:ports {{app name}}

# Add https

dokku proxy:ports-add {{app name}} https:443:{{port}}

dokku config:set --no-restart {{app name}} DOKKU_LETSENCRYPT_EMAIL={{email}}

dokku letsencrypt {{app name}}

dokku letsencrypt:cron-job --add

## Restore db

dokku postgres:import {{db name}} < {{dump file}}

# Redis

dokku-root plugin:install https://github.com/dokku/dokku-redis.git
dokku redis:create {{redis app}}
dokku redis:link {{redis app}} {{app name}}

# Sidekiq
* set up redis
* create Procfile
* activate worker:

```sh
dokku ps:scale {{app name}} web=1 {{name of sidkiq process}}=1
```

# GitLab Deploy

Create key papir

ssh-keygen -t rsa -b 4096 -N "" -C "myapp-dokku-deploy" -f id_myapp_dokku

Copy private key to GitLab (under project -> Settings -> CI / CD -> Variables)

xclip -selection clipboard -in id_myapp_dokku

add public key to user `dokku` on Dokku server

# Debugging

dokku logs {{app name}}

dokku postgres:connect {{db name}}

dokku ps:restart {{app name}}
