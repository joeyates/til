* ensure images are oriented North
* create map tiles with naming for geographic location

# Calcs

S. Giovenale on OSM

https://a.tile.openstreetmap.org/13/4358/2989.png
https://a.tile.openstreetmap.org/14/8716/5978.png
https://c.tile.openstreetmap.org/15/17433/11957.png
https://c.tile.openstreetmap.org/16/34867/23914.png
https://c.tile.openstreetmap.org/17/69734/47829.png
https://a.tile.openstreetmap.org/18/139469/95659.png
https://c.tile.openstreetmap.org/19/278939/191319.png

https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames#Derivation_of_tile_names

def get_tile_number(lat_deg, lng_deg, zoom)
  lat_rad = lat_deg/180 * Math::PI
  n = 2.0 ** zoom
  x = ((lng_deg + 180.0) / 360.0 * n).to_i
  y = ((1.0 - Math::log(Math::tan(lat_rad) + (1 / Math::cos(lat_rad))) / Math::PI) / 2.0 * n).to_i
  
  {:x => x, :y =>y}
end

L.CRS.projection = L.Projection.SphericalMercator
L.CRS.transformation = L.transformation(1, 0, 1, 0)
var ll = L.latLng(43.66418, 11.53232)
L.CRS.latLngToPoint(ll, 19)
{x: 172304959776574.25, y: 726603708264569.2}

L.Projection.SphericalMercator.project(ll).divideBy(256)

# TileMill

* https://github.com/tilemill-project/tilemill

https://github.com/appropriate/docker-postgis

* https://github.com/xingfuryda/tilemill-docker/blob/master/Dockerfile (4 years)
* https://github.com/gisce/docker-tilemill/blob/master/Dockerfile (4 years)
