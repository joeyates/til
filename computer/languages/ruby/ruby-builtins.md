# Array

## Destructuring bind

```
a = [[1, 2], [3, 4]]
a.each { |(x, y)| puts x }
```

# Dir

## Cookbook

### Get filenames (without directories) from a path

???

# Enumerable

## Module methods

### reduce

With a block (a - accumulator, e - element):

```ruby
reduce(initial) { |a, e| ...; a } # => last a
```

Without a param, first `a` is the first element of the callee:

```ruby
reduce { |a, e| ...; a }
```

With symbols, implied block is `{ |a, e| a.send(:symbol, e) }`:

```ruby
reduce(initial, symbol)
reduce(symbol)
```

### map

With a block:

`map { |e| } # =>` Array of values returned by block

With a symbol, implied block is `{ |e| e.send(:symbol) }`

### collect: alias for map
### inject: alias for reduce

# File

## class methods

* dirname - get directory path (without file name)
* basename - get file name (without directory path)
* extname - get file extension
* readlink
* stat
* open

```ruby
File.open(filename, "mode:encoding")
File.open(filename, mode: mode, encoding: encoding)
```

## Cookbook

Filename without extension:
```ruby
File.basename(path_name, ".*")
```

# Hash

## Cookbook

## Defaults

Default is an Array:

```ruby
h = Hash.new { |h, k| h[k] = [] }
h[:foo] << :bar
h        # => {:foo=>[:bar]}
```

Default is a Hash:

```ruby
h = Hash.new { |h, k| h[k] = {} }
h[:foo][:bar] = true
h        # => {:foo=>{:bar=>true}}
```

Auto-vivifying hash:

The default is a Hash which has the same default.

```ruby
h = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
h[:foo][:bar][:bar][:qux] = 'Hi'
h       # => {:foo=>{:bar=>{:bar=>{:qux=>"Hi"}}}}
```

# String

## Interpolation

Sprintf style:

```ruby
'Foo %s baz' % 'bar' # => 'Foo bar baz'
'%s %s %s' % %w(Foo bar baz) # => 'Foo bar baz'
```

From a hash:

```ruby
'%{first} %{second} %{third}' % {first: 'Foo', second: 'bar', third: 'baz'}
# => "Foo bar baz"
"%<string>s %.2<float>f % 3<number>u" % {string: 'foo', float: 8.5, number: 42}
# => "foo 8.50  42"
```
