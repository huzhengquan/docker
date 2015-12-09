FROM ubuntu:14.04

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

#COPY sources.list /etc/apt/sources.list

RUN apt-get update && \
	apt-get install -y supervisor curl wget openjdk-7-jre racket && \
	apt-get clean 

#python-virtualenv 

ENV NODE_VERSION v5.1.1
RUN cd /opt && \
  wget http://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz && \
  tar -xzf node-${NODE_VERSION}-linux-x64.tar.gz && \
  mv node-${NODE_VERSION}-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-${NODE_VERSION}-linux-x64.tar.gz

RUN mkdir -p /data/daemonize

#WORKDIR /data/daemonize

EXPOSE 8000

CMD ["supervisord", "--nodaemon", "-c", "/data/daemonize/supervisord.conf"] 
