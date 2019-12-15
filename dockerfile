  
FROM golang:1.13.4-alpine as build
# WORKDIR /go/src/github.com/square/ghostunnel

RUN apk add --no-cache --update gcc musl-dev libtool make git
ENV GHOSTUNNEL_VERSION=v1.5.2

RUN go get -v github.com/square/ghostunnel
RUN cd /go/src/github.com/square/ghostunnel && \
    git checkout ${GHOSTUNNEL_VERSION} && \
    GO111MODULE=on make clean ghostunnel


FROM alpine
ENV COLUMNS=200
RUN apk add --no-cache --update libtool curl bash

COPY --from=build /go/src/github.com/square/ghostunnel /go/src/github.com/square/ghostunnel
RUN cp /go/src/github.com/square/ghostunnel/ghostunnel /ghostunnel
EXPOSE 10443
USER 1000

ENTRYPOINT ["/ghostunnel"]