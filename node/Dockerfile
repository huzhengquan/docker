FROM ubuntu:14.04


MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

RUN apt-get update && \
  apt-get install -y wget && \
  apt-get clean

ENV NODE_VERSION v5.3.0

RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz && \
  tar -xzf node-${NODE_VERSION}-linux-x64.tar.gz && \
  mv node-${NODE_VERSION}-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-${NODE_VERSION}-linux-x64.tar.gz

RUN npm install -g pm2

RUN mkdir -p /var/log/node/app/

WORKDIR /var/www/app/

EXPOSE 3000


CMD ["pm2", "start", "app.js", "--no-daemon", "--watch"]
