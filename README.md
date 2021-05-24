# xSystems - Bitcoin

> Bitcoin image


## Run

All available environment variables are:

| Environment Variable | Example Value         | Required | Description                                                                                                   |
| :------------------- | :-------------------- | :------: | :------------------------------------------------------------------------------------------------------------ |
| ZMQ_PUB_ADDRESSES    | tcp://blockbook:38330 |          | Addresses of services listening for the [ZMQ][bitcoind-zmq] notifications `zmqpubhashtx` and `zmqpubhashblock` |

Expose ports `8030` and `38330` to, respectively, make [RPC][bitcoind-rpc] and [ZMQ][bitcoind-zmq] available outside the Docker network.  
Persist the directory `/bitcoin/data` to preserve the state.


### Docker CLI example

```sh
docker run --rm --interactive --tty --publish 8030:8030 --publish 38330:38330 --volume bitcoin-data:/bitcoin/data --env ZMQ_PUB_ADDRESSES="tcp://blockbook:38330" xsystems/bitcoin:0.20.1-r1_alpine3.13
```


## Build the Image

Optionally change the variable `DOCKER_TAG` in [build.sh](build.sh) and run that script to build an image of the Bitcoin and Alpine versions indicated by `DOCKER_TAG`.
The syntax of `DOCKER_TAG` is the same as the syntax of `VERSION` described below.


## Release the Image

1. Set the `VERSION` environment variable to the version that needs to be released. With syntax `"BITCOIN_VERSION" + "_alpine" + "ALPINE_VERSION"`.
2. Optionally, set the `COMMIT` environment variable to the hash of the Git commit that needs to be released. It defaults to the latest commit.
3. Run [release.sh](release.sh).

Example release statement:

```sh
VERSION=0.20.1-r1_alpine3.13 ./release.sh
```

[bitcoind-rpc]: https://github.com/bitcoin/bitcoin/blob/master/doc/JSON-RPC-interface.md "bitcoind RPC"
[bitcoind-zmq]: https://github.com/bitcoin/bitcoin/blob/master/doc/zmq.md "bitcoind ZMQ"
