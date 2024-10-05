part of 'microservice.dart';

class RemoteLogWritter extends LogWritter {
  RemoteLogWritter();
  @override
  void write(LogMessage event) {
    //TODO grpc
  }

  @override
  void push(event) {
    // TODO: grpc
  }
}
