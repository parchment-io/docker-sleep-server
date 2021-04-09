FROM ruby:2.7.2-slim-buster
ARG BUNDLE_PARCHMENT__JFROG__IO
COPY server.rb /server.rb
COPY Gemfile* /
RUN apt-get update && apt-get install --no-install-recommends -y git ssh curl build-essential && rm -fr /var/lib/apt/lists/* && \
  gem install bundler:2.1.4 && \
  bundle install && \
  apt-get remove -y build-essential && \
  apt-get autoremove -y

ENV APP_ENV=production
ENTRYPOINT ["/server.rb"]
