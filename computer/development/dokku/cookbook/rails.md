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
