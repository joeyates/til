Reference: https://docs.docker.com/engine/reference/builder/

# ARG

# ENV

* https://docs.docker.com/engine/reference/builder/#env

```docker
ENV <key> <value>
ENV <key>=<value> <key2>=<value2>
```

# EXPOSE

Manage ports

# [FROM](https://docs.docker.com/engine/reference/builder/#from)

To start with an empty image:

```sh
FROM scratch
```

# RUN

Install an apt package

```
RUN apt-get update -y && apt-get install -y {{package(s)}} \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*
```

# VOLUME
