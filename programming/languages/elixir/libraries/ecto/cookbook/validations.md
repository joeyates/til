# Validate URLs

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


