* Source: https://github.com/bake-bake-bake/bakeware
* Docs: https://hexdocs.pm/bakeware/readme.html

# Set Up

Blog: create an Elixir application.

Add dependency to mix.exs

```elixir
  defp deps do
    [
      ...
      {:bakeware, runtime: false}
    ]
  end
```

We set `runtime: false` as the dependency is not part
of the runtime application (See [docs](https://hexdocs.pm/mix/Mix.Tasks.Deps.html#module-dependency-definition-options)).


```sh
mix deps.get
```

Add release details to mix.exs:

```elixir
  @app :my_app

  def project do
    [
      app: @app,
      releases: [{@app, release()}],
      preferred_cli_env: [
        release: :prod
      ]
      ...
    ]
  end

...

  defp release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      quiet: true,
      steps: [:assemble, &Bakeware.assemble/1],
      strip_beams: Mix.env() == :prod
    ]
  end
```

Create the release:

```
mix release
```
