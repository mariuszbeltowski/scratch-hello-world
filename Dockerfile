FROM alpine AS builder

RUN apk update
RUN apk add g++

ADD hello.c /

RUN g++ -Os -o hello -static hello.c

## executable
FROM scratch

COPY --from=builder /hello /

ENTRYPOINT ["/hello"]