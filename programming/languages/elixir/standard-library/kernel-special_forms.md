https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1

From lib/mix/lib/mix/compilers/elixir.ex (elixir source)

    for %{scm: scm, opts: opts} = dep <- Mix.Dep.cached(),
        not scm.fetchable?,
        Mix.Utils.last_modified(Path.join([opts[:build], ".mix", base])) > modified,
        reduce: {%{}, %{}, %{}, old_exports} do
      {deps, modules, exports, new_exports} ->
        {modules, exports, new_exports} =
