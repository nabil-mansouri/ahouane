///
//  Generated code. Do not modify.
//  source: db.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class QueryFilterComparator extends $pb.ProtobufEnum {
  static const QueryFilterComparator eq = QueryFilterComparator._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'eq');
  static const QueryFilterComparator neq = QueryFilterComparator._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'neq');
  static const QueryFilterComparator lt = QueryFilterComparator._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lt');
  static const QueryFilterComparator lte = QueryFilterComparator._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'lte');
  static const QueryFilterComparator gt = QueryFilterComparator._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'gt');
  static const QueryFilterComparator gte = QueryFilterComparator._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'gte');
  static const QueryFilterComparator in_ = QueryFilterComparator._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'in');
  static const QueryFilterComparator nin = QueryFilterComparator._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nin');
  static const QueryFilterComparator contains = QueryFilterComparator._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'contains');
  static const QueryFilterComparator startsWith = QueryFilterComparator._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'startsWith');
  static const QueryFilterComparator endsWith = QueryFilterComparator._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'endsWith');
  static const QueryFilterComparator exists = QueryFilterComparator._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'exists');

  static const $core.List<QueryFilterComparator> values = <QueryFilterComparator> [
    eq,
    neq,
    lt,
    lte,
    gt,
    gte,
    in_,
    nin,
    contains,
    startsWith,
    endsWith,
    exists,
  ];

  static final $core.Map<$core.int, QueryFilterComparator> _byValue = $pb.ProtobufEnum.initByValue(values);
  static QueryFilterComparator valueOf($core.int value) => _byValue[value];

  const QueryFilterComparator._($core.int v, $core.String n) : super(v, n);
}

class QueryFilterLogical_Operator extends $pb.ProtobufEnum {
  static const QueryFilterLogical_Operator not = QueryFilterLogical_Operator._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'not');
  static const QueryFilterLogical_Operator and = QueryFilterLogical_Operator._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'and');
  static const QueryFilterLogical_Operator nand = QueryFilterLogical_Operator._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nand');
  static const QueryFilterLogical_Operator or = QueryFilterLogical_Operator._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'or');
  static const QueryFilterLogical_Operator nor = QueryFilterLogical_Operator._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'nor');

  static const $core.List<QueryFilterLogical_Operator> values = <QueryFilterLogical_Operator> [
    not,
    and,
    nand,
    or,
    nor,
  ];

  static final $core.Map<$core.int, QueryFilterLogical_Operator> _byValue = $pb.ProtobufEnum.initByValue(values);
  static QueryFilterLogical_Operator valueOf($core.int value) => _byValue[value];

  const QueryFilterLogical_Operator._($core.int v, $core.String n) : super(v, n);
}

