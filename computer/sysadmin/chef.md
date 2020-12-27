https://knife-zero.github.io/

# chef-solo

Create site cookbook:

```shell
knife cookbook create NAME -o DIRECTORY
```

# Data Bags

Dump data bag with standard knife:

```
$ knife data bag show {{foo}} {{bar}} --local-mode --secret-file=data_bag_key
```

# Attributes

## Defaults

```ruby
default["foo"] = 123
```

Set if unset:

```ruby
default_unless["foo"] = 123
```

## Delayed interpolation

* attributes/default.rb

```ruby
default['version'] = '1.0'
default['url'] = "https://download/%{version}"
```

* recipes/default.rb

```ruby
remote_file '/tmp/app.zip' do
  source node['url'] % {
    version: node['version']
  }
end
```

# Standard resources

## `cookbook_file`

Install a file from file/default

## cron

Attributes:
* month
* weekday - 0-6 or :monday ... :sunday
* day - day of month
* hour
* minute
* time: :annually, :daily, :hourly, :midnight, :monthly, :reboot, :weekly, or :yearly

## file

Create a file directly, supplying content

```ruby
file {path} do
  content {content}
  user
  group
  mode
end
```

## script (bash, etc)

```
bash "{name}" do
  code ""
end
```

* action: `:run`*|`:nothing`
* code: the code to be executed

## template

Use a template (by default under 'templates/default') to create a file.

# notifies

Notify a service:

```ruby
notifies :restart, 'service[{service name}]', :delayed
```

Notify a Bash script:

```
{resource} do
   notifies :run, "bash[foo]"
end

bash "foo" do
  action :nothing
  code ""
end
```

# Testing

## Vagrant

set up Vagrant and obtain desired base image

add Vagrantfile to chef repo

```ruby
Vagrant.configure("2") do |config|
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "my_recipe"
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.data_bags_path = "data_bags"
    chef.json = {
      "apache" => {
        "listen_address" => "0.0.0.0"
      }
    }
  end
end
```
