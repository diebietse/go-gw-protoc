#!/bin/bash
docker run -v ${PWD}:/source diebietse/go-gw-protoc:latest -I. --gogofaster_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. hello-worldgogo.proto
