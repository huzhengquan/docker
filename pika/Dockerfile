FROM alpine:3.12

ARG VERSION=${VERSION:-master}

RUN apk add --no-cache --virtual .build-deps \
      curl gflags-devel snappy-devel glog-devel protobuf-devel gcc g++ tar \
    && mkdir -p /pika/tmp \
    && curl -Lk "https://github.com/Qihoo360/pika/archive/${VERSION}.tar.gz" | \
       tar -xz -C /pika/tmp --strip-components=1 \
    && cd /pika/tmp \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install PREFIX=/pika \
    && rm -rf /pika/tmp \
    && apk del .build-deps

EXPOSE 3000
VOLUME /pika/var

CMD ["/pika/bin/pika"]
