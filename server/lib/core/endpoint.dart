part of 'core.dart';

abstract class EndpointException implements Exception {
  bool get shouldStopRouting => true;
  bool get shouldCallErrorInterceptors => true;
  bool get shouldCallAfterInterceptors => true;
  bool get shouldCallTerminateCallback => true;
}

class RerouteChannelException implements EndpointException {
  final dynamic error;
  @override
  final bool shouldCallErrorInterceptors;
  @override
  final bool shouldCallAfterInterceptors;
  @override
  final bool shouldCallTerminateCallback;
  final String destination;
  RerouteChannelException(
    this.destination, {
    this.error,
    this.shouldCallErrorInterceptors = false,
    this.shouldCallAfterInterceptors = false,
    this.shouldCallTerminateCallback = false,
  });
  bool get hasError => error != null;
  @override
  bool get shouldStopRouting => true;
}

class SkipChannelException extends EndpointException {
  final dynamic original;
  SkipChannelException({
    this.original,
  });
  bool get hasError => original != null;
  @override
  bool get shouldStopRouting => false;
}

class StopChannelException extends EndpointException {
  final dynamic original;
  StopChannelException({
    this.original,
  });
  bool get hasError => original != null;
  @override
  bool get shouldStopRouting => true;
}

class EndpointType {
  final String name;
  final String routeSeparator;
  const EndpointType(this.name, [this.routeSeparator = '/']);
}

class EndpointTypes {
  const EndpointTypes();
  EndpointType service() => EndpointType('service');
  EndpointType interceptor() => EndpointType('interceptor');
}

const kEndpointTypes = EndpointTypes();

abstract class Endpoint
    with ServerApplicationAware
    implements Comparable<Endpoint> {
  final String id;
  final EndpointType type;
  int _priority;
  Endpoint(this.type, {String id, int priority})
      : id = id ??= Uuid().v4(),
        _priority = priority;
  int get priority => _priority ?? 0;
  String get name => runtimeType.toString();
  set priority(int priority) {
    _priority ??= priority;
  }

  @override
  int compareTo(Endpoint other) {
    return priority.compareTo(other.priority);
  }

  Future<void> onReceive(RouteContext context);
  bool accept(RouteContext context) => true;
  Future<void> start() async {}
  Future<void> stop() async {}
}
