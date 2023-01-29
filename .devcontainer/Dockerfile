FROM ubuntu:22.04

# install prerequisites
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    elixir \
    npm

RUN mix local.hex --force

# RUN mix archive.install hex phx_new --force
# RUN npm install -D tailwindcss
# RUN npx tailwindcss init
# RUN mix phx.new ski_map --no-ecto

CMD ["tail", "-f", "/dev/null"]