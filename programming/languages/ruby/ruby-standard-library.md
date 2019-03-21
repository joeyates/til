# CSV

require 'csv'

## `options` Hash

* `:headers`
  * `:first_row` | `true` - use first row as headers
  * Array - used as header names

## class methods

* `foreach(path, options = {}, &block)` - read the supplied file and pass one row at a time to the block.
* `open`

## Cookbook

### Write

```ruby
require 'csv'
CSV.open(file_name, 'w') do |csv|
  csv << array
end
```

### Parse a file

```
CSV.parse({{string}}, {{options}}) do |row|
end
```

### Read a doc in a non-standard encoding

```ruby
CSV.open(file_name, 'rb:ENCODING_NAME') ...
```

# Digest

```ruby
require 'digest/sha1'
require 'digest/md5'
Digest::SHA1.hexdigest(string)
```

# [Test::Unit][test-unit-docs]

## Cookbook

### Run a single test

`ruby ` [TEST FILE] ` -n ` [TEST NAME]

[test-unit-docs]: http://www.ruby-doc.org/stdlib-2.1.5/libdoc/test/unit/rdoc/Test/Unit.html

# File

* `basename` - return the name (everything after the last directory separator),
  * with a second parameter of ".*", returns just the filename without the extension.
* `dirname` - return the path up to the last directory separator,
* `extname` - return the file's extension
