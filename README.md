# Description

Software As A Service backend with low memory print written in dart. 

The backend has following services:
- Authentication service
- Authorization service
- DB Service (key value storage)
- An Email Service (with i18n integration)
- A File Storage Service


The backend has a plugin extension that enabled to deploy microservice compiled into native binary.

The backend is fully configurable and compile to native.

The backend use Grpc and HTTP transport.

# Modules

The project is composed by 5 modules:
- client: an sdk written in dart (can be compiled to JS)
- common: a shared modules used by others
- microservice: an abstract microservice that can be called using binary from the backend behind http/grpc
- protobuf: overwrite the original protobuf plugin to include new annotation
- protos: protobuf contracts used by other modules
- server: the backend that can be compiled as exe