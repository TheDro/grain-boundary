FROM ruby:3.2.8

RUN apt-get update -qq && apt-get install -y nginx supervisor

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2000

CMD ["/usr/bin/supervisord"]