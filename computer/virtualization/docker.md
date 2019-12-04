# docker

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

## List Running containers

```
$ docker ps
```

## List All containers

```
$ docker ps --all
```

## Connect to a Running Container

```
docker attach {{id}}
```

Detach: CTRL-p CTRL-q

## Remove Container

$ docker rm {{id}}

# Cookbook

## See Logs

```sh
$ docker-compose logs -f
```

## Copy a Docker Image to Another Machine

On source machine:

```sh
$ docker save --output {{image output pathname}} {{image}}
```

```sh
$ docker load --input {{image pathname}}
```

## Get the Container ID

```
container_id=$(docker ps --all | grep -P {{regex}} | cut -d ' ' -f 1)
```

## Remove Containers with Matching a Pattern

```sh
docker rm $(docker ps --all | grep -P '{{regex}}' | cut -d ' ' -f 1)
```

## Remove Images Matching a Pattern

```sh
docker rmi $(docker images | grep -P '{{regex}}' | tr -s ' ' | cut -d ' ' -f 3)
```

## List containers using a volume

```sh
$ docker ps -a --filter volume={{NAME}}
```

## Copy a Volume

```sh
docker volume create --name {{NEW}}
docker run --rm -i -t -v $OLD:/from -v $NEW:/to alpine ash -c "cd /from ; cp -av . /to"
```

# Dockerfile

## ENV

* https://docs.docker.com/engine/reference/builder/#env

```docker
ENV <key> <value>
ENV <key>=<value> <key2>=<value2>
```

## [FROM](https://docs.docker.com/engine/reference/builder/#from)

# Docker Compose

Start

```
docker-compose up
```

Compose file:

https://docs.docker.com/compose/compose-file/compose-file-v2

docker-compose.yml

* image - the image to use for the service
* build - how to create the image for the service
  * context - path to a directory with a Dockerfile
  * dockerfile - the (non-standard) name of the dockerfile (default: Dockerfile)
