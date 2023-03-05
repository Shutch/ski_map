FROM elixir:1.14.3

# Build Args
ENV PHOENIX_VERSION 1.7.0
ENV APP_HOME /app

# install prerequisites
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    git \
    postgresql-client \
    npm \
    yarn \
    inotify-tools

# Phoenix
RUN mix local.hex --force
RUN mix archive.install --force hex phx_new $PHOENIX_VERSION
RUN mix local.rebar --force

# App Directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

# Install Dependencies
RUN mix deps.get
RUN mix deps.compile
RUN mix ecto.create

# App Port
EXPOSE 4000

# Default Command
CMD ["mix", "phx.server"]