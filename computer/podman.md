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

podman machine init

podman machine start


## Images

List all local images:

```sh
podman images
```

Remove a local image:

```sh
podman rmi {{NAME}}
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
podman run -ti docker.io/{{IMAGE}}[:{{TAG}}]
```

# Docker Compose

## Using podman-compose

sudo apt install python3-pip
pip3 install --user podman-compose

Add /home/joe/.local/bin to PATH

```
export PATH=/home/joe/.local/bin:$PATH
```
