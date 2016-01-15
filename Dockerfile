# Ruby-base
FROM ubuntu
MAINTAINER Marc Grimme <marc.grimme@googlemail.com>

ENV RUBY_VERSION=2.2.4
RUN apt-get update --fix-missing && \
  apt-get install -y git-core curl && \
  apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev libssl-dev libmysqlclient-dev libsqlite3-dev
WORKDIR /root

ENV PATH="/root/ruby-build/bin:$HOME/local/ruby/bin:$PATH"

RUN git clone git://github.com/sstephenson/ruby-build.git ~/ruby-build && \
    echo 'export PATH="$HOME/ruby-build/bin:$PATH"' >> $HOME/.bashrc && \
    export PATH="$HOME/ruby-build/bin:$PATH" && \
    ruby-build $RUBY_VERSION $HOME/local/ruby && \
    echo 'export PATH="$HOME/local/ruby/bin:$PATH"' >> $HOME/.bashrc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN PATH=$HOME/local/ruby/bin:$PATH gem install bundler
