# exrm - Elixir Release Manager

Provides mix tasks for building, upgrading, and controlling release
packages.

* [code](https://hex.pm/packages/exrm)
* [docs](https://hexdocs.pm/exrm)

## Overview

* releases are built in `rel/{app_name}/releases/{version}`,
* where {version} comes from `mix.exs`
* `rel/{app_name}/releases/start_erl.data` contains info about the
  current version,
* `rel/{app_name}/releases/RELEASES` contains a list of dependencies
  and versions.
* `rel/{app_name}/releases/{version}/{app_name}.sh` is a script, called
  'boot file'

## Build

```
MIX_ENV=prod mix release
```

## Boot file
[code](https://github.com/bitwalker/exrm/blob/master/priv/rel/files/boot)

Path:
```
rel/{app_name}/releases/{version}/{app_name}.sh
```

On deployment machine, shim to load current version:
```
bin/{app_name} {command}
```

Commands:
* start - start the application and demonize it
* start_boot {file}
* foreground
* stop
* restart
* reboot
* ping
* rpc
* console - start application and attach to console
* console_clean
* attach - attach to the running application (detach with ^D)
* upgrade
* downgrade

### run (rpc)

```
$ ./bin/{app_name} rpc Elixir.Path basename "[\"/ciao/hello\"]."
Using {deploy_path}/releases/{version}/{app_name}.sh
<<"hello">>
```

## First Deployment or Replace Application which is Stopped

On build machine:

```
scp \
  rel/{app_name}/releases/{version}/{app_name}.tar.gz \
  {user}@{host}:{deploy_path}
```

On deployment machine:

```
tar xf {app_name}.tar.gz
```

## Upgrade

Code:
* set new app version in mix.exs

On deployment machine:

```
cd {deploy_path}
mkdir releases/{version}
```

On build machine:

```
scp \
  rel/{app_name}/releases/{version}/{app_name}.tar.gz \
  {user}@{host}:{deploy_path}/releases/{version}/
```

On deployment machine:

(existing application should be running)

```
cd {deploy_path}
bin/{app_name} upgrade {version}
```

## Local testing

Use boot file (see above)

## Logging

is in ./log

# Releases

## Cookbook

## Available in remote console:

```
PhotoScraper.module_info()
PhotoScraper.Endpoint.module_info()
Mix.Tasks.PhotoScraper.Scrape.module_info()
PhotoScraper.Scrapers.Manfrotto.run
```

## Run Code

```
bin/photo_scraper rpc Elixir.PhotoScraper.Scrapers.Manfrotto run "[]."
```

### Run migrations

```
./bin/{app_name} rpc Elixir.Ecto.Migrator run \
  "['Elixir.{AppModule}.Repo', <<\"{deploy_path}/lib/{app_name}-{version}/priv/repo/migrations\">>, up, [{all, true}]]."
```
