FROM elasticsearch:5-alpine

MAINTAINER hu zhengquan "huzhengquan@gmail.com"

ADD https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.1.1/elasticsearch-analysis-ik-5.1.1.zip /tmp/elasticsearch-analysis-ik.zip

RUN unzip /tmp/elasticsearch-analysis-ik.zip -d /usr/share/elasticsearch/plugins/ik 

EXPOSE 9200 9300

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]

