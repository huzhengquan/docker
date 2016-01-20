FROM huzhengquan/java:8

MAINTAINER hu zhengquan "zhengquan.hu@qq.com"

ENV ESDIR /opt/elasticsearch-2.1.1
ENV IKDIR /opt/elasticsearch-analysis-ik-1.7.0

RUN mkdir /opt && \
  wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.1/elasticsearch-2.1.1.tar.gz | tar -xzC /opt && \
  wget https://github.com/medcl/elasticsearch-analysis-ik/archive/v1.7.0.tar.gz | tar -xzC /opt && \
  cd ${IKDIR} && \
  mvn package && \
  cd /opt && \
  cp ${IKDIR}/target/releases/elasticsearch-analysis-ik-*-jar-with-dependencies.jar ${ESDIR}/lib/ && \
  cp -r ${IKDIR}/config/elasticsearch.yml ${ESDIR}/config/ && \
  cp -r ${IKDIR}/config/ik ${ESDIR}/config/

EXPOSE 9200/tcp 9300/udp

CMD ${ESDIR}/bin/elasticsearch
