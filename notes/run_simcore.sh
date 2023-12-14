#!/bin/bash

source "build/generators/conanrun.sh"

ARG=$1
if [ -z "$ARG" ]
then
    echo "Need to provide a config"
    exit 1
else
    CONFIG=$ARG
fi

build/external_deps/bin/simcore -settings=./configs/ \
  -boot=./configs/sim/coco-boot.json \
  -e=${CONFIG} \
  ./build/lib/edgeos \
  ./build/lib/edgeos/test \
  ./build/external_deps/lib/edgeos

