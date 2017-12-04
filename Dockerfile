################################## Use Cached ##################################
FROM 618820278434.dkr.ecr.ap-southeast-2.amazonaws.com/phoenix-environment:latest

RUN git clone https://github.com/ferd/erlang-history && \
    cd erlang-history && \
    make install && \
    cd .. && \
    rm -rf erlang-history && \
    apt-get install -y inotify-tools && \
    apt-get -y purge &&\

WORKDIR /app

EXPOSE 4000

CMD ["iex", "-S", "mix", "phoenix.server"]