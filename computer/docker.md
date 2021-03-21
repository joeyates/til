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

## Connect to a Running Container's std in/out/err:

```
docker attach {{id}}
```

Detach: CTRL-p CTRL-q

## Launch a process in a Running Container

```sh
docker exec {{id}}
```

## Remove Container

$ docker rm {{id}}

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

# Dockerfile

## ENV

* https://docs.docker.com/engine/reference/builder/#env

```docker
ENV <key> <value>
ENV <key>=<value> <key2>=<value2>
```

## EXPOSE

Manage ports

## [FROM](https://docs.docker.com/engine/reference/builder/#from)

## VOLUME

# Logs

```sh
docker logs {{container}}
```
