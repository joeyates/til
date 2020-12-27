https://poste.io/

CLI:

$ poste

https://admin%40poste.io:admin@demo.poste.io/admin/api/doc


Data

/var/lib/dokku/services/posteio/data/domains/joeyates.info/

# Dokku

## Install

dokku plugin:install https://github.com/D1ceWard/dokku-posteio.git

## Uninstall

dokku plugin:uninstall posteio
docker stop dokku.posteio
docker rm dokku.posteio
docker images
docker rmi analogic/poste.io:{{version}}
