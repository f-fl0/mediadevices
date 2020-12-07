FROM lherman/cross-base

ENV OSX_CROSS_PATH=/osxcross

COPY --from=dockercore/golang-cross "${OSX_CROSS_PATH}/." "${OSX_CROSS_PATH}/"
ENV PATH=${OSX_CROSS_PATH}/target/bin:$PATH

COPY init.sh /tmp/init.sh
RUN bash /tmp/init.sh
