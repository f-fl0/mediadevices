#!/bin/bash

MEDIADEVICES_TOOLCHAIN_PREFIX=dockcross
MEDIADEVICES_SCRIPT_PATH=$(realpath ./scripts)
MEDIADEVICES_TOOLCHAIN_PATH=${MEDIADEVICES_SCRIPT_PATH}/${MEDIADEVICES_TOOLCHAIN_PREFIX}

MEDIADEVICES_TARGET_PLATFORMS=(
  linux-arm64
)

download_toolchains() {
  for platform in ${MEDIADEVICES_TARGET_PLATFORMS[@]}
  do
    mkdir -p ${MEDIADEVICES_TOOLCHAIN_PATH}
    image=${MEDIADEVICES_TOOLCHAIN_PREFIX}/${platform}
    bin_path=${MEDIADEVICES_TOOLCHAIN_PATH}/${MEDIADEVICES_TOOLCHAIN_PREFIX}-${platform}
    docker run ${image} > ${bin_path}
    chmod +x ${bin_path}
  done
}

build() {
  sub_builds=$(find pkg -type f -name "build.sh")
  for sub_build in ${sub_builds[@]}
  do
    sub_build=$(realpath ${sub_build})
    sub_build_dir=$(dirname ${sub_build})
    current_dir=${PWD}
    cd $sub_build_dir
    for platform in ${MEDIADEVICES_TARGET_PLATFORMS[@]}
    do
      export MEDIADEVICES_TOOLCHAIN_BIN=${MEDIADEVICES_TOOLCHAIN_PATH}/${MEDIADEVICES_TOOLCHAIN_PREFIX}-${platform}
      # convert '-' to '_' since '_' is more common in library names
      export MEDIADEVICES_TARGET_PLATFORM=${platform//-/_}
      ${sub_build}
    done
    cd ${current_dir}
  done
}

download_toolchains
build
