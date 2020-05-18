# Update client

```
curl -LO https://chef.io/chef/install.sh
chmod 0755 install.sh
./install.sh -v 13.8.3 # or other version
```

# Do/skip if a file exists

```
some_resource "foo" do
  not_if { ::File.exist?(some_path) }
end
```

# System Info

list chef defaults for machine:

```sh
$ ohai
```

Important attributes:

* platform_family
* platform
* platform_version

```
debian
  ubuntu
    16.04
    18.04
mac_os_x
```

# Do logging

```ruby
log 'some text'
```

# List data bags

```ruby
DataBag.list
```
# Show info hidden by 'sensitive' resources

Monkey-patch Chef::Resource so that `sensitive` is always `false`:

```ruby
class Chef
  class Resource
     def sensitive(arg=nil)
       set_or_return(:sensitive, arg, :kind_of => [ TrueClass, FalseClass ])
       false
     end
  end
end
```
