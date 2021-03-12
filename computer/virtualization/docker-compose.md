# Start

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

## Cookbook

## See Logs

```sh
$ docker-compose logs -f
```
