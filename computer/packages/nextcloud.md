# Installation Methods

* Traditional (php + db on server)
* Raspberry Pi
* Docker
* Dokku

## Docker

https://hub.docker.com/_/nextcloud

# Management Via occ

Use

```sh
export PATH=/var/www/html:$PATH
/var/www/html/occ {{command}}
```

## occ Commands

https://docs.nextcloud.com/server/15/admin_manual/configuration_server/occ_command.html

* config:list - list enabled apps
* app:disable {{app}}

# Backup

## PostgreSQL

???

# PHP Configuration

Files: /usr/local/etc/php/conf.d/
Main: /usr/local/etc/php/conf.d/nextcloud.ini

https://docs.nextcloud.com/server/21/admin_manual/configuration_files/big_file_upload_configuration.html#configuring-your-web-server

##  upload_max_filesize

ENV: PHP_UPLOAD_LIMIT

##  post_max_size

ENV: PHP_UPLOAD_LIMIT

## memory_limit

set via PHP_MEMORY_LIMIT environment variable
Values: 2048M, etc

# Manual Configuration

```sh
ncp-config
```

* ncp-update - update nextcloud
* ncp-admin - set ncp user's password
* nc-passwd - set password for NextCloudPi Panel

# Upgrading

Upgrades need to go via each major release

## Via Tarball

* Backup

This is untested:

download tarball
docker cp {{TARBALL}} nextcloud.web.1:/var/www/
docker exec -u www-data -ti nextcloud.web.1 bash
cd /var/www
tar xf {{TARBALL}}

# Internals

## Configuration Files

* configuration: $NEXTCLOUD_ROOT/config/config.php

## Status

* log: /var/log/ncp.log

## Database

Manually create admin user:

```mysql
CREATE USER 'ncadmin'@'localhost' IDENTIFIED BY 'XXXXXXXXXXXXXX';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES on nextcloud.* to 'ncadmin'@'localhost';
FLUSH privileges;
```

# Apps

## twofactor_totp

Force disable:

nextcloud=> update oc_twofactor_providers set enabled = 0;
