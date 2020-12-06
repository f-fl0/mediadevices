#!/bin/bash

OWNER=lherman
PREFIX=cross
IMAGES=$(ls *.Dockerfile)

for image in ${IMAGES[@]}
do
  tag=${OWNER}/cross-${image//.Dockerfile/}
  docker build -t "${tag}" -f "$image" .
done
