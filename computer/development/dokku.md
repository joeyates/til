# Install

Debian [10, 11, 12], Ubuntu [18.04, 20.04, 22.04]

Choose a tag: https://github.com/dokku/dokku/tags

export DOKKU_TAG={{vn.nn.nn}}
wget https://raw.githubusercontent.com/dokku/dokku/$DOKKU_TAG/bootstrap.sh

or

curl -O https://raw.githubusercontent.com/dokku/dokku/$DOKKU_TAG/bootstrap.sh

bash bootstrap.sh

## ArchLinux

sudo pacman -S core/fakeroot extra/bash-completion extra/bind extra/cpio extra/docker extra/docker-compose extra/dos2unix extra/git extra/go extra/jq extra/nginx extra/openbsd-netcat extra/parallel extra/rsync extra/unzip

As user arch, manually install the following packages (!):
docker-image-labeler
gliderlabs-sigil
herokuish
man-db - no
netrc
net-tools - no
plugn
procfile-util
rsyslog
sshcommand
postgresql-libs>=8.4.1
libmariadbclient
net-snmp
python-docutils
libestr
liblogging
librelp
libfastjson
bison
flex
dokku

curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/PACKAGE.tar.gz
tar xf PACKAGE.tar.gz
cd PACKAGE
makepkg
sudo pacman -U *.pkg.tar.zst

# Create Apps

* Clone Git repo of Dokku application
* Add git remote

git remote add dokku dokku@{{hostname}}:{{app name}}

# Commands

apps

    apps:clone {{old-app}} {{new-app}}
    apps:create {{app}}
    apps:destroy {{app}}
    apps:exists {{app}}
    apps:list
    apps:lock {{app}} - stop new deploys
    apps:locked {{app}}
    apps:rename {{old-app}} {{new-app}}
    apps:report [{{app}}] - show app info
    apps:unlock {{app}}

buildpacks

    buildpacks:add [--index 1] <app> <buildpack>  Add new app buildpack while inserting into list of buildpacks if necessary
    buildpacks:clear <app>                        Clear all buildpacks set on the app
    buildpacks:list <app>                         List all buildpacks for an app
    buildpacks:remove <app> <buildpack>           Remove a buildpack set on the app
    buildpacks:report [<app>] [<flag>]            Displays a buildpack report for one or more apps
    buildpacks:set [--index 1] <app> <buildpack>  Set new app buildpack at a given position defaulting to the first buildpack if no index is specified

certs - TODO
checks - TODO
cleanup - TODO

config

    config:show {{app}} - list app environment variables
    config:set [--no-restart] {{app}} {{NAME}}={{VALUE}} [{{NAME2}}={{VALUE2}}]
    config:set {{app}} {{NAME}}={{VALUE}} [{{NAME2}}={{VALUE2}} ...]
    config:unset {{app}} {{NAME}} [{{NAME2}} ...]

docker-options

Phases are:

* build
* deploy
* run

    docker-options:add <app> <phase(s)> OPTION      Add Docker option to app for phase (comma separated phase list)
    docker-options:clear <app> [phase(s)]           Clear a docker options from application with an optional phase (comma separated phase list)
    docker-options:remove <app> <phase(s)> OPTION   Remove Docker option from app for phase (comma separated phase list)
    docker-options:report [<app>] [<flag>]          Displays a docker options report for one or more apps

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
    enter {{app}} {{container type}} - connect to container
    enter {{app}} --container-id {{container id}} - connect to container
    enter {{app}} --container-id {{container id}} {{command}} - run command in container

events - TODO
git - TODO

help

    help
    *:help - can be used on any command group

logs

    logs [-t|--tail] [-n|--num num] [-p|--ps process] $DOKKU_APP
    logs:failed $DOKKU_APP - show latest failed deploy
    logs:report [$DOKKU_APP] - show information about logging limits
    logs:set [--global|$DOKKU_APP] KEY VALUE
    logs:vector-logs - ???

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

    proxy:ports {{app}} - list configured ports
    proxy:ports-add $DOKKU_APP https:443:{{internal port}}
    proxy:ports-remove $DOKKU_APP https:443:{{internal port}}
    proxy:ports-set $DOKKU_APP https:443:{{internal port}} [SCHEME:EXTERNAL:INTERNAL]

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

shell

    shell[:COMMAND] - Spawn a shell which accepts dokku commands

ssh-keys - TODO

storage

    storage:ensure-directory {{app}} - ensure the app's directory under '/var/lib/dokku/data/storage' exists
    storage:list {{app}
    storage:mount {{app}} {{host path}}:{{container path}}  - map host directories to app directories
    storage:report [{{app}}]
    storage:unmount {{app}} {{host path}}:{{container path}}

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
