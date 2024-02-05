# docker

## Build

```
$ docker build {{url}}
```

## Build from local Dockerfile

```sh
docker build .
```

## Build from local Dockerfile with tag

```sh
docker build --tag {{user}}/{{name}}:{{tag}} .
```

## Run Docker

From an image:

```
docker run user/name:latest
```

From a Dockerfile, first build, then run.

Run bash only, and clean up afterwards:

```
docker run --rm -ti IMAGE:TAG /bin/bash
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

## Start a named Container

```
docker container start NAME
```

## Stop a named Container

```
docker container stop NAME
```

## Connect to a Running Container's std in/out/err:

```
docker attach {{id}}
```

Detach: CTRL-p CTRL-q

## Launch a process in a Running Container

```sh
docker exec -ti {{id}}
```

Pass environment variables:

```sh
docker exec -e {{NAME}}={{VALUE}} {{CONTAINER}} {{COMMAND}}
```

Run as a user:

```
... -u {{user}} ...
```

## Remove Container

```sh
$ docker rm {{id}}
```

# docker network

List networks:

docker network ls

Get info about a network:

docker network inspect NETWORK

# Volumes

Run an image and attach a host directory as a volume

```sh
docker run -ti -v {{HOST PATH}}:{{CONTAINER PATH}} {{IMAGE}} bash
```

## Network

1. Create the network
2. Launch containers indicating the network

```sh
docker run -ti --network {{NETWORK}} {{IMAGE}} bash
```

# Cookbook

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

## Copy files into a container

```sh
docker cp {{file or directory}} {{container}}:{{destination path}}
```

# Logs

```sh
docker logs {{container}}
```
