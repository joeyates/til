# Setup

1. Install toolbelt (https://toolbelt.heroku.com/).

Debian/Ubuntu:

```shell
$ wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```

2. Login

```sh
$ heroku login
```

# Cookbook

## Copy Database from Heroku to Local

restore_options = "-d #{database}"
restore_options << " -h #{host}" if host
restore_options << " -U #{user}" if user
restore_options << " -p #{port}" if port

```sh
$ heroku pg:backups:capture -r {{remote}}
$ heroku pg:backups:download -r {{remote}} --output {{dump_pathname}}
$ psql
postgres=# create database {{name}}_development;
$ pg_restore \
  --verbose --clean --no-acl --no-owner \
  #{restore_options} \
  #{dump_pathname}`
```

## Copy Database from one Heroku App to Another

```sh
heroku pg:backups:capture -r {{remote}}
heroku pg:backups:restore `heroku pg:backups:url -r {{source remote}}` DATABASE_URL -r {{target remote}}
```

add `--confirm` to skip manual confirmation

## Get Heroku dump as plain SQL

$ heroku config:get DATABASE_URL -r production
#          USER PASSWORD HOST      DATABASE
postgres://uXXX:pYYYYYYY@ZZZZ:5432/dAAAAAAA

heroku run 'PGPASSWORD={{PASSWORD}} pg_dump --inserts --no-owner --clean -h {{HOST}} -U {{USER}} {{DATABASE}}' -r production > production.sql

# Deploy with API Key

Get API key from https://dashboard.heroku.com/account

git remote add origin https://heroku:$HEROKU_API_KEY@git.heroku.com/{{project}}.git

# Get the application's id

curl -n https://api.heroku.com/apps/$APP_NAME \
  -H "Accept: application/vnd.heroku+json; version=3"  | jq .id
