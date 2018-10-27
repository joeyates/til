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
