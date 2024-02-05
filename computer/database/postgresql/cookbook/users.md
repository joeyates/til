# [Users][pg-roles]

# Create

```sql
CREATE ROLE name; -- doesn't attribute login privilege
CREATE USER name; -- has login
CREATE USER name WITH CREATEDB [CREATEUSER] [[ENCRYPTED] PASSWORD 'password'];
```

# Replication user

```sql
CREATE USER rep REPLICATION LOGIN CONNECTION LIMIT 1 ENCRYPTED PASSWORD 'yourpassword';
```

Via command line (usually as postgres):

```shell
$ createuser --createdb --encrypted --no-superuser --no-createrole <NAME>
```

# Passwords

By default user passwords are stored in plain text.

Passwords can be MD5 encrypted.
If ENCRYPTED is specified, the supplied password is md5 encrypted in the db,
If the supplied password is already md5 encrypted, the ENCRYPTED parameter is ignored.

### Manually create a Hashed Password

```
echo -n '[PASSWORD]''[USER NAME]' | openssl md5 | sed -e 's/^.* /md5/'
```

# Alter

```sql
ALTER ROLE user WITH CREATEDB;
ALTER ROLE user WITH PASSWORD 'password';
```

[pg-roles]: http://www.postgresql.org/docs/current/static/database-roles.html
