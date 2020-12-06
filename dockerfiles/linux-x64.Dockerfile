FROM dockcross/linux-x64

RUN apt-get update && \
  apt-get install -y nasm

ARG IMAGE=lherman/cross-linux-x64
ARG VERSION=latest
ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}
