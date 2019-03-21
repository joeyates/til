* packages: hex.pm
* docs: http://hexdocs.pm/

# rebar3

## setup

edit ~/.config/rebar3/rebar.config:
```
{plugins, [rebar3_hex]}.
```

install hex plugin:
```
rebar3 update
rebar3 plugins upgrade rebar3_hex
```
