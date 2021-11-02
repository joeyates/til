# Communicating Sequential Processes

Communicating Sequential Processes - Hoare (1971)

* Parallel processes
* Communicate via channels

# Squeak

* Newsqueak (c-likem statements, functional, GC)
* Alef Plan9 (no GC)

# New

* slices
* defer

# Agenda

"Radical simplicity"

# Features

* GC
* packages
* first-class functions
* lexical scope
* FFI
* immutable strings
* UTF-8
* partial type system

# Absent

* implicit type conversions
* ctors, dtors
* operator overload
* default parameter values
* inheritance
* generics (see below)
* exceptions (see below)
* macros

# Concurrency

* variable size stacks (??) of lightweight threads
* "goroutines"


# Standard Library

"convention over configuration"


# ?? go tool

* 1 file ??
* indication of dependencies (??)
* source contains build specification (??)

# Language

* declarations
* variables
* new types (??)
* packages and files
* scope
* composite types: array, map, struct, slice
* error handling: panic, recover, defer
* interfaces
* concurrency
* testing
* reflection
* composition not inheritance

# Execution

```go
package main

import ...

fun main() {
}
```

# import
* fails if too few, **or too many**, imports

# func

functions return lists

# var

# const

# type

# Formatting

* enforced style
* `gofmt`

# Source code

* comments: `// ...`
* filenames: `{{name}}.go`

# Libraries

## OS

* Args
* Stdin
* open({{filename}}) -> handle, error
* File
  * close

# fmt

* println
* printf

* bufio
* NewScanner (stream) (??)
* scan()
  * read in a line (chomped)
  * return truth if present
* text()
  * get current line

# Builtins

## slice

* len(s)
* s[i]
* s[m:n]
* s[m:]

# Structures

"for loop":

```go
for i := 1, i < {{value}}; i++ {
}
```

"while":

```go
for {{condition}} {
}
```

"infinite loop"

```go
for {
}
```

# Variables

```
var x[, y] {{type}}
```

```
x := {{initializer}}
```

Unused local variables are not allowed.

`make` - returns a **reference** to a map structure.

# strings

* zero value: ""

# Types

## integer

* zero value: 0
* i++ -
  * *statement*
  * no LHS allowed
  * no prefix version
