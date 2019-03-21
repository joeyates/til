# Rails

## Logger

Add timestamp to log messages:
```
Rails.logger = Logger.new(Rails.root.join("log", "development.log"))
Rails.logger.formatter = Logger::Formatter.new
```

# ActiveRecord

## Configuration

Environment variables:

* DATABASE_URL postgres://<username>:<password>@<host>:<port>/<dbname>

## Cookbook

### Disable ActiveRecord logging

```ruby
ActiveRecord::Base.logger = nil
```

### Reset primary key

```ruby
ActiveRecord::Base.connection.reset_pk_sequence! KLASS.table_name
```

# ActionController

## params

# Sprockets

## Cookbook

### Debug compilation errors

Insert debug statements in SASS:
```
@debug $foo
```

In config/application.rb:
```
config.assets.logger = Logger.new($stdout)
```

```
rake assets:precompile
```
