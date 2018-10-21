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

Checking successive calls and their parameters

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
