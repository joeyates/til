# jq

* https://stedolan.github.io/jq/manual/

# Quoting

* wrap the query in single ' quotes,
* inside the query, use double " quotes.

# Filters And Methods

## Generic Filters

* `| arrays` - return only arrays
* `| type` - the type: object, array, string, ...

## Object Filters

* `| keys`
* `| keys_unsorted`

## Array Filters And Methods

* `| map(filter)` - the result of runninf the filter against each item
* `| length` - the length
* `| sort` - the items sorted
* `| unique` - return each unique item once
* `| first` - the first item
* `| last` - the last item
* `[n]` - the nth item

# Example queries

## Given an array, select the 0th item

```shell
echo '["foo", "bar"]' | jq '.[0]'
"foo"
```

## Select multiple results with ','

```shell
echo '["foo", "bar"]' | jq '.[0],.[1]'
"foo"
```

## Given an object, select a single key

```shell
$ echo '{"foo": true}' | jq '.foo'
true
```

## Given an array of objects, select the 0th item and select a single key
(i.e. chain the two examples above)

```shell
echo '[{"foo": 1}, {"foo": 2}]' | jq '.[0].foo'
1
```

## Given an array of objects, select the a specific key of each

```shell
echo '[{"foo": 1}, {"foo": 2}]' | jq '. | map(.foo)'
[1, 2]
```

## Given an array of objects, select those which have a certain key

```shell
echo '[{"foo": 1}, {"bar": 2}]' | jq 'map(select(has("foo")))'
[
  {
    "foo": 1
  }
]
```

## Given an array of objects, select those where a certain value equals a certain text

```shell
$ echo '[{"foo": "Hello World!"}, {"foo": "Not here"}]' | jq 'map(select(.foo == "Hello World!"))'
[
  {
    "foo": "Hello World!"
  }
]
```

## Multiple filters


## Given an array of objects, select those where a certain value contains a certain text

```shell
$ echo '[{"foo": "Hello World!"}, {"foo": "Not here"}]' | jq 'map(select(.foo | contains("Hello")))'
[
  {
    "foo": "Hello World!"
  }
]
```

## Given an array of objects, select a certain key (gives null when missing)

```shell
$ echo '[{"foo": "Hello World!"}, {"bar": "No foo here"}]' | jq 'map(.foo)'
[
  "Hello World!",
  null
]
```

## Combine operations (|)

```shell
$ echo '[{"foo": "Hello World!"}, {"foo": "Not here"}]' | jq 'map(select(.foo | contains("Hello"))) | map(.foo)'
[
  "Hello World!"
]
```

## Build an object

```shell
$ echo '{"foo": "Hello World!"}' | jq '{bar: .foo}'
{
  "bar": "Hello World!"
}
```

## Add an array index
(for each item, return an array of the index and the item)

```shell
$ echo '[{"id": "1"}, {"id": "2"}]' | jq '. as $rows | keys_unsorted | map([., $rows[.]])'
[
  0,
  {
    "id": "1"
  }
]
[
  1,
  {
    "id": "2"
  }
]
```
