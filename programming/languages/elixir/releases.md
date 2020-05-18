# Documentation

https://hexdocs.pm/mix/Mix.Tasks.Release.html

$ mix help release

http://blog.plataformatec.com.br/2019/05/updating-hex-pm-to-use-elixir-releases/

# Details

## Embedded mode

Releases run in "embedded" mode - all modules are preloaded, avoiding
the load time associated with "interactive" mode.
(See https://erlang.org/doc/system_principles/system_principles.html#code-loading-strategy)

## No Source Code

## No `mix`

# Configuration

## `config/prod.exs`

Provides compile-time configuration

## `config/releases.exs`

Provides run-time configuration - principally
allows loading of environment variables, via

```elixir
System.get_env("FOO")
```

The file is:

* Copied to the release,
* Executed when the system starts,
* The computed configuration is saved in `RELEASE_TMP`,
* Erlang system is restarted.

Example:

```elixir
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :my_app, MyApp.Repo,
  url: database_url
```

## `mix.exs`

Configuration is placed under `:releases` under `project`.

```elixir
def project() do
  [
    default_release: {{name}}, # optional
    releases: [
      {{release name}}: [
        ...
      ]
    ]
  ]
end
```

This section is optional, and is used only to override defaults.

* `:applications` - applications to start
  * `{{app name}}`: `:permanent*|:transient|:temporary|:load|:none`
* `:include_executables_for`: `[:unix,...]`
* `:strip_beams`: `true*|false` - strip debug info?
* `:runtime_config_path` - The path of the runtime configuration file
  Default: `config/releases.exs`

## `rel` directory

Can be used to override defaults.

```sh
mix release.init
```

Creates

rel/vm.args.eex - static Erlang VM config
rel/env.sh.eex - dynamic VM settings and environment access
rel/env.bat.eex - Windows only?


# Create a Release

```sh
$ MIX_ENV=prod mix release
```

# Extra files

Other files can be added to a relase via two mechanisms:

* Overlays
* Steps

# Running Locally

* Export required environment variables

```sh
$ _build/prod/rel/my_app/bin/my_app start
```
