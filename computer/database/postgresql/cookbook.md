# Dump and compress

```sh
pg_dump -U USER DATABASE | gzip -c > DATABASE.sql.gz
```

# Dump as SQL inserts

```sh
pg_dump -U {{PUSER}} {{DATABASE}} --no-owner --clean --inserts | gzip -c > {{DATABASE}}-`date +%Y%m%d%H%M%S`.sql.gz
```

# Restore from an SQL dump

```sh
$ psql -U {user-name} -d {desintation_db} -f {dumpfilename.sql}
```

# Restore from a compressed SQL dump

```sh
gzip -cd $DATABASE_DUMP | psql -U $DATABASE_USER $DATABASE
```

# Restore From a binary dump

```sh
$ pg_restore -U {{user name}} -d {db name} --clean --no-owner {filename}
```

# Rename a Database

```sql
ALTER DATABASE {{current name}} RENAME TO {{new name}}
```
