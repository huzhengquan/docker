FROM huzhengquan/java:8

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

ENV ESDIR /opt/elasticsearch-2.1.0
ENV IK_VERSION 1.6.1
ENV IKDIR /opt/elasticsearch-analysis-ik-${IK_VERSION}

RUN apk add --update curl && \
  curl -sSL https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/elasticsearch-2.1.0.tar.gz | tar -xzC /opt && \
  curl -sSL https://github.com/medcl/elasticsearch-analysis-ik/archive/v${IK_VERSION}.tar.gz | tar -xzC /opt && \
  cd /opt/elasticsearch-analysis-ik-${IK_VERSION} && \
  mvn package && \
  apk del curl && \
  mkdir -p ${ESDIR}/plugins/ik && \
  cp ${IKDIR}/target/releases/elasticsearch-analysis-ik-${IK_VERSION}.zip ${ESDIR}/plugins/ik/ && \
  cd ${ESDIR}/plugins/ik && unzip elasticsearch-analysis-ik-${IK_VERSION}.zip && rm -rf elasticsearch-analysis-ik-${IK_VERSION}.zip && \
  cd /opt && \
  cp -r ${IKDIR}/config/ik ${ESDIR}/config/ && \
  rm -rf ${IKDIR} /tmp/* /var/cache/apk/* 
#cp -r ${IKDIR}/config/elasticsearch.yml ${ESDIR}/config/ && \

ENV PATH ${PATH}:${ESDIR}/bin

RUN useradd noroot -u 1000 -s /bin/ash
USER noroot

EXPOSE 9200/tcp 9300/udp

CMD elasticsearch
