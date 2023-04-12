# Install

On Apple M1 silicon:

```
brew install simnalamburt/x/podman-apple-silicon
```

## Configure

Edit /etc/containers/registries.conf:

```
unqualified-search-registries = ["docker.io"]
```

Make podman and docker-compose runnable by
members of the `docker` group, edit vim /etc/systemd/system/sockets.target.wants/podman.socket:

```
DirectoryMode=0775
SocketMode=0660
SocketGroup=docker
```

```
chmod 0770 /run/podman
chgrp docker /run/podman
```

# Basics

https://podman.io/getting-started/

## Create a VM

```sh
podman machine init
```

```sh
podman machine start
```

## Images

List all local images:

```sh
podman images
```

List tagged versions on Docker Hub

```
podman search --list-tags docker.io/USER/NAME
```

Get the image id of a Docker Hub image

```
podman inspect USER/NAME:TAG
```

Pull an image from docker.hub

```
podman pull USER/NAME
```

```
podman pull USER/NAME:MANIFEST
```

Remove a local image:

```sh
podman rmi {{NAME}}
```

Build

```sh
podman build
```

## Containers

List running containers:

```sh
podman ps
```

List all containers:

```sh
podman ps -a
```

# search

https://docs.podman.io/en/latest/markdown/podman-search.1.html

List official images:

```
podman search --filter=is-official QUERY
```

List tags

```
podman search --list-tags {{FULL IMAGE NAME}}
```

Display more than 25 results:

```
... ---limit=NNN
```

# ps

Get containers external IP address (?)

```
podman inspect {{NAME}} | grep IPAddress
```

# Cookbook

Run an image from Docker Hub:

```
podman run -ti docker.io/{{IMAGE}}[:{{TAG}}] COMMAND
```

Copy an image to another server:

```
podman image scp USER@HOST::IMAGE USER@HOST
```

# Docker Compose

## Using podman-compose

sudo apt install python3-pip
pip3 install --user podman-compose

Add /home/joe/.local/bin to PATH

```
export PATH=/home/joe/.local/bin:$PATH
```
