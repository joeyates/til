# Variables

* RUBYLIB
* ARGV - an array with the parameters passed to the program
* $0 - the script name
* __FILE__ - source file name

# Execution

## Exceptions

### inline rescue

Multiple statements:

```ruby
<expression> rescue (<expression>; <expression>)
```

```ruby
<expression> rescue (->{<expression>; <expression>}).call
```

## Cookbook

### Edit files in place

```
ruby -pi -e 'RUBY CODE' FILE1[ FILE2]
```

# Source code

## Cookbook

### Set encoding

```
# encoding: utf-8
```

### Force file type (vim)

```
# vim: :set filetype=ruby :
```
