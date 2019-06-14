# Autocorrect a single cop

rubocop --auto-correct --only {{cop name}}

# Disable a cop for a section of a file

```ruby
# rubocop:disable Metrics/LineLength
...
# rubocop:enable Metrics/LineLength
```
