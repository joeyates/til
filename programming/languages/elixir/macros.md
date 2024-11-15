# Sources

* http://theerlangelist.blogspot.it/2014/07/understanding-elixir-macros-part-6.html
* https://dockyard.com/blog/2016/08/16/The-minumum-knowledge-you-need-to-start-metaprogramming-in-Elixir
* https://github.com/doomspork/elixir-school/blob/master/lessons/advanced/metaprogramming.md

Elixir allows the generation of code at compile time.

Elixir functions which generate code at compile time are called macros and are
defined via `defmacro`.

Thanks to macros, the programmer can manipulate the syntax trees that the
language uses internally.

In fact, much of Elixir itself is defined via macros.

The positive aspect of macros is power: they allow you to generalize code.
That means you can avoid repetitive code and also create code at compile time
that otherwise would require logic at runtime.

A good example of a poweful macro is the [`match`][plug_match] function in Plug.

[plug_match]: (https://github.com/elixir-lang/plug/blob/9a3038eaf5a308c2eef694f3f61034aa6687d724/lib/plug/router.ex#L272)

On the other hand, badly written macros can result in hard to read code.

# Chapter 1: Hello World!

In this chapter, code examples are typed directly into the Elixir REPL, *iex*.

Start `iex` in a shell:

```
$ iex
```

## First Attempt at Making a Macro

Try this:

```elixir
> defmacro print_hello_world, do: IO.puts "Hello World!"
** (ArgumentError) cannot invoke defmacro/2 outside module
```

What we've learned: You can only use `defmacro` inside a module.
This limitation makes sense: you can only use macros at compile time,
and modules are the minimal unit of compilation in Elixir.

## Second Attempt...

Here's a minimal module:

```
> defmodule MyModule do
> end
{:module, MyModule,
 <<70, 79, 82, ...>>, nil}
```

Now with the macro:

```
> defmodule MyModule do
>   defmacro print_hello_world do
>     IO.puts "Hello World!"
>   end
> end
{:module, MyModule,
 <<70, 79, 82, ...>>, {:print_hello_world, 0}}
```

Let's run it:

```
> MyModule.print_hello_world
** (CompileError) iex:2: you must require MyModule before invoking the macro
  MyModule.print_hello_world/0
```

What we've learned: Any module which uses macros needs to be required in order
for the macros to be available.

```
> require MyModule
MyModule
> MyModule.print_hello_world
Hello World!
:ok
```

OK, that printed 'Hello World!', but it doesn't really do anything more than
what `def/2` does - we're calling `MyModule.print_hello_world` and we get an
immediate result (printing 'Hello World!')

Here's the same thing with `def/2`:

```
> defmodule MyModule do
>   def print_hello_world do
>     IO.puts "Hello World!"
>   end
> end
{:module, MyModule,
 <<70, 79, 82, ...>>, {:print_hello_world, 0}}
```

```
MyModule.print_hello_world
#=> Hello World!
#=> :ok
```

## Define a Method in a Macro - First Try

Let's just define a macro containing a method, and not invoke it.

```
defmodule MyModule do
  defmacro define_hello_world do
    def hello_world do
      IO.puts "Hello World!"
    end
  end
end
** (ArgumentError) cannot invoke def/2 inside function/macro
```

What we've learned: You cannot use `def/2` directly inside a macro.

## Define a Method in a Macro - Second Try

Let's use `quote/2`, which returns the internal representation of code:

```
defmodule MyModule do
  defmacro define_hello_world do
    quote do
      def hello_world do
        IO.puts "Hello World!"
      end
    end
  end
end
{:module, MyModule, ...}
```

No errors!

What we've learned: In order to generate code, we need to use `quote`.

## Define a Method in a Macro - Third Try

We didn't actually **use** the macro in the previous example.

Let's see what happens when we do.

```
defmodule MyModule do
  defmacro define_hello_world do
    quote do
      def hello_world do
        IO.puts "Hello World!"
      end
    end
  end

  define_hello_world()
end
#=> ** (CompileError) iex:8: undefined function define_hello_world/0
```

What we've learned: You cannot invoke a macro inside the module where it is
defined.

## A Working Hello World Macro

`def/2` is a function call, just like `IO.puts` earlier. We don't want to call
functions in our macro definition we want `defmacro` to create code.

```elixir
defmodule MyModule do
  defmacro define_hello_world do
    quote do
      def hello_world do
        IO.puts "Hello World!"
      end
    end
  end
end

defmodule AnotherModule do
  require MyModule
  MyModule.define_hello_world
end

AnotherModule.hello_world
#=> Hello World!
#=> :ok
```

It works!

The macro added a function, `hello_world/0`, to another module.

# Chapter 2: Quote-unquote

## [quote][elixir-lang-docs-quote]

[elixir-lang-docs-quote]: http://elixir-lang.org/getting_started/meta/1.html

`quote` refers to the `'` character, used in the language Lisp to delimit
macro code.

Note: When you're in iex, use `h(Kernel.SpecialForms.quote/2)` to get extensive
information, not just about `quote/2`, but about macros in general.

## `quote` for Simple Types

`quote` for 'simple types' returns the item itself:

```elixir
> quote do: :foo
:foo
> quote do: 1
1
> quote do: "hello"
"hello"
```

Also for lists:

```elixir
> quote do: [:foo, 1, "hello"]
[:foo, 1, "hello"]
```

And also for tuples with *2* elements:

```elixir
> quote do: {:one, :two}
{:one, :two}
```

## `quote` in Other Cases

Above are special cases.
`quote` turns any other code into Elixir syntax trees:

The syntax trees are tuples with three elements, which vary depending on what
is represented:

## `quote` for Variables

The syntax tree for a variable is `{name, [], module}`

```elixir
> quote do: a
{:a, [], Elixir}
```

### `quote` for Function Calls

For function calls, it is `{name, metadata, arguments}`

```elixir
> quote do: 1 + 1
{:+, [context: Elixir, import: Kernel], [1, 1]}
```

## Back to Code

When debugging, it is useful to turn quoted structures into the equivalent
Elixir source code.

`Macro.to_string` turns a quoted expression into a string.

```elixir
> Macro.to_string({:+, [context: Elixir, import: Kernel], [1, 1]}}
"1 + 1"
```

## Evaluate Quoted Code

```elixir
> sum = quote do: 1 + 1
...
> Code.eval_quoted(sum)
{2, []}
```

## Pass Parameters when Evaluating

```elixir
> sum = quote do: 1 + var!(a)
{:+, [context: Elixir, import: Kernel],
...
> Code.eval_quoted(sum, [a: 3])
{4, [a: 3]}
```

What we've learned: use `var!()` to refer to a variable from the current
context.

## About `Kernel.var!/1` and `Kernel.var!/2`

So, `var!/1` allows references to external variables.
The reference can either be the variable itself, as seen above,
or a standard 3-part tuple (3-ple) as returned by quote when used on a variable
(see above).

## Hygienic Macros

Elixir macros are, by default, "hygienic".

The term "hygienic macro" indicates a macro whose variable scope is separate
from the scope of surrounding code.

## Accessing Variables Inside Macros

Inside `quote`, explicit values can be injected using `unquote`.

```
> a = "Hello"
> quote do: a
{:a, [], Elixir}
> quote do: unquote(a)
"Hello"
```

What we've learned: You can inject variables into macros with `unquote`.

It is useful to remember the analogy between strings and macro code - whatever
you put inside `quote` is compled as is, unless you use `unquote`, which allows
you to interpolate values into the macro in the same way as variables can be
interpolated into a String.

Using `unquote`, you can combine quoted expressions.

```elixir
> one_plus_one = quote do: 1 + 1
{:+, [context: Elixir, import: Kernel], [1, 1]}
> combined = quote do: IO.puts unquote(one_plus_one)
{{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [],
 [{:+, [context: Elixir, import: Kernel], [1, 1]}]}
> Macro.to_string(combined)
"IO.puts(1 + 1)"
```

## `unquote_splicing`

`unquote_splicing` can be used to inject the values of an array into another
array.

```elixir
> a = [3, 4]
> quote do: [1, unquote(a), 4]
[1, [2, 3], 4]
> quote do: [1, unquote_splicing(a), 4]
[1, 2, 3, 4]
```

## `Macro.var`

Create an AST node representing a variable.
