FROM circleci/ruby:2.2.7
WORKDIR /root/
ADD work work

RUN sudo apt-get update && sudo apt-get upgrade -y
RUN sudo apt-get install -y libpcap-dev

COPY work/Gemfile $WORKDIR
COPY work/Gemfile.lock $WORKDIR

WORKDIR /root/work/
RUN sudo gem update
RUN sudo bundle install
