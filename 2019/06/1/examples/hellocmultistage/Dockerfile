FROM ubuntu:16.04 AS compiler
RUN apt-get update
RUN apt-get install -y build-essential
COPY hello.c /
RUN make hello

FROM ubuntu:16.04
COPY --from=compiler /hello /hello
CMD /hello