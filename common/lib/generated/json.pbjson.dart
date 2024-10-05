///
//  Generated code. Do not modify.
//  source: json.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use jsonValueDescriptor instead')
const JsonValue$json = const {
  '1': 'JsonValue',
  '2': const [
    const {'1': 'intValue', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'intValue'},
    const {'1': 'doubleValue', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    const {'1': 'stringValue', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    const {'1': 'boolValue', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    const {'1': 'nullValue', '3': 5, '4': 1, '5': 8, '9': 0, '10': 'nullValue'},
    const {'1': 'object', '3': 6, '4': 1, '5': 11, '6': '.JsonObjectValue', '9': 0, '10': 'object'},
    const {'1': 'array', '3': 7, '4': 1, '5': 11, '6': '.JsonArrayValue', '9': 0, '10': 'array'},
    const {'1': 'custom', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Any', '9': 0, '10': 'custom'},
  ],
  '8': const [
    const {'1': 'json_oneof'},
  ],
};

/// Descriptor for `JsonValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonValueDescriptor = $convert.base64Decode('CglKc29uVmFsdWUSHAoIaW50VmFsdWUYASABKANIAFIIaW50VmFsdWUSIgoLZG91YmxlVmFsdWUYAiABKAFIAFILZG91YmxlVmFsdWUSIgoLc3RyaW5nVmFsdWUYAyABKAlIAFILc3RyaW5nVmFsdWUSHgoJYm9vbFZhbHVlGAQgASgISABSCWJvb2xWYWx1ZRIeCgludWxsVmFsdWUYBSABKAhIAFIJbnVsbFZhbHVlEioKBm9iamVjdBgGIAEoCzIQLkpzb25PYmplY3RWYWx1ZUgAUgZvYmplY3QSJwoFYXJyYXkYByABKAsyDy5Kc29uQXJyYXlWYWx1ZUgAUgVhcnJheRIuCgZjdXN0b20YCCABKAsyFC5nb29nbGUucHJvdG9idWYuQW55SABSBmN1c3RvbUIMCgpqc29uX29uZW9m');
@$core.Deprecated('Use jsonObjectValueDescriptor instead')
const JsonObjectValue$json = const {
  '1': 'JsonObjectValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.JsonObjectValue.ValueEntry', '10': 'value'},
  ],
  '3': const [JsonObjectValue_ValueEntry$json],
};

@$core.Deprecated('Use jsonObjectValueDescriptor instead')
const JsonObjectValue_ValueEntry$json = const {
  '1': 'ValueEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.JsonValue', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `JsonObjectValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonObjectValueDescriptor = $convert.base64Decode('Cg9Kc29uT2JqZWN0VmFsdWUSMQoFdmFsdWUYASADKAsyGy5Kc29uT2JqZWN0VmFsdWUuVmFsdWVFbnRyeVIFdmFsdWUaRAoKVmFsdWVFbnRyeRIQCgNrZXkYASABKAlSA2tleRIgCgV2YWx1ZRgCIAEoCzIKLkpzb25WYWx1ZVIFdmFsdWU6AjgB');
@$core.Deprecated('Use jsonArrayValueDescriptor instead')
const JsonArrayValue$json = const {
  '1': 'JsonArrayValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.JsonValue', '10': 'value'},
  ],
};

/// Descriptor for `JsonArrayValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jsonArrayValueDescriptor = $convert.base64Decode('Cg5Kc29uQXJyYXlWYWx1ZRIgCgV2YWx1ZRgBIAMoCzIKLkpzb25WYWx1ZVIFdmFsdWU=');
