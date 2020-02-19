https://openmaptiles.org/

* Packages publicly available OpenStreetMap data
* Provides Docker server https://openmaptiles.com/server/
  * Docker Hub image: klokantech/openmaptiles-server
* Code: https://github.com/openmaptiles/

## openmaptiles server

Needs a paid-for license to access maps other than Zurich.

https://github.com/klokantech/tileserver-gl.git

docker run --rm -it -v $(pwd):/data -p 8080:80 klokantech/openmaptiles-server

Available on http://localhost:8080/

Runs node 6.14.4
Uses memcache
