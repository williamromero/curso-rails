FROM ruby:2.7.6-alpine
RUN apk update 
RUN apk add nodejs yarn

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
# RUN apk update && \
# RUN apk add --no-cache --virtual .build-deps \
#     build-base \
#     ca-certificates \
#     curl \
#     git \
#     openssh \
#     openssl \
#     gem install bundler --no-document && \
#     tzdata git make \
#     build-base bash openssh \
#     mysql \
#     mysql-client \
#     mysql-dev  \
#     imagemagick\
#     bundle install --jobs=4 --retry=3 --deployment --without development test\


RUN apk update && apk add --update --no-cache --virtual build-dependency build-base ruby-dev mysql-dev postgresql-dev git sqlite-dev imagemagick-dev curl git openssh openssl tzdata git make bash openssh

#   apk add --no-cache \
RUN gem install bundler:2.1.4
RUN apk add --no-cache build-base

RUN gem install mysql2
RUN gem install ffi
RUN gem install nokogiri
# RUN bundle config disable_exec_load true
RUN bundle install

ENV RAILS_ROOT ./curso-rails
COPY . /curso-rails
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ENV RAILS_ENV='production'
ENV RACK_ENV='production'
ENV PORT 3000
# ENTRYPOINT ./entrypoint.sh
ENV SECRET_KEY_BASE=f9e612c0c13733da9cd8d3b5a90e4410b039526ae8f407734070aa99e15c9cd3d87380622c502f85883468ff18ee1ed72f6482b70022b220e08d8572b0e68c0e

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

COPY . .
# RUN bundle exec rake assets:precompile
# CMD ["bundle", "exec", "binstub", "rails"] 
# ARG ASSET_HOST
RUN RAILS_ENV=production bin/rails assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
