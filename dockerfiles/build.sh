#!/bin/bash

OWNER=lherman
PREFIX=cross
IMAGES=(
  darwin-base.Dockerfile
  darwin-x64.Dockerfile
  linux-arm64.Dockerfile
  linux-armv7.Dockerfile
  linux-x64.Dockerfile
  windows-x64.Dockerfile
)

cd $(dirname $0)

for image in ${IMAGES[@]}
do
  tag=${OWNER}/cross-${image//.Dockerfile/}
  docker build -t "${tag}" -f "$image" .
done
