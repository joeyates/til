# dotenv

* source: https://github.com/avdi/dotenv_elixir

# ecto

## Ecto.Changeset

http://hexdocs.pm/ecto/Ecto.Changeset.html

* `get_field` - changeset.valu | model.value | default
* `validate_confirmation`
* `validate_exclusion`
* `validate_format`
* `validate_inclusion`
* `validate_length`
* `validate_number(changeset, filed, opts)`
`opts`:
 * `less_than: {value}`
 * `greater_than: {value}`
 * `less_than_or_equal_to: {value}`
 * `greater_than_or_equal_to: {value}`
 * `message: {message}`
* `validate_subset`

## Ecto.Migration

Implement `up` and `down` methods which return an array of SQL statements.
If `down` is not possible:
```elixir
raise "Non reversible migration"
```

# httpoison - HTTP client

* source: https://github.com/edgurgel/httpoison

HTTPoison.Base

# plug

* source: https://github.com/elixir-lang/plug

## Plug.Session

https://github.com/elixir-plug/plug/blob/master/lib/plug/session.ex

Conn.register_before_send(before_send(sid, config))

## Plug.Debugger

Return a debug page on errors:

```
defmodule Foo do
  use Plug.Router
  use Plug.Debugger, otp_app: :`application_name`
end
```

* :`application_name` - the name of the mix app

# poison - JSON library

* source: https://github.com/devinus/poison

# reprise

Project reloader (for development)
* source: https://github.com/herenowcoder/reprise

# shorter_maps

Elixir sigil for ES6 style object initialization (+destructuring)
