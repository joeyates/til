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
