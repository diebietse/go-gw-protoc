FROM golang:1.12-stretch

RUN apt-get update && apt-get install -y build-essential unzip

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.8.0-linux-x86_64.zip
RUN unzip protoc-3.8.0-linux-x86_64.zip -d protoc3 && \
  mv protoc3/bin/* /usr/local/bin/ && \
  mv protoc3/include/* /usr/local/include/ && \
  rm *.zip && \
  rm -rf protoc3

RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/golang/protobuf/protoc-gen-go

WORKDIR /source

ENTRYPOINT [ "protoc", "-I/usr/local/include", "-I/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis"]
