https://stackoverflow.com/questions/26801277/mapnik-and-local-tiff-tiles

#RUN curl -o yarn.gpg https://dl.yarnpkg.com/debian/pubkey.gpg
#RUN apt-key add yarn.gpg
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" \
#  > /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install \
    --assume-yes \
    nodejs=8.15.1-1nodesource1 \
    npm \
    yarn

http://localhost:20009/

# Raster

https://tilemill-project.github.io/tilemill/docs/guides/reprojecting-geotiff/
https://tilemill-project.github.io/tilemill/docs/guides/gdal/

## Create GeoTIFF

gdal_translate -a_srs "+proj=latlong +datum=WGS84" -of GTiff
   -co "INTERLEAVE=PIXEL" -a_ullr 2.873697280883789 51.23955125258209
   2.942361831665039 51.20725980992728 myfile.jpg myfile.tif

* gdal_translate [options] source destination

Options:
  * -a_ullr W N E S
