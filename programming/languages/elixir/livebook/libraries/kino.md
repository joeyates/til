# Kino.Control

* stream - accept messages from Controls/Inputs and produce a Stream

# Kino.Image

* new(binary, mime)

binary - must be an Elixir binary,

# Rendering

Maybe Kino.Frame gives most control

# Streams

These produce events on every change:

* `Kino.Control.button`
* `Kino.Input.checkbox`

These produce events when they have been changed and they lose focus, or <Enter> is pressed:

* `Kino.Control.form`
* `Kino.Input.color`
* `Kino.Input.number`
* `Kino.Input.range`
* `Kino.Input.text`
* `Kino.Input.url`

```elixir
input = Kino.Input.checkbox("Input")
Kino.render(input)

for event <- Kino.Control.tagged_stream([input: input]) do
  IO.inspect(event)
end
```

```elixir
number = Kino.Input.number("Number", default: 0)

form =
  Kino.Control.form(
    [number: number],
    report_changes: true
  )
Kino.render(form)

for event <- Kino.Control.stream(form) do
  IO.inspect(event)
end
```

```elixir
button = Kino.Control.button("Hello")
Kino.render(button)
Kino.Control.stream(button)
|> Kino.animate(fn a -> IO.inspect(a) end)
```
