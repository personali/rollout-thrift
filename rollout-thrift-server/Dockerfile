FROM ruby:alpine3.4

MAINTAINER Amir Bilu <amir.bilu@personali.com>

COPY . /app

RUN apk add -U build-base 

WORKDIR /app

RUN bundle 

ENTRYPOINT bundle exec bin/rollout-thrift --port=$PORT --redis-url=$REDIS_URL

EXPOSE 9090
