epmd Commands

* `epmd -names` - list names of connected nodes
* `epmd -kill` - kill any currently running instance of EPMD
* `epmd -stop {{NAME}}` - unregister a node

# Connecting Nodes

short name

name

# Cookbook

## Start epmd from Erlang code

https://github.com/fhunleth/relsync/blob/master/src/relsync.erl#L42-L48

## List Connected Nodes

```erlang
erl_epmd.names()
net_adm.names()
```

```elixir
Node.list() # doesn't include self
```

```sh
epmd -names
```
