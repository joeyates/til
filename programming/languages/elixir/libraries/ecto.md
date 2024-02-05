# ecto

# Ecto.Changeset

http://hexdocs.pm/ecto/Ecto.Changeset.html

* `cast_assoc/2`
* `put_assoc/2`

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

# Ecto.Schema

Associations:

* `has_many/2`
* `belongs_to/2`

https://hexdocs.pm/ecto/associations.html#the-has-many-association
https://hexdocs.pm/ecto/polymorphic-associations-with-many-to-many.html

# Ecto.Adapters.SQL

```
Ecto.Adapters.SQL.to_sql(:all, Repo, query)
```

