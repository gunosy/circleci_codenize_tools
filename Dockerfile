FROM ruby:2.5.1-alpine3.7

RUN apk --update --no-cache --virtual add libpcap-dev make gcc g++

COPY work/Gemfile /root
COPY work/Gemfile.lock /root

WORKDIR /root

RUN bundle install
