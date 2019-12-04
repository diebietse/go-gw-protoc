FROM golang:1.13.4-buster

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

COPY go-gw-protoc /usr/local/bin/
RUN chmod +x /usr/local/bin/go-gw-protoc

WORKDIR /source

ENTRYPOINT [ "go-gw-protoc" ]
