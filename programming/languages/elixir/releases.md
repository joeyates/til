# Documentation

$ mix help release

* https://hexdocs.pm/phoenix/releases.html

http://blog.plataformatec.com.br/2019/05/updating-hex-pm-to-use-elixir-releases/

# Files

## `config/releases.exs`

Run-time configuration is picked up via `config/releases.exs`

Put all `System.get_env("FOO")` in `config/releases.exs`

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

### Configuration

The path is controlled by `:runtime_config_path`

# Create a Release

```sh
$ MIX_ENV=prod mix release
```

# Running Locally

* Export required environment variables

```sh
$ _build/prod/rel/my_app/bin/my_app start
```
