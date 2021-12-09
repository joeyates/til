# Keywords

## switch

```
switch (expr) {
  case {{VALUE}}:
    ...
    break;
  [default: ...]
}
```

Can be replaced with an Object literal

# Modules

* import

Import a named export:

```
import { name } from "module";
```

# Functions

Traditional:

```
function foo(args) {
}
```

Function expression:

```
var foo = function(args) {
}
```

Arrow function (ES6):

```
(args) => {
}
```

...with one argument:

```
arg => {
}
```

...with one expression (returning result):

```
arg => expression;
```

...if expression is an Object literal, use parentheses:

```
arg => ({foo: "bar"})
```

# Array

Methods:
* indexOf

# Date

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date

## Methods

* Date()
* Date(value)
* Date(dateString) - accepts ISO 8601 and RFC 2822

* parse - convert ISO 8601 to epoch milliseconds

## Prototype methods

* toISOString() - to ISO 8601 with UTC (zero) time zone

# Web Workers

* do not have access to any DOM

methods:

postMessage(...args)
"structured cloning"

* can only pass objects that support copying

postMessage(...args, [...args])
"transferrable objects"

* can only pass Transferrable types (ArrayBuffer, CanvasProxy, MessagePort)
http://www.w3.org/html/wg/drafts/html/master/infrastructure.html#transferable-objects


# Introspection

* arguments object in functions:
  * callee
(this is deprecated, use the function object)

* Function object in functions:

```javascript
Foo.prototype.bar = function() {
  console.log(this.bar);
}
```
Attributes:
  * caller

# Cookbook

## Wrap a method

```javascript
(function (method) ->
  Class.prototype.method = ->
    ...do stuff...
    var result = method.apply(this, arguments);
    ...do stuff...
    return result;
)(Class.prototype.loaded);
```
