# Install

# Commands

apps

    apps:list
    apps:create {{app}}
    apps:report {{app}} - show app info

buildpacks - TODO
certs - TODO
checks - TODO
cleanup - TODO

config

    config {{app}} - list app environment variables
    config:show {{app}} - same as `config`
    config:set {{app}} {{NAME}}={{VALUE}} [{{NAME2}}={{VALUE2}}]

docker-options - TODO

domains

    domains:add
    domains:add-global
    domains:clear
    domains:clear-global
    domains:disable
    domains:enable
    domains:remove
    domains:remove-global
    domains:report
    domains:set
    domains:set-global

enter

    enter {{app}} - connect to container

events - TODO
git - TODO

help

    help
    *:help - can be used on any command group

logs

    logs $DOKKU_APP
    logs:failed $DOKKU_APP

network - TODO
nginx - TODO

plugin

    plugin:disable
    plugin:enable
    plugin:install {{URL}}
    plugin:install-dependencies
    plugin:list
    plugin:trigger - trigger a plugin hook
    plugin:uninstall
    plugin:update

proxy

    proxy:ports {{app}}

ps - container processes

    ps:inspect $DOKKU_APP - Display sanitized `docker inspect`
    ps:rebuild $DOKKU_APP - force a full rebuild
    ps:report - show status of all apps
    ps:report $DOKKU_APP - show status of a single app
    ps:restart $DOKKU_APP
    ps:restore - restart apps (e.g. after reboot)
    ps:scale $DOKKU_APP web=1 [process=instances]
    ps:start $DOKKU_APP
    ps:stop $DOKKU_APP

repo - TODO
resource - TODO

run

    run [ --env KEY=VALUE | -e KEY=VALUE ] <app> <cmd>  # Run a command in a new container using the current application image

scheduler-docker-local - TODO
shell - TODO
ssh-keys - TODO

storage

    storage:list
    storage:mount {{app}} {{host path}}:{{container path}}  - map host directories to app directories
    storage:report
    storage:unmount

taks - TODO
tar - TODO
trace - TODO
url - TODO
urls - TODO
version - TODO

# Full Command Info

# log

Tail:

    dokku logs $DOKKU_APP -t

# Cookbook

## Reduce Resource Usage

https://github.com/Flink/dokku-psql-single-container

It doesn't support multiple concurrent versions.
