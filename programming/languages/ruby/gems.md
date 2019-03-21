# chef

See sysadmin/chef

# fakefs

## Cookbook

### Using pry with fakefs:

```ruby
FileUtils.mkdir_p(ENV['HOME'])
require 'pry-byebug' rescue require 'pry'
binding.pry
```

# oauth
(gem 'oauth')

## Cookbook

### Manually Check Credentials

```
consumer = OAuth::Consumer.new(
  APP_ID, APP_SECRET,
  {site: "https://api.twitter.com", :scheme => :header}
)

cons.get_request_token(oauth_callback: 'http://example.com/')
```

If an `OAuth::RequestToken` is returned, the credentials are OK.

# rake

## Cookbook

### Leave a task before completion

```ruby
next
```

### Pass Command Line Paramaters to a Task

```ruby
task :action, [:parameter1] => [:dependency1] do |_, args|
  ...
end
```

`args` is a `Rake::TaskArguments`

Call a task with parameters from the command line:

```shell
rake action[value1]
```

With spaces, put *single* quotes around the task name and parameters:

```shell
rake 'action[value with spaces]'
```

### Call tasks from Ruby

A task with no dependencies:
```
Rake.application.rake_require "tasks/foo"
Rake.application.invoke_task "foo:bar"
```

A task that dependes on Rails (':environment'):
```
Rails.application.load_tasks
Rake.application.rake_require "tasks/foo"
Rake.application.invoke_task "foo:bar"
```

In a loop, everything needs to be reset and reloaded each time:

```
foos.each do |foo|
  Rake::Task.clear
  Rails.application.load_tasks
  Rake.application.rake_require "tasks/foo"
  Rake.application.invoke_task "foo:bar"
end
