FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y node.js postgresql-client

RUN mkdir -p /app
COPY . /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install 

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]