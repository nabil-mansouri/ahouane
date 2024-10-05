///
//  Generated code. Do not modify.
//  source: logger.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use logMessageDescriptor instead')
const LogMessage$json = const {
  '1': 'LogMessage',
  '2': const [
    const {'1': 'level', '3': 1, '4': 2, '5': 14, '6': '.LogMessage.Level', '10': 'level'},
    const {'1': 'when', '3': 2, '4': 2, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'when'},
    const {'1': 'who', '3': 3, '4': 1, '5': 9, '10': 'who'},
    const {'1': 'where', '3': 4, '4': 1, '5': 9, '10': 'where'},
    const {'1': 'what', '3': 5, '4': 1, '5': 9, '10': 'what'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'serviceid', '3': 7, '4': 1, '5': 9, '10': 'serviceid'},
    const {'1': 'stacktrace', '3': 8, '4': 1, '5': 9, '10': 'stacktrace'},
    const {'1': 'error', '3': 9, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'details', '3': 10, '4': 1, '5': 9, '10': 'details'},
  ],
  '4': const [LogMessage_Level$json],
};

@$core.Deprecated('Use logMessageDescriptor instead')
const LogMessage_Level$json = const {
  '1': 'Level',
  '2': const [
    const {'1': 'Verbose', '2': 0},
    const {'1': 'Debug', '2': 1},
    const {'1': 'Info', '2': 2},
    const {'1': 'Warn', '2': 3},
    const {'1': 'Error', '2': 4},
  ],
};

/// Descriptor for `LogMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logMessageDescriptor = $convert.base64Decode('CgpMb2dNZXNzYWdlEicKBWxldmVsGAEgAigOMhEuTG9nTWVzc2FnZS5MZXZlbFIFbGV2ZWwSLgoEd2hlbhgCIAIoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBHdoZW4SEAoDd2hvGAMgASgJUgN3aG8SFAoFd2hlcmUYBCABKAlSBXdoZXJlEhIKBHdoYXQYBSABKAlSBHdoYXQSIAoLZGVzY3JpcHRpb24YBiABKAlSC2Rlc2NyaXB0aW9uEhwKCXNlcnZpY2VpZBgHIAEoCVIJc2VydmljZWlkEh4KCnN0YWNrdHJhY2UYCCABKAlSCnN0YWNrdHJhY2USFAoFZXJyb3IYCSABKAlSBWVycm9yEhgKB2RldGFpbHMYCiABKAlSB2RldGFpbHMiPgoFTGV2ZWwSCwoHVmVyYm9zZRAAEgkKBURlYnVnEAESCAoESW5mbxACEggKBFdhcm4QAxIJCgVFcnJvchAE');
@$core.Deprecated('Use aHLogMessageDescriptor instead')
const AHLogMessage$json = const {
  '1': 'AHLogMessage',
  '2': const [
    const {'1': 'level', '3': 1, '4': 2, '5': 14, '6': '.LogMessage.Level', '10': 'level'},
    const {'1': 'when', '3': 2, '4': 2, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'when'},
    const {'1': 'id', '3': 3, '4': 2, '5': 9, '10': 'id'},
    const {'1': 'variables', '3': 4, '4': 3, '5': 11, '6': '.AHLogMessage.VariablesEntry', '10': 'variables'},
    const {'1': 'stacktrace', '3': 5, '4': 1, '5': 9, '10': 'stacktrace'},
    const {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
  ],
  '3': const [AHLogMessage_VariablesEntry$json],
};

@$core.Deprecated('Use aHLogMessageDescriptor instead')
const AHLogMessage_VariablesEntry$json = const {
  '1': 'VariablesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AHLogMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aHLogMessageDescriptor = $convert.base64Decode('CgxBSExvZ01lc3NhZ2USJwoFbGV2ZWwYASACKA4yES5Mb2dNZXNzYWdlLkxldmVsUgVsZXZlbBIuCgR3aGVuGAIgAigLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEd2hlbhIOCgJpZBgDIAIoCVICaWQSOgoJdmFyaWFibGVzGAQgAygLMhwuQUhMb2dNZXNzYWdlLlZhcmlhYmxlc0VudHJ5Ugl2YXJpYWJsZXMSHgoKc3RhY2t0cmFjZRgFIAEoCVIKc3RhY2t0cmFjZRIUCgVlcnJvchgGIAEoCVIFZXJyb3IaPAoOVmFyaWFibGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use consoleLogWritterConfigDescriptor instead')
const ConsoleLogWritterConfig$json = const {
  '1': 'ConsoleLogWritterConfig',
  '2': const [
    const {'1': 'isDefault', '3': 1, '4': 1, '5': 8, '7': 'false', '10': 'isDefault'},
    const {'1': 'minLevel', '3': 2, '4': 1, '5': 14, '6': '.LogMessage.Level', '7': 'Debug', '10': 'minLevel'},
    const {'1': 'methodCount', '3': 3, '4': 1, '5': 5, '7': '1', '10': 'methodCount'},
    const {'1': 'errorMethodCount', '3': 4, '4': 1, '5': 5, '7': '8', '10': 'errorMethodCount'},
    const {'1': 'lineLength', '3': 5, '4': 1, '5': 5, '7': '120', '10': 'lineLength'},
    const {'1': 'colors', '3': 6, '4': 1, '5': 8, '7': 'true', '10': 'colors'},
    const {'1': 'printEmojis', '3': 7, '4': 1, '5': 8, '7': 'true', '10': 'printEmojis'},
    const {'1': 'printTime', '3': 8, '4': 1, '5': 8, '7': 'true', '10': 'printTime'},
    const {'1': 'prettyError', '3': 9, '4': 1, '5': 8, '7': 'true', '10': 'prettyError'},
    const {'1': 'prettyWarn', '3': 10, '4': 1, '5': 8, '7': 'true', '10': 'prettyWarn'},
  ],
};

/// Descriptor for `ConsoleLogWritterConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consoleLogWritterConfigDescriptor = $convert.base64Decode('ChdDb25zb2xlTG9nV3JpdHRlckNvbmZpZxIjCglpc0RlZmF1bHQYASABKAg6BWZhbHNlUglpc0RlZmF1bHQSNAoIbWluTGV2ZWwYAiABKA4yES5Mb2dNZXNzYWdlLkxldmVsOgVEZWJ1Z1IIbWluTGV2ZWwSIwoLbWV0aG9kQ291bnQYAyABKAU6ATFSC21ldGhvZENvdW50Ei0KEGVycm9yTWV0aG9kQ291bnQYBCABKAU6AThSEGVycm9yTWV0aG9kQ291bnQSIwoKbGluZUxlbmd0aBgFIAEoBToDMTIwUgpsaW5lTGVuZ3RoEhwKBmNvbG9ycxgGIAEoCDoEdHJ1ZVIGY29sb3JzEiYKC3ByaW50RW1vamlzGAcgASgIOgR0cnVlUgtwcmludEVtb2ppcxIiCglwcmludFRpbWUYCCABKAg6BHRydWVSCXByaW50VGltZRImCgtwcmV0dHlFcnJvchgJIAEoCDoEdHJ1ZVILcHJldHR5RXJyb3ISJAoKcHJldHR5V2FybhgKIAEoCDoEdHJ1ZVIKcHJldHR5V2Fybg==');
@$core.Deprecated('Use aHLogFilterDescriptor instead')
const AHLogFilter$json = const {
  '1': 'AHLogFilter',
  '2': const [
    const {'1': 'minLevel', '3': 1, '4': 1, '5': 14, '6': '.LogMessage.Level', '7': 'Debug', '10': 'minLevel'},
    const {'1': 'contains', '3': 2, '4': 3, '5': 9, '10': 'contains'},
  ],
};

/// Descriptor for `AHLogFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aHLogFilterDescriptor = $convert.base64Decode('CgtBSExvZ0ZpbHRlchI0CghtaW5MZXZlbBgBIAEoDjIRLkxvZ01lc3NhZ2UuTGV2ZWw6BURlYnVnUghtaW5MZXZlbBIaCghjb250YWlucxgCIAMoCVIIY29udGFpbnM=');
@$core.Deprecated('Use logResponseDescriptor instead')
const LogResponse$json = const {
  '1': 'LogResponse',
};

/// Descriptor for `LogResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logResponseDescriptor = $convert.base64Decode('CgtMb2dSZXNwb25zZQ==');
