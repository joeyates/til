https://mailu.io/1.7/

license: MIT
dokku:
can coexist with Dokku?
multiple domains: y
let's encrypt: y
installation: Docker Compose
webmail: y (choice of roundcube/other)
programming language: python

# TODO

What does the admin service do?
Can admin be disabled?

# Setup

Generate config: https://setup.mailu.io
Create data directory
Download docker-compose.yml and mailu.env

Save in /var/mailu

## Letsencrypt

* Set DNS
* Run Docker Compose *without* a valid cert
  * TLS Services will be disabled
* Get le to acquire certs by starting docker compose
* Copy certs to host path

# Configuration

https://mailu.io/master/configuration.html

# Docker Compose Services

* front: proxies admin and webmail
* admin
* webmail
* imap
* smtp
* antispam
* webdav
* redis

Docker compose exposes services on 8080, 8443, 110, 995, 143, 993

# admin

Activate in mailu.env:

```
ADMIN=true
```

## smtp

## Authentication

Automatic:
https://mailu.io/master/configuration.html#admin-account

# DNS

mail.mydomain.com. A  a.b.c.d
mydomain.com. MX 10 mail.mydomain.com.

# Ports

# Interfaces

* Webmail: /webmail/
* Admin (if enabled): /admin/

TODO:

* proxy web UIs via host nginx
https://mailu.io/master/reverse.html#have-mailu-web-frontend-listen-locally

Test:
docker-compose -p mailu up

Create admin account:
docker-compose -p mailu exec admin flask mailu admin admin joeyates.info {{password}}

# Debugging

Logs:

```sh
docker-compose logs -f front
docker-compose logs -f webmail
docker-compose logs -f smtp # debug email reception
```

Access shell

```sh
docker-compose exec front bash
```

# Cookbook

## Force TLS renewal

```console
cd /var/mailu
docker-compose down
rm -rf certs
docker-compose -p mailu up
```

The logging for front_1 should show a letsencrypt confirmation

## If docker proxies keep running

rm /var/lib/docker/network/files/local-kv.db
