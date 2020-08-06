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

## Copy Database

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

## Get Heroku dump as plain SQL

$ heroku config:get DATABASE_URL -r production
#          USER PASSWORD HOST      DATABASE
postgres://uXXX:pYYYYYYY@ZZZZ:5432/dAAAAAAA

heroku run 'PGPASSWORD={{PASSWORD}} pg_dump --inserts --no-owner --clean -h {{HOST}} -U {{USER}} {{DATABASE}}' -r production > production.sql

# Deploy with API Key

Get API key from https://dashboard.heroku.com/account

git remote add origin https://heroku:$HEROKU_API_KEY@git.heroku.com/{{project}}.git
