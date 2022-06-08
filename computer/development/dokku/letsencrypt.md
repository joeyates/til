letsencrypt:auto-renew <app>            Auto-renew app if renewal is necessary
letsencrypt:auto-renew                  Auto-renew all apps secured by letsencrypt if renewal is necessary
letsencrypt:cleanup <app>               Remove stale certificate directories for app
letsencrypt:cron-job [--add --remove]   Add or remove a cron job that periodically calls auto-renew.
letsencrypt:disable <app>               Disable letsencrypt for an app
letsencrypt:enable <app>                Enable or renew letsencrypt for an app
letsencrypt:help                        Display letsencrypt help
letsencrypt:list                        List letsencrypt-secured apps with certificate expiry times
letsencrypt:revoke <app>                Revoke letsencrypt certificate for app
