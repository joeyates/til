# Dockerfile Deployments

By default, Dokku works in a buildpack-based deployment mode.
You push your code to the Dokku server, and it detects the language and framework you are using,
and builds a Docker image for you.

An alternative to this is to use a Dockerfile-based deployment, where you can specify a container image to use for your app.

The newer `dokku git:from-image` system is more flexible.

# Create a Dockerfile App

https://dokku.com/docs/deployment/builders/dockerfiles/

Conditions for Dockerfile Deployments

* There must be a Dockerfile at the root of the repo
* There must not be a .buildpacks file at the root of the repo
* The app must not have a BUILDPACK_URL environment variable

```sh
dokku apps:create $DOKKU_APP
# Set options
dokku docker-options:add $DOKKU_APP run "-v /var/log/node-js-app:/app/logs"
# Set ports
dokku config:set node-js-app DOKKU_DOCKERFILE_PORTS="1234/tcp 80/tcp"
```

