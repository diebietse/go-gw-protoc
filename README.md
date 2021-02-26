# go-gw-protoc

A docker container to compile [Protocol Buffers][protobufs] with [protoc-gen-grpc-gateway][grpc-gateway]

[![release][release-badge]][release-link]
[![publish-docker-image][publish-docker-badge]][publish-docker-link]
![license][license-link]

The Docker image is available on [Docker Hub][docker-hub]

It is based on [golang:1.13-buster][golang] and adds all the packages needed for using `protoc` to compile your Protocol Buffers for [gRPC][grpc] and [grpc-gateway][grpc-gateway]

You can generate the gRPC and gRPC-gateway go source with:

```bash
docker run --rm -v ${PWD}:/source diebietse/go-gw-protoc -I. --go_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-world.proto
```

To test it go to the [example folder][example], run `build.sh` and it will create `hello-world.pb.go` and `hello-world.pb.gw.go`

To use gogofaster for source code generation use

```bash
docker run --rm -v ${PWD}:/source diebietse/go-gw-protoc -I. --gogofaster_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-world.proto
```

Gogofaster can also be used to generate marshallers and unmarshallers as well as a host of other options. For an example of that run

```bash
docker run --rm -v ${PWD}:/source diebietse/go-gw-protoc -I. --gogofaster_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-worldgogo.proto
```

``` bash
docker run --rm -v ${PWD}:/source diebietse/go-gw-protoc:latest \
-I./ \
-I/usr/local/include \
--go_out=paths=source_relative,plugins=grpc:./ \
--validate_out="lang=go:./" \
hello-world-validate.proto
```

See [https://github.com/gogo/protobuf](https://github.com/gogo/protobuf) for more information.

[protobufs]: https://github.com/protocolbuffers/protobuf
[grpc-gateway]: https://github.com/grpc-ecosystem/grpc-gateway
[golang]: https://github.com/docker-library/golang/blob/f30f0428221b94c7dcb414ebdcea83106df20897/1.13/buster/Dockerfile
[grpc]: https://github.com/grpc
[example]: ./example
[publish-docker-badge]: https://github.com/diebietse/go-gw-protoc/actions/workflows/docker-build.yml/badge.svg
[publish-docker-link]: https://github.com/diebietse/go-gw-protoc/actions/workflows/docker-build.yml
[license-link]: https://img.shields.io/github/license/diebietse/go-gw-protoc.svg
[release-badge]: https://img.shields.io/github/v/release/diebietse/go-gw-protoc
[release-link]: https://github.com/diebietse/go-gw-protoc/releases
