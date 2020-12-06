FROM dockcross/windows-static-x64-posix

RUN apt-get update && \
  apt-get install -y nasm

ARG IMAGE=lherman/cross-windows-x64
ARG VERSION=latest
ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}
