FROM dockcross/base:latest

ENV OSX_CROSS_PATH=/osxcross

COPY --from=dockercore/golang-cross "${OSX_CROSS_PATH}/." "${OSX_CROSS_PATH}/"
ENV PATH=${OSX_CROSS_PATH}/target/bin:$PATH

RUN apt-get update && \
  apt-get install -y nasm clang llvm

