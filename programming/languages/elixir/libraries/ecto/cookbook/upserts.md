# Upsert

Using `Person.email` as a unique column.

```sh
mix ecto.gen.migration create_foos_table name:string:unique
```

Generated migration:

```elixir
defmodule MyApp.Repo.Migrations.CreateFoosTable do
  use Ecto.Migration

  def change do
    create table(:foos) do
      add :name, :string, null: false
      timestamps()
    end

    create unique_index(:foos, [:name])
  end
end
```

```elixir

  @doc """
  Upserts a foo.

  ## Examples

      iex> upsert_foo(attrs)
      {:ok, %Foo{}}

      iex> upsert_foo(attrs)
      {:error, %Ecto.Changeset{}}

  """
  def upsert_foo(attrs) do
    with changeset = Foo.changeset(%Volume{}, attrs),
         :ok <- valid?(changeset),
         replace = (changeset.changes |> Map.keys()) ++ [:updated_at] do
      Repo.insert(
        changeset,
        on_conflict: {:replace, replace},
        conflict_target: [:name],
        returning: true
      )
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, changeset}
    end
  end

  defp valid?(changeset) do
    if changeset.valid? do
      :ok
    else
      {:error, changeset}
    end
  end
```
