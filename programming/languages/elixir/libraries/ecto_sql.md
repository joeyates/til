# Ecto.Migration

## Field Definitions

* `references` - creates a foreign key constraint
  options:
    * :on_delete - :nothing*|:delete_all|:nilify_all|{:nilify, columns}|:restrict
