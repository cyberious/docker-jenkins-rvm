FROM jenkins
MAINTAINER Travis Fields

USER root
RUN apt-get update \
  && apt-get install -y curl git build-essential libmysqlclient-dev libxml2-dev sudo \
  gawk libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf \
  libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && \curl -sSL https://get.rvm.io | bash -s -- --autolibs=read-fail --ruby=1.9.3 --ruby=2.0.0 --gems=bundler
RUN adduser jenkins rvm

USER jenkins
RUN cd ~/ \
    rvm user gemsets \
    rvm requirements
