FROM ruby:2.5.1-alpine3.7

RUN apk --update --no-cache --virtual add libpcap-dev make gcc go g++

WORKDIR /root/work

COPY work/Gemfile $WORKDIR
COPY work/Gemfile.lock $WORKDIR

RUN bundle install
