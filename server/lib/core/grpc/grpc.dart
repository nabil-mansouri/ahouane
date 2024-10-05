import 'dart:async';
import 'package:ahouane_client/storage.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:grpc/src/client/channel.dart' as grpcchannel;
import 'package:grpc/src/client/connection.dart' as grpcconnection;
import 'package:ahouane_common/generated/google/protobuf/timestamp.pb.dart';
import 'package:rxdart/subjects.dart';
import 'message_ext.dart';
import 'call_options.dart';
export 'message_ext.dart';
export 'call_options.dart' show CallOptionsDefault;
export 'package:ahouane_common/generated/microservice.pb.dart';
part 'interceptor.dart';
part 'service.dart';
part 'channel.dart';

class GrpcModule extends ServerModule {
  GrpcModule(ServerApplication application) : super(application);

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    for (final tenant in tenants) {
      await application
          .channel()
          .defaultChannel(tenant)
          .register('*', NotFoundGrpcChannelInterceptor());
    }
  }
}

mixin GrpcServiceProxy implements GrpcService {
  GrpcService get original;
  @override
  void $addMethod(ServiceMethod method) => original.$addMethod(method);
  @override
  ServiceMethod $lookupMethod(String method) => original.$lookupMethod(method);
  @override
  String get $name => original.$name;
  @override
  void $onMetadata(ServiceCall context) => original.$onMetadata(context);
  @override
  List<String> get allMethods => original.allMethods;
}

abstract class GrpcInterceptor {
  Future<void> onStart() async {}
  Future<void> onStop() async {}
  Stream<T> onRequest<T extends GeneratedMessage>(
      ServiceMethod method, ServiceCall call, Stream<T> stream) {
    return stream;
  }

  Stream<T> onResponse<T extends GeneratedMessage>(
      ServiceMethod method, ServiceCall call, Stream<T> stream) {
    return stream;
  }
}
