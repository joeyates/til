# Low-level Basics

Compile source code with `rustc`

# Cargo

See [file](rust/cargo)

# Language Basics

`fn main()` is the entry point.
Lines ("statements"/"expressions") end with `;`
`//` is used for single-line comments.
Declare variables with `let`.
Variables are immutable by default.
`let mut` declares a mutable variable.

# Libraries

`use {{library}}` allows use of a library via it's name (without
  a namespace).

# Types

`::` indicates an 'associated function', called a 'static method'
  in other languages.

# Prelude

The "Prelude" is the list of libraries that are automatically imported.

The automatically `use`-d prelude:
https://doc.rust-lang.org/std/prelude/index.html#prelude-contents

# Macros

Rust has macros.

Macro names end in `!`

# Cookbook

## Dump structs

1. Ensure the struct has the Debug trait defined
2. Use `println!`:

```rust
println!("{:?}", my_struct);
```
