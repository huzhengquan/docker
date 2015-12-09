FROM ubuntu:14.04


MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

RUN apt-get update && \
  apt-get install -y wget

ENV NODE_VERSION v5.1.1

RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz && \
  tar -xzf node-${NODE_VERSION}-linux-x64.tar.gz && \
  mv node-${NODE_VERSION}-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-${NODE_VERSION}-linux-x64.tar.gz

RUN mkdir -p /var/log/node/app/

WORKDIR /var/www/app/

EXPOSE 3000


CMD ["node","app.js"]
