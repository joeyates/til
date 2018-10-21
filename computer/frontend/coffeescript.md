# Control Structures

## For-loop

```coffeescript
for i in [0..n] by 1
  ...
```

## [Switch](http://coffeescript.org/#switch)

With control:

```coffeescript
case foo
  when 'bar' then 'foo'
  when 'baz'
    'qux'
  else
    'dunno'
```

Without control:

```coffeescript
case
  when n % 2 = 0
    'even'
  when n % 3 = 0
    'divisible by 3'
  else
    'nope'
```
