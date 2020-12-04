GIT_URL=https://github.com/cisco/openh264.git
VERSION=v2.1.1
SRC_DIR=src
LIB_DIR=lib
INCLUDE_DIR=include
ROOT_DIR=${PWD}
LIB_PREFIX=libopenh264

# TODO: map target platform to OS and ARCH
OS=${MEDIADEVICES_TARGET_OS}
ARCH=${MEDIADEVICES_TARGET_ARCH}

case ${MEDIADEVICES_TARGET_OS} in
  windows)
    OS=msvc
    ;;
esac

case ${MEDIADEVICES_TARGET_ARCH} in
  armv6 | armv7 | armv8)
    ARCH=arm
    ;;
  x64)
    ARCH=x86_64
    ;;
esac

mkdir -p ${LIB_DIR} ${INCLUDE_DIR}

git clone --depth=1 --branch=${VERSION} ${GIT_URL} ${SRC_DIR}
cd ${SRC_DIR}
${MEDIADEVICES_TOOLCHAIN_BIN} make -j OS=${OS} ARCH=${ARCH}
mv ${LIB_PREFIX}.a ${ROOT_DIR}/${LIB_DIR}/${LIB_PREFIX}_${MEDIADEVICES_TARGET_PLATFORM}.a
git clean -dfx
