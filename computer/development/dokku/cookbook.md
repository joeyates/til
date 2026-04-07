# Add a User to the Dokku Host


# Deploy

Deployment methods depend on the app type: buildpack, git-from-image, or dockerfile.

## Buildpack Deployment

```sh
git remote add dokku dokku@$DOKKU_HOST:{{app}}
git push dokku
```

# Set a Single App's Default Git Branch

```sh
dokku git:set $DOKKU_APP deploy-branch {{BRANCH NAME}}
```

# Nginx Config

https://dokku.com/docs/networking/proxies/nginx/#customizing-the-nginx-configuration

## Uploads

```sh
dokku nginx:set $DOKKU_APP client-max-body-size 50m
```

## Encode Config Variables

```sh
dokku config:set --encoded {{app}} {{variable}}="$(echo -n {{value}} | base64)"
```

# Storage

Create the directory /var/lib/dokku/data/storage/$DOKKU_APP :

```sh
dokku storage:ensure-directory "$DOKKU_APP"
```

Mount storage

```sh
dokku storage:mount $DOKKU_APP /var/lib/dokku/data/storage/$DOKKU_APP/data:/data
```

# Password protection with http_auth module

```sh
dokku plugin:install https://github.com/dokku/dokku-http-auth.git
dokku http-auth:add-user <app> <user> <password>
```

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
