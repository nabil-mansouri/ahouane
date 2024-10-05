///
//  Generated code. Do not modify.
//  source: microservice.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class InterceptorType extends $pb.ProtobufEnum {
  static const InterceptorType Empty = InterceptorType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Empty');
  static const InterceptorType Before = InterceptorType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Before');
  static const InterceptorType After = InterceptorType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'After');
  static const InterceptorType Error = InterceptorType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Error');

  static const $core.List<InterceptorType> values = <InterceptorType> [
    Empty,
    Before,
    After,
    Error,
  ];

  static final $core.Map<$core.int, InterceptorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InterceptorType valueOf($core.int value) => _byValue[value];

  const InterceptorType._($core.int v, $core.String n) : super(v, n);
}

