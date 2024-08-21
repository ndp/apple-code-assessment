FROM ruby:3.1.2-alpine

RUN apk add --update --virtual runtime-dependencies \
  build-base \
  git \
  sqlite-dev \
  gcompat \
  tzdata \
  nodejs \
  yarn \
  && rm -rf /var/cache/apk/*

EXPOSE 3000

WORKDIR /app

RUN gem install rails bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN rails webpacker:install

RUN rake db:migrate

RUN echo ''
RUN echo 'NOTE:'
RUN echo 'Use `rails s -b 0.0.0.0` to run the application'
