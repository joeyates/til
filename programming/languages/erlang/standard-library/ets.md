Check table exists

```
ref = :ets.whereis(@table)
```

Create table

https://www.erlang.org/doc/man/ets.html#new-2

```
_name = :ets.new(@table, [TYPE, ACCESS, :named_table])
```

Types:

* set (default) - key-value, not ordered
* ordered_set - key-value in Erlang term order
* bag
* duplicate_bag

Access:

* public
* protected (default)
* private

Set a value

```
:ets.insert(@table, {:my_key, value})
```

Retrieve a value

```
[{:my_key, value}] = :ets.lookup(@table, :my_key)
```
