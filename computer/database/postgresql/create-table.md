# Primary Keys

Create an `integer` primary key with auto increment:

```sql
{{column}} SERIAL
```

Also `bigserial`

The auto-increment sequence is called `TABLE_COLUMN_seq`.

Reset

```sql
ALTER SEQUENCE foo_id_seq RESTART WITH 1
```
