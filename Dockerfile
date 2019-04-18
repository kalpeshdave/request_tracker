FROM ruby:2.5.0
LABEL author="Kalpesh Dave <kalpesh.dave2005@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /request_tracker
WORKDIR /request_tracker
COPY Gemfile /request_tracker/Gemfile
COPY Gemfile.lock /request_tracker/Gemfile.lock
ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler && bundle install
COPY . /request_tracker
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]