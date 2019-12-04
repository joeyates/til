# mysql command line tool

# Server

## Configuration

Config is generally in files called 'my.cnf'.
Locations:
```
mysqld --help --verbose
```

# Set root password

Create file 'init.txt' in a directory that mysql can read:

>= 5.7.6

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
```

<= 5.7.5

```
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');
```

Start mysql:

```
mysqld --init-file=/path/to/init.txt &
killall mysqld
```

## Users

Create:

local user:

```
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```

network user:

```
CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';
```

grant privs on 1 db:

```
GRANT ALL PRIVILEGES ON {database}.* TO '{user}'@'%';
```

Reset root password:
https://dev.mysql.com/doc/refman/5.0/en/resetting-permissions.html

# DDL

## Databases

```
CREATE DATABASE {name} CHARACTER SET utf8 COLLATE utf8_general_ci;
```

## Tables

List tables:

```
show tables;
```

Show structure:

```
SHOW CREATE TABLE {name};
```

## Dump and Restore

### Dump:

```
mysqldump -u user database | gzip -9 > dump.sql.gz
```

Options:
* --no-create-db - don't create database
* --no-create-info - don't create tables

without blocking replication:

```
mysqldump --single-transaction -u user database | gzip -9 > dump.sql.gz 
```

### Restore

```
mysql -u user database < foo.sql
gzip -cd foo.sql.gz | mysql -u user database
```

# DML

## Operators

## Cookbook

View binary data

```
select hex({bin_field}) from {table};
```

Find records with a certain Unicode character:

```
mysql> select * from {table} where hex({field}) like '%28088';
```

# `~/.my.cnf`

Username and password for mysql client:

```
[client]
user={username}
password={password}
```

# `mysql` client

## Logon

* -u - username
* -p - ask for password

## Output control

* `pager less` `\P less`
* `nopager` `\n`

Show result fields vertically:

```
SELECT * FROM foo\G
```

# Docker

docker run --publish 3306:3306 mysql:5.7

docker run --publish 3306:3306 --env=MYSQL_ALLOW_EMPTY_PASSWORD=1  mysql:5.7
