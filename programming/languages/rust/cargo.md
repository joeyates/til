https://doc.rust-lang.org/cargo/reference/manifest.html

Cargo is Rust's build system
It uses TOML files for configuration.

# Project Creation

```sh
$ cargo new {{project name}}
```

Creates:

* Cargo.toml
* .git
* .gitignore
* src/main.rs

# Compilation

Build a debug executable:

```sh
$ cargo build
```

builds the executable as `target/{{environment}}/{{project name}}`

Build a release version:

```sh
$ cargo build --release
```

# Dependencies

Add to Cargo.toml

```rust
{{name}} = {{version}}
```

Version can be exact ("1.1.0") or use caret or tilde

Any Cargo build will download new dependencies

# Run the project

```sh
$ cargo run
```

# Check the Program

```sh
$ cargo check
```

Checking is faster than building!
