Dump single expression nodes:

  def dump_meta(ast) do
    Macro.prewalk(ast, fn
      {atom, meta, args} = node when is_atom(atom) ->
        IO.puts ""
        IO.puts "atom: #{inspect(atom, [pretty: true, width: 0])}"
        IO.puts "meta: #{inspect(meta, [pretty: true, width: 0])}"
        IO.puts "args: #{inspect(args, [pretty: true, width: 0])}"
        node
      node ->
        node
    end)
  end

  # This function alters the AST metadata, ensuring there are:
  # * :context
  # * :import
  # * :keep
  # The :keep tuple contains the supplied file,
  # and any existing value for `:line` or,
  # if missing, the supplied `default_line`.
  def set_keep(code, file, default_line \\ 1) do
    Macro.prewalk(code, fn
      {_atom, [keep: _keep] = _meta, _right} = node ->
        node

      {atom, meta, right} when is_atom(atom) ->
        line = meta[:line] || default_line
        context = meta[:context] || __MODULE__
        imp = meta[:import] || Kernel
        updated = meta
        |> Keyword.delete(:line)
        |> Keyword.put(:context, context)
        |> Keyword.put(:import, imp)
        |> Keyword.put(:keep, {file, line})
        {atom, updated, right}

      node ->
        node
    end)
  end
