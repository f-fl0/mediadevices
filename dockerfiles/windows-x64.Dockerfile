FROM dockcross/windows-static-x64

ARG IMAGE=lherman/cross-windows-x64
ARG VERSION=latest
ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}

COPY init.sh /tmp/init.sh
RUN bash /tmp/init.sh
