# Expectations
Setup:
```
allow(object).to receive(:method).with(*parameters).and_return(result)
allow(object).to receive(:method).with(*parameters) { result }
```
Check the call:
```
expect(object).to have_received(:method).with(*parameters)
```

## Cookbook

## Change ordering

```ruby
  config.register_ordering(:global) do |items|
    items.sort_by do |group|
      case group.metadata[:type]
      when :feature then 3
      when :controller then 2
      when :model  then 1
      else 4
      end
    end
  end
```

This will only run if no ordering is specified in any loaded configuration
file.

Run as follows:

```shell
$ rspec --options xx --color --format documentation --require spec_helper
```

The `xxx` is a fake to avoid loading global or local configurations.

# Cookbook

## Checking successive calls and their parameters

```ruby
expect(:foo).to receive(:bar).with(1).ordered
expect(:foo).to receive(:bar).with(2).ordered
```

# Cookbook

## Rspec reset expectations
```
RSpec::Mocks.space.proxy_for(obj).reset
```

## Testing rake tasks

```ruby
require 'rake'

describe 'foo tasks' do
  before :all do
    Rake::Task.clear
    Rake.application.rake_require 'tasks/foo'
    Rake::Task.define_task(:environment)
  end

  before do
    Rake.application.tasks.map(&:reenable)
  end

  after :all do
    Rake::Task.clear
  end

  ...
end
```
