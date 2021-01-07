FROM golang:1.15.6-buster

RUN apt-get update && apt-get install -y build-essential unzip

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.11.4/protoc-3.11.4-linux-x86_64.zip
RUN unzip protoc-3.11.4-linux-x86_64.zip -d protoc3 && \
  mv protoc3/bin/* /usr/local/bin/ && \
  mv protoc3/include/* /usr/local/include/ && \
  rm *.zip && \
  rm -rf protoc3

ENV GRPC_GATEWAY_VERSION=v1.14.6
ENV GRPC_VERSION=v1.16.0
ENV PROTOC_GEN_VALIDATE_VERSION=v0.4.1

RUN wget https://github.com/grpc-ecosystem/grpc-gateway/releases/download/${GRPC_GATEWAY_VERSION}/protoc-gen-grpc-gateway-${GRPC_GATEWAY_VERSION}-linux-x86_64 -O /usr/local/bin/protoc-gen-grpc-gateway &&\
  chmod +x /usr/local/bin/protoc-gen-grpc-gateway
RUN wget https://github.com/grpc-ecosystem/grpc-gateway/releases/download/${GRPC_GATEWAY_VERSION}/protoc-gen-swagger-${GRPC_GATEWAY_VERSION}-linux-x86_64 -O /usr/local/bin/protoc-gen-swagger &&\
  chmod +x /usr/local/bin/protoc-gen-swagger
RUN mkdir -p /go/src/github.com/grpc-ecosystem &&\
  cd /go/src/github.com/grpc-ecosystem &&\
  git clone --branch ${GRPC_VERSION} https://github.com/grpc-ecosystem/grpc-gateway.git

RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/gogo/protobuf/proto
RUN go get -u github.com/gogo/protobuf/protoc-gen-gogofaster
RUN go get -u github.com/gogo/protobuf/gogoproto

RUN git clone --branch ${PROTOC_GEN_VALIDATE_VERSION} https://github.com/envoyproxy/protoc-gen-validate.git &&\
  cd protoc-gen-validate &&\
  make build &&\
  mv validate /usr/local/include &&\
  cd .. &&\
  rm -rf protoc-gen-validate

COPY go-gw-protoc /usr/local/bin/
RUN chmod +x /usr/local/bin/go-gw-protoc

WORKDIR /source

ENTRYPOINT [ "go-gw-protoc" ]
