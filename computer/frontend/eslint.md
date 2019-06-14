# Run a single rule

yarn run eslint --no-eslintrc --parser babel-eslint --rule 'quotes: [error,single]' src/

# Disable a rule for a single line

```
const foo = "bar" // eslint-disable-line {{rule name}}
```
