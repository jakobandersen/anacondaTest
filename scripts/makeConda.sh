#!/usr/bin/env bash
set -e
root=$(git rev-parse --show-toplevel)
cd $root

iBuild=anaconda-test-conda
iExtract=anaconda-test-conda-extract

docker build -t $iBuild -f conda/build.Dockerfile .
docker create --name $iExtract $iBuild
rm -rf ./conda/conda-bld
docker cp $iExtract:/opt/conda-bld ./conda/conda-bld
docker rm $iExtract
