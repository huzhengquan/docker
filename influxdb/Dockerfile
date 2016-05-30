FROM alpine:3.3
MAINTAINER zhengquan.hu <zhengquan.hu@qq.com>

ENV INFLUXDB_VERSION=0.12.2

RUN export GOPATH=/go && \
    apk add --update go git musl-dev curl && \
		git clone https://github.com/golang/crypto.git /go/src/golang.org/x/crypto \
    go get github.com/influxdata/influxdb && \
    cd $GOPATH/src/github.com/influxdata/influxdb && \
    go get -v -u -f -t ./... && \
    git checkout -q --detach "v${INFLUXDB_VERSION}" && \
    go clean -v ./... && \
    go install -v ./... && \
    chmod +x $GOPATH/bin/* && \
    mv $GOPATH/bin/* /bin/ && \
    apk del go git musl-dev && \
    rm -rf /var/cache/apk/* $GOPATH && \
    addgroup influxdb && \
    adduser -D -G influxdb influxdb && \
    mkdir -p /etc/influxdb /data/influxdb /data/influxdb/meta /data/influxdb/data /var/tmp/influxdb/wal /var/log/influxdb

EXPOSE 8083 8086

