FROM ruby:2.4-alpine3.7
MAINTAINER Amir Bilu <amir.bilu@personali.com>
Add . /app

WORKDIR /app

RUN apk add -U alpine-sdk 
RUN bundle

ENTRYPOINT ["bundle", "exec", "bin/rollout-thrift"]
