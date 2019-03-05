# Cookbook

## Build

```
$ docker build {{url}}
```

## Build from local Dockerfile

```
docker build - < Dockerfile
```

## Run Docker

From an image:

```
docker run user/name:latest
```

## List images

```
$ docker images
```

## Delete image

```
$ docker rmi {{image id}}
```

## Delete old images

Older Docker:

```
$ docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

Newer Docker (>= 1.13):

```
$ docker system prune
```

# Containers

## Running containers

```
$ docker ps
```

## All containers

```
$ docker ps --all
```

## Remove container

$ docker rm {{id}}

# Docker Compose

Compose file:

https://docs.docker.com/compose/compose-file/compose-file-v2

docker-compose.yml

* image - the image to use for the service
* build - how to create the image for the service
  * context - path to a directory with a Dockerfile
  * dockerfile - the (non-standard) name of the dockerfile (default: Dockerfile)
