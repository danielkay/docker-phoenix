FROM elixir:latest
MAINTAINER Daniel Kay <contact@danielkay.co.uk>

RUN mix local.hex --force \
 && mix archive.install --force hex phx_new 1.4.11 \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y build-essential \
 && apt-get install -y inotify-tools \
 && mix local.rebar --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Expose web aoo oort
EXPOSE 4000
# Expose epmd port
EXPOSE 4369
# Exoose elixir node port
EXPOSE 9000

CMD ["elixir", "--erl", "-setcookie COOKIE -kernel inet_dist_listen_min 9000 inet_dist_listen_max 9000 -name phoenix@127.0.0.1", "-S", "/usr/local/bin/mix", "phx.server"]
