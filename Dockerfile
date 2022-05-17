FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /portfolio
WORKDIR /portfolio
ADD Gemfile /portfolio/Gemfile
ADD Gemfile.lock /portfolio/Gemfile.lock
RUN bundle install
ADD . /portfolio