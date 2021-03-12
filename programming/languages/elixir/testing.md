# ExUnit

[See file](standard-library/ex_unit.md)

# Cookbook

## Send and receive

### In the same process

```
send self(), {__MODULE__, {{method}}, {{arguments}}}
```

```
assert_receive {{{module}}, {{method}}, {{arguments}}}, {{timeout ms}}
```
