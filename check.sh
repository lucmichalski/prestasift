#!/bin/sh

set -x
set -e

if [ ! -f ./cmd/sift/bin/sift ]; then 
  cd ./cmd/sift/
  make build
  cd ../..
fi

./cmd/sift/bin/sift -m 'Db::getInstance\(\)\-\>(.*?)\((.*?)\)\;' --path 'src/modules/*' --column --byte-offset -x php . --not-preceded-by psql --not-preceded-by int --replace 'type="$1", query="$2"'
