# Server Settings

See other file.

# Templates

## Create a template

```
=> CREATE DATABASE foo TEMPLATE template0;
=> \c foo
...set up template...
=> UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'foo';
```

# [Users][pg-roles]

## Create

```sql
CREATE ROLE name; -- doesn't attribute login privilege
CREATE USER name; -- has login
CREATE USER name WITH CREATEDB [CREATEUSER] [[ENCRYPTED] PASSWORD 'password'];
```

## Replication user

```sql
CREATE USER rep REPLICATION LOGIN CONNECTION LIMIT 1 ENCRYPTED PASSWORD 'yourpassword';
```

Via command line (usually as postgres):

```shell
$ createuser --createdb --encrypted --no-superuser --no-createrole <NAME>
```

## Passwords

By default user passwords are stored in plain text.

Passwords can be MD5 encrypted.
If ENCRYPTED is specified, the supplied password is md5 encrypted in the db,
If the supplied password is already md5 encrypted, the ENCRYPTED parameter is ignored.

### Manually create a Hashed Password

```
echo -n '[PASSWORD]''[USER NAME]' | openssl md5 | sed -e 's/^.* /md5/'
```

## Alter

```sql
ALTER ROLE user WITH CREATEDB;
ALTER ROLE user WITH PASSWORD 'password';
```

[pg-roles]: http://www.postgresql.org/docs/current/static/database-roles.html

# Databases

## Create

```
CREATE DATABASE name WITH OWNER owner TEMPLATE template ENCODING 'UTF8';
```

## Dump/Backup

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

Dump and compress:

```
pg_dump -U USER DATABASE | gzip -c > DATABASE.sql.gz
```

## Restore

From an SQL dump:

```sql
$ psql -U {user-name} -d {desintation_db} -f {dumpfilename.sql}
```

From a binary dump:

```shell
$ pg_restore -U {{user name}} -d {db name} --clean --no-owner {filename}
```

From compressed:

```
gzip -cd $DATABASE_DUMP | psql -U $DATABASE_USER $DATABASE
```

# Tables

```
CREATE TABLE {{name}} ({{field}} {{type}}[, ...]);
```

## Data Manipulation

Update based on a 'join':

```
UPDATE table1 AS t1
SET field1 = t2.name
FROM table2 t2
WHERE t1.id = t2.table1_id
```

Delete based on a 'join':

```
WITH cte1 AS (
  SELECT * FROM table1 WHERE a_field = 123
)
DELETE FROM table2 t2
USING cte1 c
WHERE c.id = t2.customer_id;
```

# Builtin Functions

## Time

Today:
```
now()::date
```

Yesterday:
```
now()::date - 1
```

# psql

Indicate cluster and version:
```
PGCLUSTER={{version}}/{{cluster}}
```

## Passwords file:

~/.pgpass (0600):

```
#host:port:database:user:password
```

## Check if Server Requires SSL

psql "sslmode=require" {{database name}}

# Extensions

* install:
```
aptitude install postgresql-contrib
su - postgres
psql DATABASE
CREATE EXTENSION pg_trgm;
```

* list: \dx
* `pg_trgm`

```
psql -f /usr/share/postgresql/8.4/contrib/pg_trgm.sql
```

* pgcrypto

## jsonb

```
select * from my_table where my_jsonb_field @> '{"foo": "bar"}'::jsonb;
```

# Output to File

```psql
\o {{filename}}
```

# CSV Output

```psql
\copy {{table}} to {{filename}} csv header
\copy ({{query}}) to {{filename}} csv header
```

```sql
COPY {{table}} TO {{filename}} DELIMITER ',' CSV HEADER;
COPY ({{query}}) TO {{filename}} DELIMITER ',' CSV HEADER;
```

# JSON Output

```psql
\pset format unaligned
\t on
select json_agg(u) from users u;
```
