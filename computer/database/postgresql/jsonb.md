# Field Definition

```
CREATE TABLE foo (
  bar JSONB
);
```

# Operators

## Access

NB: operators end in `>` and obtain JSON results.

* `->{{number}}` - nth Array item
* `->'{{string}}'` - dereference Object by key
* `#>[`{{key list}}`]` - dig into nested Objects and Arrays

NB: doubling the `>>` and obtains text results.

Examples:

```psql
# select '[99, 42]'::json->1 as answer;
 answer
--------
 42

# select '{"hi": "ciao"}'::json->'hi' as translation;
 translation
-------------
 "ciao"

# select '[{"hi": "ciao"}]'::json->0->'hi' as translation;
 translation
-------------
 "ciao"

# select '{"hi": {"italian": "ciao"}}'::json->'hi' as translation;
     translation
---------------------
 {"italian": "ciao"}

# select '{"hi": {"italian": "ciao"}}'::json#>'{hi,italian}' as translation;
 translation
-------------
 "ciao"
```

## Conditions

* `?`

```sql
SELECT address FROM places p where p.address->'city' ? 'London;
```

* `@>`

* `<@`
* `?`
* `?|`
* `?&`

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
