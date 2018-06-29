FROM circleci/ruby:2.2.7
WORKDIR /root/
ADD work work

COPY work/Gemfile $WORKDIR

RUN sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y libpcap-dev groff-base python-dev python-pip
RUN sudo pip install awscli

WORKDIR /root/work/
RUN sudo gem update
RUN sudo bundle install
