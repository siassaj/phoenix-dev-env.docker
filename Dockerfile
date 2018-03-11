################################## Use Cached ##################################
FROM siassaj/phoenix-env:latest

RUN git clone https://github.com/ferd/erlang-history && \
    cd erlang-history && \
    make install && \
    cd .. && \
    apt-get install -y inotify-tools && \
    apt-get -y purge

RUN git clone https://github.com/jeremyjh/dialyxir && \
    cd dialyxir && \
    mix deps.get && \
    mix archive.build && \
    mix archive.install --force && \
    mix dialyzer && \
    cd .. && \
    rm -rf dialyxir

WORKDIR /app

EXPOSE 4000

CMD ["iex", "-S", "mix", "phoenix.server"]
