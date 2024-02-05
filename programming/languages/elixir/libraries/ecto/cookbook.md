# Upsert

If `Person.email` is a unique column:

```
Repo.insert!(
  struct!(Person, attrs),
  on_conflict: [set: [email: attrs[:email]]],
  conflict_target: :email
)
```

# Validate URL

```
  @spec validate_url(Ecto.Changeset.t(), atom) :: Ecto.Changeset.t()
  def validate_url(changeset, field) do
    validate_change(changeset, field, fn _, value ->
      uri = URI.parse(value)
      cond do
        uri.scheme != "http" and uri.scheme != "https" ->
          [{field, {"is not a valid URL", [validation: :url]}}]
        !(uri.host =~ ~r/\./) ->
          [{field, {"is not a valid URL", [validation: :url]}}]
        true ->
          []
      end
    end)
  end
```

# TODO

* association inserts/updates
