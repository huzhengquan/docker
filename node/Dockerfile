FROM alpine:3.3

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

ENV NODE_VERSION v5.4.1
ENV PATH /opt/node/bin:$PATH

RUN apk add --update --no-progress libgcc libstdc++ make gcc g++ python linux-headers paxctl binutils-gold && \
  mkdir -p /opt/src && \
  wget -O - https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xzC /opt/src && \
  cd /opt/src/node-${NODE_VERSION} && \
  ./configure --prefix=/opt/node && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /opt/node/bin/node && \
  apk del make gcc g++ python libgcc linux-headers paxctl binutils-gold && \
  npm install -g pm2 && \
  cd /opt && \
  rm -rf \
    /opt/src \
    /etc/ssl \
    /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /opt/node/lib/node_modules/npm/man \
    /opt/node/lib/node_modules/npm/doc \
    /opt/node/lib/node_modules/npm/html 


WORKDIR /app

EXPOSE 3000

CMD ["pm2", "start", "app.js", "--no-daemon", "--watch"]
