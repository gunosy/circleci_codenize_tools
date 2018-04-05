FROM ruby:2.5.0-alpine

RUN apk --update --no-cache --virtual add libpcap-dev make gcc g++

WORKDIR /root/work

COPY work/Gemfile $WORKDIR
COPY work/Gemfile.lock $WORKDIR

RUN bundle install
