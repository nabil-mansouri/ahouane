///
//  Generated code. Do not modify.
//  source: http.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use httpClientConfigDescriptor instead')
const HttpClientConfig$json = const {
  '1': 'HttpClientConfig',
  '2': const [
    const {'1': 'baseUri', '3': 1, '4': 1, '5': 9, '10': 'baseUri'},
    const {'1': 'emulateMethods', '3': 2, '4': 1, '5': 8, '10': 'emulateMethods'},
  ],
};

/// Descriptor for `HttpClientConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpClientConfigDescriptor = $convert.base64Decode('ChBIdHRwQ2xpZW50Q29uZmlnEhgKB2Jhc2VVcmkYASABKAlSB2Jhc2VVcmkSJgoOZW11bGF0ZU1ldGhvZHMYAiABKAhSDmVtdWxhdGVNZXRob2Rz');
@$core.Deprecated('Use httpServiceConfigDescriptor instead')
const HttpServiceConfig$json = const {
  '1': 'HttpServiceConfig',
  '2': const [
    const {'1': 'maxBodySize', '3': 1, '4': 1, '5': 5, '10': 'maxBodySize'},
    const {'1': 'serviceConfig', '3': 4, '4': 1, '5': 11, '6': '.ChannelServiceConfig', '10': 'serviceConfig'},
  ],
};

/// Descriptor for `HttpServiceConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpServiceConfigDescriptor = $convert.base64Decode('ChFIdHRwU2VydmljZUNvbmZpZxIgCgttYXhCb2R5U2l6ZRgBIAEoBVILbWF4Qm9keVNpemUSOwoNc2VydmljZUNvbmZpZxgEIAEoCzIVLkNoYW5uZWxTZXJ2aWNlQ29uZmlnUg1zZXJ2aWNlQ29uZmln');
@$core.Deprecated('Use httpServerConfigDescriptor instead')
const HttpServerConfig$json = const {
  '1': 'HttpServerConfig',
  '2': const [
    const {'1': 'port', '3': 1, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'secure', '3': 2, '4': 1, '5': 8, '10': 'secure'},
    const {'1': 'host', '3': 3, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'certificatePath', '3': 4, '4': 1, '5': 9, '10': 'certificatePath'},
    const {'1': 'privateKeyPath', '3': 5, '4': 1, '5': 9, '10': 'privateKeyPath'},
    const {'1': 'privateKeyPassword', '3': 6, '4': 1, '5': 9, '10': 'privateKeyPassword'},
    const {'1': 'enableMetrics', '3': 7, '4': 1, '5': 8, '10': 'enableMetrics'},
    const {'1': 'enableLogs', '3': 8, '4': 1, '5': 8, '10': 'enableLogs'},
  ],
};

/// Descriptor for `HttpServerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpServerConfigDescriptor = $convert.base64Decode('ChBIdHRwU2VydmVyQ29uZmlnEhIKBHBvcnQYASABKAVSBHBvcnQSFgoGc2VjdXJlGAIgASgIUgZzZWN1cmUSEgoEaG9zdBgDIAEoCVIEaG9zdBIoCg9jZXJ0aWZpY2F0ZVBhdGgYBCABKAlSD2NlcnRpZmljYXRlUGF0aBImCg5wcml2YXRlS2V5UGF0aBgFIAEoCVIOcHJpdmF0ZUtleVBhdGgSLgoScHJpdmF0ZUtleVBhc3N3b3JkGAYgASgJUhJwcml2YXRlS2V5UGFzc3dvcmQSJAoNZW5hYmxlTWV0cmljcxgHIAEoCFINZW5hYmxlTWV0cmljcxIeCgplbmFibGVMb2dzGAggASgIUgplbmFibGVMb2dz');
@$core.Deprecated('Use mHttpHeaderDescriptor instead')
const MHttpHeader$json = const {
  '1': 'MHttpHeader',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 9, '10': 'values'},
  ],
};

/// Descriptor for `MHttpHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mHttpHeaderDescriptor = $convert.base64Decode('CgtNSHR0cEhlYWRlchIWCgZ2YWx1ZXMYASADKAlSBnZhbHVlcw==');
@$core.Deprecated('Use mHttpHeadersDescriptor instead')
const MHttpHeaders$json = const {
  '1': 'MHttpHeaders',
  '2': const [
    const {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    const {'1': 'expires', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expires'},
    const {'1': 'ifModifiedSince', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'ifModifiedSince'},
    const {'1': 'host', '3': 4, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 5, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'contentType', '3': 6, '4': 1, '5': 9, '10': 'contentType'},
    const {'1': 'contentLength', '3': 7, '4': 1, '5': 5, '10': 'contentLength'},
    const {'1': 'persistentConnection', '3': 8, '4': 1, '5': 8, '10': 'persistentConnection'},
    const {'1': 'chunkedTransferEncoding', '3': 9, '4': 1, '5': 8, '10': 'chunkedTransferEncoding'},
    const {'1': 'headers', '3': 10, '4': 3, '5': 11, '6': '.MHttpHeaders.HeadersEntry', '10': 'headers'},
  ],
  '3': const [MHttpHeaders_HeadersEntry$json],
};

@$core.Deprecated('Use mHttpHeadersDescriptor instead')
const MHttpHeaders_HeadersEntry$json = const {
  '1': 'HeadersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.MHttpHeader', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `MHttpHeaders`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mHttpHeadersDescriptor = $convert.base64Decode('CgxNSHR0cEhlYWRlcnMSLgoEZGF0ZRgBIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBGRhdGUSNAoHZXhwaXJlcxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2V4cGlyZXMSRAoPaWZNb2RpZmllZFNpbmNlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIPaWZNb2RpZmllZFNpbmNlEhIKBGhvc3QYBCABKAlSBGhvc3QSEgoEcG9ydBgFIAEoBVIEcG9ydBIgCgtjb250ZW50VHlwZRgGIAEoCVILY29udGVudFR5cGUSJAoNY29udGVudExlbmd0aBgHIAEoBVINY29udGVudExlbmd0aBIyChRwZXJzaXN0ZW50Q29ubmVjdGlvbhgIIAEoCFIUcGVyc2lzdGVudENvbm5lY3Rpb24SOAoXY2h1bmtlZFRyYW5zZmVyRW5jb2RpbmcYCSABKAhSF2NodW5rZWRUcmFuc2ZlckVuY29kaW5nEjQKB2hlYWRlcnMYCiADKAsyGi5NSHR0cEhlYWRlcnMuSGVhZGVyc0VudHJ5UgdoZWFkZXJzGkgKDEhlYWRlcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIiCgV2YWx1ZRgCIAEoCzIMLk1IdHRwSGVhZGVyUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use mCookieDescriptor instead')
const MCookie$json = const {
  '1': 'MCookie',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'expires', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expires'},
    const {'1': 'maxAge', '3': 4, '4': 1, '5': 5, '10': 'maxAge'},
    const {'1': 'domain', '3': 5, '4': 1, '5': 9, '10': 'domain'},
    const {'1': 'path', '3': 6, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'secure', '3': 7, '4': 1, '5': 8, '10': 'secure'},
    const {'1': 'httpOnly', '3': 8, '4': 1, '5': 8, '10': 'httpOnly'},
  ],
};

/// Descriptor for `MCookie`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mCookieDescriptor = $convert.base64Decode('CgdNQ29va2llEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFdmFsdWUYAiABKAlSBXZhbHVlEjQKB2V4cGlyZXMYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdleHBpcmVzEhYKBm1heEFnZRgEIAEoBVIGbWF4QWdlEhYKBmRvbWFpbhgFIAEoCVIGZG9tYWluEhIKBHBhdGgYBiABKAlSBHBhdGgSFgoGc2VjdXJlGAcgASgIUgZzZWN1cmUSGgoIaHR0cE9ubHkYCCABKAhSCGh0dHBPbmx5');
@$core.Deprecated('Use mHttpRequestDescriptor instead')
const MHttpRequest$json = const {
  '1': 'MHttpRequest',
  '2': const [
    const {'1': 'contentLength', '3': 1, '4': 1, '5': 5, '10': 'contentLength'},
    const {'1': 'method', '3': 2, '4': 1, '5': 9, '10': 'method'},
    const {'1': 'uri', '3': 3, '4': 1, '5': 9, '10': 'uri'},
    const {'1': 'requestedUri', '3': 4, '4': 1, '5': 9, '10': 'requestedUri'},
    const {'1': 'headers', '3': 5, '4': 1, '5': 11, '6': '.MHttpHeaders', '10': 'headers'},
    const {'1': 'cookies', '3': 6, '4': 3, '5': 11, '6': '.MCookie', '10': 'cookies'},
    const {'1': 'persistentConnection', '3': 7, '4': 1, '5': 8, '10': 'persistentConnection'},
    const {'1': 'protocolVersion', '3': 8, '4': 1, '5': 9, '10': 'protocolVersion'},
    const {'1': 'remoteAddress', '3': 9, '4': 1, '5': 9, '10': 'remoteAddress'},
    const {'1': 'remotePort', '3': 10, '4': 1, '5': 5, '10': 'remotePort'},
    const {'1': 'localPort', '3': 11, '4': 1, '5': 5, '10': 'localPort'},
  ],
};

/// Descriptor for `MHttpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mHttpRequestDescriptor = $convert.base64Decode('CgxNSHR0cFJlcXVlc3QSJAoNY29udGVudExlbmd0aBgBIAEoBVINY29udGVudExlbmd0aBIWCgZtZXRob2QYAiABKAlSBm1ldGhvZBIQCgN1cmkYAyABKAlSA3VyaRIiCgxyZXF1ZXN0ZWRVcmkYBCABKAlSDHJlcXVlc3RlZFVyaRInCgdoZWFkZXJzGAUgASgLMg0uTUh0dHBIZWFkZXJzUgdoZWFkZXJzEiIKB2Nvb2tpZXMYBiADKAsyCC5NQ29va2llUgdjb29raWVzEjIKFHBlcnNpc3RlbnRDb25uZWN0aW9uGAcgASgIUhRwZXJzaXN0ZW50Q29ubmVjdGlvbhIoCg9wcm90b2NvbFZlcnNpb24YCCABKAlSD3Byb3RvY29sVmVyc2lvbhIkCg1yZW1vdGVBZGRyZXNzGAkgASgJUg1yZW1vdGVBZGRyZXNzEh4KCnJlbW90ZVBvcnQYCiABKAVSCnJlbW90ZVBvcnQSHAoJbG9jYWxQb3J0GAsgASgFUglsb2NhbFBvcnQ=');
@$core.Deprecated('Use mHttpResponseDescriptor instead')
const MHttpResponse$json = const {
  '1': 'MHttpResponse',
  '2': const [
    const {'1': 'contentLength', '3': 1, '4': 1, '5': 5, '10': 'contentLength'},
    const {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {'1': 'reasonPhrase', '3': 3, '4': 1, '5': 9, '10': 'reasonPhrase'},
    const {'1': 'persistentConnection', '3': 4, '4': 1, '5': 8, '10': 'persistentConnection'},
    const {'1': 'deadline', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'deadline'},
    const {'1': 'bufferOutput', '3': 6, '4': 1, '5': 8, '10': 'bufferOutput'},
    const {'1': 'headers', '3': 7, '4': 1, '5': 11, '6': '.MHttpHeaders', '10': 'headers'},
    const {'1': 'cookies', '3': 8, '4': 3, '5': 11, '6': '.MCookie', '10': 'cookies'},
  ],
};

/// Descriptor for `MHttpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mHttpResponseDescriptor = $convert.base64Decode('Cg1NSHR0cFJlc3BvbnNlEiQKDWNvbnRlbnRMZW5ndGgYASABKAVSDWNvbnRlbnRMZW5ndGgSHgoKc3RhdHVzQ29kZRgCIAEoBVIKc3RhdHVzQ29kZRIiCgxyZWFzb25QaHJhc2UYAyABKAlSDHJlYXNvblBocmFzZRIyChRwZXJzaXN0ZW50Q29ubmVjdGlvbhgEIAEoCFIUcGVyc2lzdGVudENvbm5lY3Rpb24SNQoIZGVhZGxpbmUYBSABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGRlYWRsaW5lEiIKDGJ1ZmZlck91dHB1dBgGIAEoCFIMYnVmZmVyT3V0cHV0EicKB2hlYWRlcnMYByABKAsyDS5NSHR0cEhlYWRlcnNSB2hlYWRlcnMSIgoHY29va2llcxgIIAMoCzIILk1Db29raWVSB2Nvb2tpZXM=');
