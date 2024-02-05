Function specifications

```elixir
@spec NAME(PARAMETER_SPEC) :: RETURN_TYPE or specific value
```

Example

```elixir
@spec foo(String.t()) :: integer()
```

With parameter names

```elixir
@spec foo(bar :: String.t()) :: integer()
```

Alternatives for parameters

```elixir
@spec foo(String.t() | nil) :: integer()
```

Alternatives for return type

```elixir
@spec foo(String.t()) :: integer() | nil
```

# Behaviours

To define behaviours, define function specifications with `@callback`.

Example

```elixir
@callback foo(String.t()) :: integer()
```

Normally behaviours are defined in files without implementations.
