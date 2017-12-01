################################## Use Cached ##################################
FROM 618820278434.dkr.ecr.ap-southeast-2.amazonaws.com/phoenix-environment:latest

WORKDIR /app

EXPOSE 4000

CMD ["iex", "-S", "mix", "phoenix.server"]