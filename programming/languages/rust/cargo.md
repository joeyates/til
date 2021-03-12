https://doc.rust-lang.org/cargo/reference/manifest.html

Cargo is Rust's build system
It uses TOML files for configuration.

# Project Creation

```
cargo new {{project name}}
```

Creates:

* Cargo.toml
* .git
* .gitignore
* src/main.rs

# Compilation

Build a debug executable:

```
cargo build
```

builds an executable as `target/{{environment}}/{{project name}}`

Build a release version:

```
cargo build --release
```

# Dependencies

Add to Cargo.toml

```rust
{{name}} = {{version}}
```

Version can be exact ("1.1.0") or use caret or tilde

Any Cargo build will download new dependencies

# Run the project

```
cargo run
```

# Check the Program

```
cargo check
```

Checking is faster than building!
