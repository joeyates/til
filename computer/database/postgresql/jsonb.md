# Field Definition

```
CREATE TABLE foo (
  bar JSONB
);
```

# Operators

## Conditions

* `?`

```sql
SELECT address FROM places p where p.address->'city' ? 'London';
```

* `@>`

* `<@`
* `?`
* `?|`
* `?&`
* `@?` - does json path return any value?

## Access

NB: operators end in `>` and obtain JSON results.

* `->{{number}}` - nth Array item
* `->'{{string}}'` - dereference Object by key
* `#>`{{key1[,key2...]}}`` - dig into nested Objects and Arrays

NB: doubling the `>>` and obtains text results.

Examples:

```psql
# select '[99, 42]'::json->1;
 ?column?
--------
 42

# select '{"hi": "ciao"}'::json->'hi';
 ?column?
-------------
 "ciao"

# select '{"hi": "ciao"}'::json->>'hi';
 ?column?
-------------
 ciao

# select '[{"hi": "ciao"}]'::json->0->'hi';
 ?column?
-------------
 "ciao"

# select '{"hi": {"italian": "ciao"}}'::json->'hi';
     ?column?
---------------------
 {"italian": "ciao"}

# select '{"hi": {"italian": "ciao"}}'::json#>'{hi,italian}';
 ?column?
-------------
 "ciao"
```

## Modification

* `||`
* `-`
* `#-`

# Length

```
select array_dims(ARRAY[$${"number":"1"}$$::jsonb, $${"number":"2"}$$::jsonb]);
 array_dims
------------
 [1:2]
```

```
select array_length(ARRAY[$${"number":"1"}$$::jsonb, $${"number":"2"}$$::jsonb], 1);
 array_length
--------------
            2
```
