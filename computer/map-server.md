# Tiles

Types:

* vector
* raster

## Creating Raster Tiles

* Use TileMill
* serve tiles from server via static directory structure

https://www.e-education.psu.edu/geog585/node/711

# Docker TileMill

https://github.com/madefor/docker-tilemill/blob/master/Dockerfile
https://github.com/kartoza/docker-tilemill
https://github.com/ingmapping/docker-tilemill
https://github.com/xingfuryda/tilemill-docker
https://gist.github.com/porjo/bfc22ffc99dee32a6747f37c65381fc0
https://github.com/gisce/docker-tilemill/blob/master/Dockerfile

# Mapping Software

Most map systems comprise two elements:

* a tile server
* in-browser (Javascript) code that requests and presents the tiles.

# geoserver

* Open source (GPL) map server written in Java
* https://github.com/geoserver/geoserver

# kosmtik

* extendable mapping framework
* https://github.com/kosmtik/kosmtik
* Components:
  * Carto
  * node-mapnik
  * internal node-js based tileset web service

# Leaflet

* lightweight JS client library
* https://leafletjs.com/

## https://leafletjs.com/reference-1.4.0.html#tilelayer

* by default, tiles are 256x256 pixels

Example tile:
https://a.tile.openstreetmap.org/9/253/167.png

# Mapnik

* mapnik - Open source mapping toolkit
* https://mapnik.org/
* https://en.wikipedia.org/wiki/Mapnik
* https://github.com/mapnik/mapnik

# mapserver

* Open source (MIT) Apache + C map tile server
* Source: https://github.com/mapserver/mapserver
* Structure:
  * Apache
  * mod_mapserver
  * Dockerfile
* Language: C

# openmaptiles

* proprietary map system (server + frontend)

# openstreetmap-carto

* postgres-backed map server and frontend
* https://github.com/gravitystorm/openstreetmap-carto
* Docker compose
* postgis
* kosmtik
  * .kosmtik-config.yml - the "carto project"
  * localconfig.json

## Resources

* https://ircama.github.io/osm-carto-tutorials/

## Usage

* clone
* download pbf data as data.osm.pbf in project root
* docker-compose up import (takes many minutes)
* docker-compose up kosmtik

# TileMill

* https://tilemill-project.github.io/tilemill/
* Docs: https://tilemill-project.github.io/tilemill/docs/crashcourse/introduction/
* https://github.com/tilemill-project/tilemill

# TileServerGL

* https://github.com/klokantech/tileserver-gl
* http://tileserver.org/
* server for vector tiles, rendered as raster

# Glossary

* Carto - CartoCSS
* CartoCSS - a CSS-like language for map design
* Slippy Map - a zoomable and pan-able map
