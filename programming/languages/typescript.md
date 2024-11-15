Types can be defined with `type` or `interface`.

Types are often declaed in `.d.ts` files.
This is useful for **libraries** so that clients
can import just the types, if needed.

# Basic types

* number
* string

## objects

If the keys and values can be anything:

```typescript
{[key: string]: string}
```

# Importing and exporting

Importing and exporting **can** be done with the `type`
??? or `interface` specifier:

```typescript
import {type MyType} from 'foo.d'
```

