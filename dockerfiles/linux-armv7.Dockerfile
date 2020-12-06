FROM dockcross/linux-armv7

ARG IMAGE=lherman/cross-linux-armv7
ARG VERSION=latest
ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}
