sudo dokku plugin:install https://github.com/dokku/dokku-redis.git redis

    redis:app-links <app>                                                        list all Redis service links for a given app
    redis:backup-auth <service> <aws-access-key-id> <aws-secret-access-key>...   set up authentication for backups on the Redis service
    redis:backup-deauth <service>                                                remove backup authentication for the Redis service
    redis:backup-schedule-cat <service>                                          cat the contents of the configured backup cronfile for the service
    redis:backup-schedule <service> <schedule> <bucket-name>...                  schedule a backup of the Redis service
    redis:backup <service> <bucket-name> [-u|--use-iam-optional]                 create a backup of the Redis service to an existing s3 bucket
    redis:backup-set-encryption <service> <passphrase>                           set encryption for all future backups of Redis service
    redis:backup-unschedule <service>                                            unschedule the backup of the Redis service
    redis:backup-unset-encryption <service>                                      unset encryption for future backups of the Redis service
    redis:clone <service> <new-service> [--clone-flags...]                       create container <new-name> then copy data from <name> into <new-name>
    redis:connect <service>                                                      connect to the service via the redis connection tool
    redis:create <service> [--create-flags...]                                   create a Redis service
    redis:destroy <service> [-f|--force]                                         delete the Redis service/data/container if there are no links left
    redis:enter <service>                                                        enter or run a command in a running Redis service container
    redis:exists <service>                                                       check if the Redis service exists
    redis:export <service>                                                       export a dump of the Redis service database
    redis:expose <service> <ports...>                                            expose a Redis service on custom host:port if provided (random port on the 0.0.0.0 interface if otherwise unspecified)
    redis:import <service>                                                       import a dump into the Redis service database
    redis:info <service> [--single-info-flag]                                    print the service information
    redis:linked <service> <app>                                                 check if the Redis service is linked to an app
    redis:link <service> <app> [--link-flags...]                                 link the Redis service to the app
    redis:links <service>                                                        list all apps linked to the Redis service
    redis:list                                                                   list all Redis services
    redis:logs <service> [-t|--tail] [<tail-num>]                                print the most recent log(s) for this service
    redis:promote <service> <app>                                                promote service <service> as REDIS_URL in <app>
    redis:restart <service>                                                      graceful shutdown and restart of the Redis service container
    redis:start <service>                                                        start a previously stopped Redis service
    redis:stop <service>                                                         stop a running Redis service
    redis:unexpose <service>                                                     unexpose a previously exposed Redis service
    redis:unlink <service> <app>                                                 unlink the Redis service from the app
    redis:upgrade <service> [--upgrade-flags...]                                 upgrade service <service> to the specified versions
