///
//  Generated code. Do not modify.
//  source: logger.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'logger.pb.dart' as $0;
export 'logger.pb.dart';

abstract class LogServiceSync extends $grpc.Service {
  $core.String get $name => 'LogService';
  $core.bool get $isAsync => false;

  LogServiceSync() {
    $addMethod($grpc.ServiceMethod<$0.LogMessage, $0.LogResponse>(
        'log',
        log_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogMessage.fromBuffer(value),
        ($0.LogResponse value) => value.writeToBuffer()));
  }

  $0.LogResponse log_Pre($grpc.ServiceCall call, $0.LogMessage request) {
    return log(request);
  }

  $0.LogResponse log($0.LogMessage request);
}
