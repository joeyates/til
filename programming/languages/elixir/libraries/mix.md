# Help

List all mix tasks (which have a docstring):

```
mix help
```

# Elixir's builtin mix tasks

```
mix                     # Run the default task (current: mix run)
mix app.start           # Start all registered apps
mix archive             # List all archives
mix archive.build       # Archive this project into a .ez file
mix archive.install     # Install an archive locally
mix archive.uninstall   # Uninstall archives
mix clean               # Delete generated application files
mix cmd                 # Executes the given command
mix compile             # Compile source files
mix deps                # List dependencies and their status
mix deps.clean          # Remove the given dependencies' files
mix deps.compile        # Compile dependencies
mix deps.get            # Get all out of date dependencies
mix deps.unlock         # Unlock the given dependencies
mix deps.update         # Update the given dependencies
mix do                  # Executes the tasks separated by comma
mix escript.build       # Builds an escript for the project
mix help                # Print help information for tasks
mix loadconfig          # Loads and persists the given configuration
mix local               # List local tasks
mix local.hex           # Install hex locally
mix local.rebar         # Install rebar locally
mix new                 # Create a new Elixir project
mix run                 # Run the given file or expression
mix test                # Run a project's tests
iex -S mix              # Start IEx and run the default task
```

# Mix.Project

Declared in `mix.exs`

```
defmodule Foo do
  use Mix.Project

  def project do
    [...]
  end
end
```

Mix.Project.project returns a keyword list defining:

* app: the appp name as a keyword,
* version
* deps: the projects dependencies as a list (see below)

## deps

See also https://hexdocs.pm/mix/Mix.Tasks.Deps.html

A list of dependencies specified as tuples:

* {app, version|source, options}

* {app, version}

Used for apps published on hex.pm.

* {app, source}

A repository source:

```
{:foo, git: "https://github.com/foo/bar", tag: "baz"}
```

A local source:

```
{:foo, path: "/foo/bar/baz"}
```

### `options`

* `:tag`
* `:optional`
* `:only` - which environments should include the dependency, indicated as a
  single environment or as a list
* `:targets` - only include the dependency for the given targets.
  The target is specified by MIX_TARGET

Defines project configuration

# Keys

* archives - used by mix archive tasks
* build_embedded - used by `mix compile` task, copies files from
  `priv` and ?? to `_build`
