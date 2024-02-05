# jq

* https://stedolan.github.io/jq/manual/

# Quoting

* wrap the query in single ' quotes,
* inside the query, use double " quotes.

# Filters And Methods

## Referencing

* `.` - the input
* `debug` - print and pass on the input

## Generic Filters

* `| arrays` - return only arrays
* `| type` - the type: object, array, string, ...

## Object Filters

* `| keys`
* `| keys_unsorted`
* `select(condition)`

## Array Filters And Methods

* `| map(filter)` - the result of running the filter against each item
* any - https://jqlang.github.io/jq/manual/#any
* select - https://jqlang.github.io/jq/manual/#select
* `| length` - the length
* `| sort` - the items sorted
* `| unique` - return each unique item once
* `| first` - the first item
* `| last` - the last item
* `[n]` - the nth item
* `.[x:y]` - select a range
* `.= {"key1", "key2"}` - return an object with only the indicated keys

## debug

https://jqlang.github.io/jq/manual/#debug

## map

https://jqlang.github.io/jq/manual/#map-map_values

# Example queries

## Given an array, select the nth item

```shell
echo '["foo", "bar"]' | jq '.[0]'
"foo"
```

## Given an object, select a single key

```shell
$ echo '{"foo": true}' | jq '.foo'
true
```

## Given an array of objects, select the nth item and select a single key
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

## Select multiple results with ','

```shell
echo '["foo", "bar"]' | jq '.[0],.[1]'
"foo"
"bar"
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
