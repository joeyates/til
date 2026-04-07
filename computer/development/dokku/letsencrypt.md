# Install

```sh
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
```

Activate autorenewal

```sh
dokku letsencrypt:cron-job --add
```

Commands:

    letsencrypt:auto-renew <app>            Auto-renew app if renewal is necessary
    letsencrypt:auto-renew                  Auto-renew all apps secured by letsencrypt if renewal is necessary
    letsencrypt:cleanup <app>               Remove stale certificate directories for app
    letsencrypt:cron-job [--add --remove]   Add or remove a cron job that periodically calls auto-renew.
    letsencrypt:disable <app>               Disable letsencrypt for an app
    letsencrypt:enable <app>                Enable or renew letsencrypt for an app
    letsencrypt:help                        Display letsencrypt help
    letsencrypt:list                        List letsencrypt-secured apps with certificate expiry times
    letsencrypt:revoke <app>                Revoke letsencrypt certificate for app

# Debugging

Error

```
[DOMAIN] acme: error: 403 :: urn:ietf:params:acme:error:unauthorized :: [IP]: Invalid response from https://DOMAIN:443/.well-known/acme-challenge/NNN: 404
```

Cause:

The port mapping for HTTP (80) is not set up correctly.

Info:

```
dokku ports:report APP
```

Notice that there is no `http:80->5000` mapping.

Fix:

```
dokku ports:add APP http:80:5000
```
