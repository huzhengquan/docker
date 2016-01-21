FROM alpine:3.3

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

RUN apk add --update --no-progress openjdk8 && \
  rm -rf  /tmp/* /var/cache/apk/* 
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/

RUN mkdir -p /opt && \
  wget -O - http://mirrors.hust.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -xzC /opt 
ENV PATH /opt/apache-maven-3.3.9/bin:${PATH}
