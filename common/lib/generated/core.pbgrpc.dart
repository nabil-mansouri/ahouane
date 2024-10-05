///
//  Generated code. Do not modify.
//  source: core.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'core.pb.dart' as $0;
export 'core.pb.dart';

class MetricServiceClient extends $grpc.Client {
  static final _$push = $grpc.ClientMethod<$0.Metric, $0.MetricResponse>(
      '/MetricService/push',
      ($0.Metric value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MetricResponse.fromBuffer(value));

  MetricServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MetricResponse> push($0.Metric request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$push, request, options: options);
  }
}

abstract class MetricServiceBase extends $grpc.Service {
  $core.String get $name => 'MetricService';

  MetricServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Metric, $0.MetricResponse>(
        'push',
        push_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Metric.fromBuffer(value),
        ($0.MetricResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.MetricResponse> push_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Metric> request) async {
    return push(call, await request);
  }

  $async.Future<$0.MetricResponse> push(
      $grpc.ServiceCall call, $0.Metric request);
}
