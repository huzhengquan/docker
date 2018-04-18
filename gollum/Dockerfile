FROM ruby:2.5.1-alpine

MAINTAINER huzhengquan "huzhengquan@gmail.com"

ENV TZ "Asia/Shanghai"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

RUN apk update && \
  apk add --no-cache --update --no-progress icu-dev cmake g++ make icu-libs && \
  gem install github-linguist && \
  gem install gollum && \
  apk del cmake g++ make icu-dev && \
  rm -rf /tmp/* /var/cache/apk/* 

WORKDIR /wiki

EXPOSE 3000

ENTRYPOINT ["gollum", "--port", "3000"]