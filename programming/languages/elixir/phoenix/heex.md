Heex is the Phoenix templating language

An "HTML-aware and component-friendly extension of Elixir Embedded language"

Sigil `~H`

* assigns are available via `@name`
* interpolation: `<%= @name %>`

# if

```heex
<%= if condition do %>
...
<% end %>
```

# HTML attributes

Single:

```heex
<div attr={@value}>
...
```

Multiple

```heex
<div {@map_or_keyword}>
...
```

# Special Attributes

## `:let`

Receives the value passed to `render_slot(slot, value)`

## `:for`

Call the contained block repeatedly

# Function Components

## Define

```
defmodule MyComponent do
  use Phoenix.Component

  def bar(assigns) do
    ~H...
  end
end
```

## Component Use

```heex
<MyComponent.foo bar="baz"/>
```

Or, with `import`:

```elixir
import MyComponent
...

~H"""
<.foo bar="baz"/>
"""
```

With a block, defines `inner_block` (see "Slots" below):

```heex
<.foo bar="baz">
 ...
</.foo>
```

## Component attributes

https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#attr/3

```
  attr :{{NAME}}, {{TYPE}}, {{OPTIONS}}
```

`attr` applies *only* to the `def` immediatly following

* Types: `:any|:string|:atom|:boolean|:integer|:float|:list|:map|:global` or a module with defines a struct
  * global
    - accepts common HTML attributes + `:global_prefixes`
    - receives all attributes not declared by other `attr/3` calls
    - `:default` is a Map that is merged with supplied values
    - `:include` add a list of extra attributes to accept
* Options
  * required
  * default
  * examples
  * values - values which can be accepted
  * doc

## Slots

`inner_block` - the block contained by the tags in the component call

# Named slots

```
<.foo>
  <:my_slot>
  </:my_slot>
</.foo>
```

# Cookbook

## Comment out blocks

Define a component

```elixir
def ignore(assigns), do: ~H""
```

Use

```heex
<.ignore>
...
</.ignore>
```
