#!/bin/bash
docker run -v ${PWD}:/source diebietse/go-gw-protoc -I. --go_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-world.proto
