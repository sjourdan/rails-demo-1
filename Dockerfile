FROM ruby:2.3
MAINTAINER SquareScale Engineering <engineering@squarescale.com>
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -qy nodejs && \
  apt-get -y clean && \
  apt-get -y autoclean && \
  apt-get -y autoremove && \
  rm -rf /var/lib/apt/* && \
  rm -rf /var/lib/cache/* && \
  rm -rf /var/lib/log/* && \
  rm -rf /tmp/*
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
