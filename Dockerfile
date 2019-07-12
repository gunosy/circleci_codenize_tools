FROM gunosy/codenize-notify:latest AS notifier
FROM ruby:2.3.8-alpine3.7

RUN apk --update --no-cache --virtual add bash git openssh-client libpcap-dev make gcc g++
RUN mkdir -p ~/.ssh && echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config

COPY --from=notifier /go/dist/linux_amd64/codenize-notify /usr/local/bin/

COPY work/Gemfile /root
COPY work/Gemfile.lock /root

WORKDIR /root

RUN bundle install
