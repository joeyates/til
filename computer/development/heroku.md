# Setup

1. Install toolbelt (https://toolbelt.heroku.com/).

Debian/Ubuntu:

```shell
$ wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```

2. Login

```shell
$ heroku login
```

# Copy Database

restore_options = "-d #{database}"
restore_options << " -h #{host}" if host
restore_options << " -U #{user}" if user
restore_options << " -p #{port}" if port

```shell
$ heroku pg:backups:capture -r {{remote}}
$ heroku pg:backups:download -r {{remote}} --output {{dump_pathname}}
$ psql
postgres=# create database {{name}}_development;
$ pg_restore \
  --verbose --clean --no-acl --no-owner \
  #{restore_options} \
  #{dump_pathname}`
```
