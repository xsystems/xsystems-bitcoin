#!/bin/sh

if [ -z "${ZMQ_PUB_ADDRESSES}" ] ; then
    echo "The variable ZMQ_PUB_ADDRESS is NOT set, BUT is required"
    exit 1
fi

cp /bitcoin/bitcoin-template.conf /bitcoin/bitcoin.conf

for ZMQ_PUB_ADDRESS in "${ZMQ_PUB_ADDRESSES}" ; do
    echo >> /bitcoin/bitcoin.conf
    echo "zmqpubhashtx=${ZMQ_PUB_ADDRESS}" >> /bitcoin/bitcoin.conf
    echo "zmqpubhashblock=${ZMQ_PUB_ADDRESS}" >> /bitcoin/bitcoin.conf
done

exec bitcoind -conf=/bitcoin/bitcoin.conf "$@"
