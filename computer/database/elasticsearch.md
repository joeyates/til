# Dependencies

* Java 8 update 20 or Java 7 update 55

check:

```
java -version
```

# Tarball Installation

* [download][http://www.elasticsearch.org/download]

## Init script

```
cd /etc/init.d
wget https://raw.githubusercontent.com/elasticsearch/elasticsearch/master/src/deb/init.d/elasticsearch
cd /etc/default
wget https://raw.githubusercontent.com/elasticsearch/elasticsearch/master/src/deb/default/elasticsearch
```

In /etc/default/elasticsearch, set `ES_HOME`:
```
ES_HOME=/usr/local/share/elasticsearch
```

From tarball
```
mkdir /etc/elasticsearch
cp config/elasticsearch.yml /etc/elasticsearch
mkdir /usr/local/share/elasticsearch
cp -r . /usr/local/lib/elasticsearch/
```

# Chef installation

* [chef recipe][https://github.com/elasticsearch/cookbook-elasticsearch]

# Configuration

Modify /etc/elasticsearch/elasticsearch.yml

Stop remote access:
```
network.host: localhost
```

# Cookbook

## Get version

```
curl localhost:9200
```

## Mappings

```
curl -XGET 'http://localhost:9200/_all/_mapping' | jq .
curl -XGET 'http://localhost:9200/_all/_mappings' | jq .
```

## Settings

```
curl -XGET 'http://localhost:9200/_all/_settings' | jq .
```
