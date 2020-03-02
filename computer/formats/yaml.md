# Reuse

```yaml
foo: &foo
  a: 1

bar:
  <<: *foo
  b: 2
```
