///
//  Generated code. Do not modify.
//  source: email.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'email.pb.dart' as $1;
export 'email.pb.dart';

abstract class EmailServiceAsync extends $grpc.Service {
  $core.String get $name => 'EmailService';
  $core.bool get $isAsync => true;

  EmailServiceAsync() {
    $addMethod($grpc.ServiceMethod<$1.EmailPayload, $1.EmailStatus>(
        'sendMail',
        sendMail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EmailPayload.fromBuffer(value),
        ($1.EmailStatus value) => value.writeToBuffer()));
  }

  $async.Future<$1.EmailStatus> sendMail_Pre(
      $grpc.ServiceCall call, $async.Future<$1.EmailPayload> request) async {
    return sendMail(await request);
  }

  $async.Future<$1.EmailStatus> sendMail($1.EmailPayload request);
}
