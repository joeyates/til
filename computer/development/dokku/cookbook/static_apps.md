# Create a Static App

```sh
dokku apps:create {{app}}
git remote add dokku dokku@$DOKKU_HOST:{{app}}
touch .static
dokku config:set --no-restart $DOKKU_APP BUILDPACK_URL=https://github.com/dokku/buildpack-nginx
dokku config:set --no-restart $DOKKU_APP NGINX_ROOT=build
git push dokku
```

