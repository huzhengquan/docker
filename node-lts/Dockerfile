FROM alpine:3.4

MAINTAINER zhengquan.hu "zhengquan.hu@qq.com"

ENV PATH /opt/node/bin:$PATH
ENV NODE_VERSION v4.6.0

RUN apk add --update --no-progress libgcc libstdc++ make gcc g++ python linux-headers paxctl binutils-gold && \
  mkdir -p /opt/src && \
  wget -O - http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xzC /opt/src && \
  cd /opt/src/node-${NODE_VERSION} && \
  ./configure --prefix=/opt/node && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /opt/node/bin/node && \
  apk del make gcc g++ python libgcc linux-headers paxctl binutils-gold && \
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

CMD ["node", "app.js"]
