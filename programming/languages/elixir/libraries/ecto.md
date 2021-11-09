# ecto

# Ecto.Changeset

http://hexdocs.pm/ecto/Ecto.Changeset.html

* `get_field` - changeset.valu | model.value | default
* `validate_confirmation`
* `validate_exclusion`
* `validate_format`
* `validate_inclusion`
* `validate_length`
* `validate_number(changeset, filed, opts)`
`opts`:
 * `less_than: {value}`
 * `greater_than: {value}`
 * `less_than_or_equal_to: {value}`
 * `greater_than_or_equal_to: {value}`
 * `message: {message}`
* `validate_subset`

# Ecto.Migration

Implement `up` and `down` methods which return an array of SQL statements.
If `down` is not possible:
```elixir
raise "Non reversible migration"
```

# Ecto.Adapters.SQL

Ecto.Adapters.SQL.to_sql(:all, Repo, query)
