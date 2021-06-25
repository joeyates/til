# Commands

postgres:app-links <app>                                                        list all Postgres service links for a given app
postgres:backup-auth <service> <aws-access-key-id> <aws-secret-access-key>...   sets up authentication for backups on the Postgres service
postgres:backup-deauth <service>                                                removes backup authentication for the Postgres service
postgres:backup-schedule-cat <service>                                          cat the contents of the configured backup cronfile for the service
postgres:backup-schedule <service> <schedule> <bucket-name>...                  schedules a backup of the Postgres service
postgres:backup <service> <bucket-name> [-u|--use-iam-optional]                 creates a backup of the Postgres service to an existing s3 bucket
postgres:backup-set-encryption <service> <passphrase>                           sets encryption for all future backups of Postgres service
postgres:backup-unschedule <service>                                            unschedules the backup of the Postgres service
postgres:backup-unset-encryption <service>                                      unsets encryption for future backups of the Postgres service
postgres:clone <service> <new-service> [--clone-flags...]                       create container <new-name> then copy data from <name> into <new-name>
postgres:connect <service>                                                      connect to the service via the postgres connection tool
postgres:create <service> [--create-flags...]                                   create a Postgres service
postgres:destroy <service> [-f|--force]                                         delete the Postgres service/data/container if there are no links left
postgres:enter <service>                                                        enter or run a command in a running Postgres service container
postgres:exists <service>                                                       check if the Postgres service exists
postgres:export <service>                                                       export a dump of the Postgres service database
postgres:expose <service> <ports...>                                            expose a Postgres service on custom port if provided (random port otherwise)
postgres:import <service>                                                       import a dump into the Postgres service database
postgres:info <service> [--single-info-flag]                                    print the service information
postgres:linked <service> <app>                                                 check if the Postgres service is linked to an app
postgres:link <service> <app> [--link-flags...]                                 link the Postgres service to the app
postgres:links <service>                                                        list all apps linked to the Postgres service
postgres:list                                                                   list all Postgres services
postgres:logs <service> [-t|--tail]                                             print the most recent log(s) for this service
postgres:promote <service> <app>                                                promote service <service> as DATABASE_URL in <app>
postgres:restart <service>                                                      graceful shutdown and restart of the Postgres service container
postgres:start <service>                                                        start a previously stopped Postgres service
postgres:stop <service>                                                         stop a running Postgres service
postgres:unexpose <service>                                                     unexpose a previously exposed Postgres service
postgres:unlink <service> <app>                                                 unlink the Postgres service from the app
postgres:upgrade <service> [--upgrade-flags...]                                 upgrade service <service> to the specified versions

# Cookbook

Get an app's postgresql service:

```sh
$ dokku postgres:app-links $DOKKU_APP
```

Connect via psql

```sh
$ dokku postgres:connect {{SERVICE}}
```
