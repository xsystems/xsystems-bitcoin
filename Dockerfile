ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

ARG BITCOIN_VERSION

RUN apk add --no-cache bitcoin=${BITCOIN_VERSION}

RUN mkdir -p /bitcoin/data

COPY bitcoin-template.conf \
     entrypoint.sh \
     /bitcoin/

ENTRYPOINT ["/bitcoin/entrypoint.sh"]
