library ahouane.core.common;

import 'dart:convert';
import 'dart:math';

import 'dart:typed_data';

import 'package:ahouane_common/generated/google/protobuf/any.pb.dart';
import 'package:ahouane_common/generated/json.pb.dart';
import 'package:ahouane_common/generated/logger.pb.dart';
import 'package:ahouane_common/generated/logger.pbenum.dart';
import 'package:ahouane_common/generated/google/protobuf/wrappers.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';
import 'package:ahouane_common/generated/google/protobuf/timestamp.pb.dart' as timestamppb;
import 'package:ahouane_common/generated/google/protobuf/duration.pb.dart' as durationpb;
import 'package:logger/logger.dart' as loglib;
import 'package:yaml/yaml.dart';

export 'package:ahouane_common/generated/google/protobuf/struct.pb.dart';
export 'package:ahouane_common/generated/google/protobuf/wrappers.pb.dart';
export 'package:ahouane_common/generated/google/protobuf/timestamp.pb.dart';
export 'package:ahouane_common/generated/google/protobuf/any.pb.dart';
export 'package:ahouane_common/generated/json.pb.dart';
export 'package:ahouane_common/generated/core.pb.dart';
export 'package:ahouane_common/generated/microservice.pb.dart';
export 'package:ahouane_common/generated/email.pb.dart';
export 'package:ahouane_common/generated/token.pb.dart';
export 'package:protobuf/protobuf.dart';
export 'package:grpc/grpc.dart';
export 'package:fixnum/fixnum.dart';
export 'package:optional/optional.dart';
part 'proto3.dart';
part 'json_array.dart';
part 'json_ext.dart';
part 'json_object.dart';
part 'json_proxy_array.dart';
part 'json_proxy_object.dart';
part 'logger.dart';
part 'logkeys.dart';
part 'proto_ext.dart';

extension DurationNano on Duration {
  int get inNanos => 1000 * inMicroseconds;
  durationpb.Duration get asProtoDuration => durationpb.Duration()..nanos = inNanos;
}

extension PBDurationNano on durationpb.Duration {
  Duration get asDuration => Duration(seconds: seconds.toInt());
}

extension DateTimeTimestamp on DateTime {
  timestamppb.Timestamp get asTimestamp => timestamppb.Timestamp()..seconds = Int64((millisecondsSinceEpoch / 1000).floor());
}

extension TimestampDatetime on timestamppb.Timestamp {
  DateTime get asDateTime => DateTime.fromMillisecondsSinceEpoch(seconds.toInt() * 1000);
  timestamppb.Timestamp now() {
    final sec = DateTime.now().millisecondsSinceEpoch / 1000;
    seconds = Int64(sec.floor());
    return this;
  }
}

extension YamlMapExt on YamlMap {
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    for (final entry in entries) {
      map[entry.key + ''] = entry.value;
    }
    return map;
  }
}

class Proto {
  static Int32Value int32(int value) {
    return Int32Value()..value = value;
  }

  static StringValue string(String value) {
    return StringValue()..value = value;
  }

  static BoolValue boolean(bool value) {
    return BoolValue()..value = value;
  }
}
