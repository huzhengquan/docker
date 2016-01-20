FROM alpine:3.3

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

RUN apk add --update --no-progress openjdk8 && \
  rm -rf  /tmp/* /var/cache/apk/* 

RUN mkdir -p /opt && cd /opt && \
  wget -O - http://mirrors.hust.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -xzC ./ 

ENV PATH /opt/apache-maven-3.3.9/bin:${PATH}
