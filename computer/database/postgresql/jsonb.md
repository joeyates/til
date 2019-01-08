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

* `@>`
* `<@`
* `?`
* `?|`
* `?&`

## Modification

* `||`
* `-`
* `#-`
