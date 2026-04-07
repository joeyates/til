# Dump/Backup

`pg_dump`

No changeowner:
`--no-owner`

Exclude a table:
`--exclude-table='foo*'`

Include a table:
`--table=table_match`

Drop tables first:
`--clean`

Use INSERT not COPY (slow but more transportable):
`--inserts`

No data:
`--schema-only`

