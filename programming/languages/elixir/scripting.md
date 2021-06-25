# Scripting in Elixir

Scripting in this context means creating single executable
files with no dependencies.

# Make an Executable Script

Create a file

```sh
touch ~/bin/do-stuff
```

Make it executable

```sh
chmod +x ~/bin/do-stuff
```

Start the file with a Shebang

```elixir
#!/usr/bin/env elixir

IO.puts "Hello from your Elixir script!"
```

Now, when you run the script, it works as expected

```sh
$ ~/bin/do-stuff
Hello from your Elixir script!
```

# Program Structure

I suggest defining a module with a `run/1` function and
passing it the command-line arguments.

```elixir
defmodule DoStuff do
  @moduledoc false

  def run(args) do
    ...
  end
end

System.argv()
|> DoStuff.run()
```

# Parsing Command-Line Arguments

I find that `OptionParser.parse/2` from the standard library does most
of what I need. I normally pass it in a list of switches with `strict:`,
ensure there are no unexpected arguments and then convert the resulting
Keyword list into a Map and check the required keys are there.

You're left to enforce required arguments, but that's not too much work.

# Conclusion

So you can use Elixir as a scripting language without jumping through
too many hoops.
