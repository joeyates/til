```sh
echo "export DOKKU_APP=XXXXX" >> .envrc
echo "export DOMAIN_EMAIL=XXXXX" >> .envrc
echo "export APP_DOMAIN=XXXXX" >> .envrc

dokku apps:create $DOKKU_APP
dokku domains:set $DOKKU_APP $APP_DOMAIN

dokku git:from-image $DOKKU_APP {{DOCKER_IMAGE}}

dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_EMAIL=$DOMAIN_EMAIL

dokku config:set --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER=staging
dokku letsencrypt:enable $DOKKU_APP
dokku config:unset --no-restart $DOKKU_APP DOKKU_LETSENCRYPT_SERVER
dokku letsencrypt:enable $DOKKU_APP
```
