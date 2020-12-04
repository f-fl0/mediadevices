GIT_URL=https://github.com/cisco/openh264.git
VERSION=v2.1.1
SRC_DIR=src
LIB_DIR=lib
INCLUDE_DIR=include
ROOT_DIR=${PWD}

git clone --depth=1 --branch=${VERSION} ${GIT_URL} ${SRC_DIR}
cd ${SRC_DIR}
${MEDIADEVICES_TOOLCHAIN_BIN} make -j
git clean -dfx
