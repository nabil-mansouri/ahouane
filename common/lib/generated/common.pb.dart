///
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FieldValidator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FieldValidator', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'required')
    ..hasRequiredFields = false
  ;

  FieldValidator._() : super();
  factory FieldValidator({
    $core.bool required,
  }) {
    final _result = create();
    if (required != null) {
      _result.required = required;
    }
    return _result;
  }
  factory FieldValidator.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldValidator.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldValidator clone() => FieldValidator()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldValidator copyWith(void Function(FieldValidator) updates) => super.copyWith((message) => updates(message as FieldValidator)) as FieldValidator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FieldValidator create() => FieldValidator._();
  FieldValidator createEmptyInstance() => create();
  static $pb.PbList<FieldValidator> createRepeated() => $pb.PbList<FieldValidator>();
  @$core.pragma('dart2js:noInline')
  static FieldValidator getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldValidator>(create);
  static FieldValidator _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get required => $_getBF(0);
  @$pb.TagNumber(1)
  set required($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequired() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequired() => clearField(1);
}

class Test extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Test', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Test._() : super();
  factory Test() => create();
  factory Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Test clone() => Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Test copyWith(void Function(Test) updates) => super.copyWith((message) => updates(message as Test)) as Test; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Test create() => Test._();
  Test createEmptyInstance() => create();
  static $pb.PbList<Test> createRepeated() => $pb.PbList<Test>();
  @$core.pragma('dart2js:noInline')
  static Test getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Test>(create);
  static Test _defaultInstance;
}

class Common {
  static final validation = $pb.Extension<FieldValidator>(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'google.protobuf.FieldOptions', const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validation', 10000, $pb.PbFieldType.OM, defaultOrMaker: FieldValidator.getDefault, subBuilder: FieldValidator.create);
  static final disabled = $pb.Extension<$core.bool>(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'google.protobuf.MessageOptions', const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'disabled', 10000, $pb.PbFieldType.OB);
  static final expect = $pb.Extension<$core.bool>(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'google.protobuf.OneofOptions', const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expect', 10000, $pb.PbFieldType.OB);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(validation);
    registry.add(disabled);
    registry.add(expect);
  }
}

