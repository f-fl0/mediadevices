FROM lherman/cross-darwin-base

ENV CC=o64-clang \
    CXX=o64-clang++ \
    AR=llvm-ar

ARG IMAGE=lherman/cross-darwin-x64
ARG VERSION=latest
ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}
