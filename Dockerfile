FROM debian
MAINTAINER jipe bar <jipebar@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'deb http://debian.yacy.net ./' >> /etc/apt/sources.list.d/yacy.list
RUN gpg --keyserver pgpkeys.mit.edu --recv-key 1F968B3903D886E7
RUN gpg -a --export 1F968B3903D886E7 | apt-key add -
RUN apt-get update
#RUN apt-get upgrade -yq

# Install yacy.
RUN apt-get install -yq yacy
RUN apt-get install -yq procps

RUN echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

EXPOSE 8090
CMD service yacy start && tail -F /var/log/yacy/yacy00.log
