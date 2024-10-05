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

abstract class MetricServiceSync extends $grpc.Service {
  $core.String get $name => 'MetricService';
  $core.bool get $isAsync => false;

  MetricServiceSync() {
    $addMethod($grpc.ServiceMethod<$0.Metric, $0.MetricResponse>(
        'push',
        push_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Metric.fromBuffer(value),
        ($0.MetricResponse value) => value.writeToBuffer()));
  }

  $0.MetricResponse push_Pre($grpc.ServiceCall call, $0.Metric request) {
    return push(request);
  }

  $0.MetricResponse push($0.Metric request);
}
