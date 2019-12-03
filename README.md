# go-gw-protoc

A docker container to compile [Protocol Buffers][protobufs] with [protoc-gen-grpc-gateway][grpc-gateway]

[![](https://images.microbadger.com/badges/image/diebietse/go-gw-protoc.svg)](https://microbadger.com/images/diebietse/go-gw-protoc "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/diebietse/go-gw-protoc.svg)][docker-hub]
[![Docker Stars](https://img.shields.io/docker/stars/diebietse/go-gw-protoc.svg)][docker-hub]
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/diebietse/go-gw-protoc.svg)][docker-hub]
[![Docker Cloud Automated Build](https://img.shields.io/docker/cloud/automated/diebietse/go-gw-protoc.svg)][docker-hub]
![GitHub License](https://img.shields.io/github/license/diebietse/go-gw-protoc.svg)

The Docker image is available on [Docker Hub][docker-hub]

It is based on [golang:1.13-buster][golang] and adds all the packages needed for using `protoc` to compile your Protocol Buffers for [gRPC][grpc] and [grpc-gateway][grpc-gateway]

You can generate the gRPC and gRPC-gateway go source with:

```bash
docker run -v ${PWD}:/source diebietse/go-gw-protoc -I. --go_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-world.proto
```

To test it go to the [example folder][example], run `build.sh` and it will create `hello-world.pb.go` and `hello-world.pb.gw.go`

[protobufs]: https://github.com/protocolbuffers/protobuf
[grpc-gateway]: https://github.com/grpc-ecosystem/grpc-gateway
[docker-hub]: https://hub.docker.com/r/diebietse/go-gw-protoc
[golang]: https://github.com/docker-library/golang/blob/f30f0428221b94c7dcb414ebdcea83106df20897/1.13/buster/Dockerfile
[grpc]: https://github.com/grpc
[example]: ./example
