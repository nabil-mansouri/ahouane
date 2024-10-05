part of 'core.dart';

const int REQUIRED_BIT = 0x1;
const int REPEATED_BIT = 0x2;
const int PACKED_BIT = 0x4;
const int MAP_BIT = 0x400000;
const int GROUP_BIT = 0x400;
const int MESSAGE_BIT = 0x200000;
const int BOOL_BIT = 0x10;
const int BYTES_BIT = 0x20;
const int STRING_BIT = 0x40;
const int DOUBLE_BIT = 0x80;
const int FLOAT_BIT = 0x100;
const int ENUM_BIT = 0x200;
const int INT32_BIT = 0x800;
const int INT64_BIT = 0x1000;
const int SINT32_BIT = 0x2000;
const int SINT64_BIT = 0x4000;
const int UINT32_BIT = 0x8000;
const int UINT64_BIT = 0x10000;
const int FIXED32_BIT = 0x20000;
const int FIXED64_BIT = 0x40000;
const int SFIXED32_BIT = 0x80000;
const int SFIXED64_BIT = 0x100000;

typedef Proto3Override = JsonValue Function(
    BuilderInfo info, dynamic value, TypeRegistry registry);

class Proto3BaseType {
  static const boolean = Proto3BaseType('boolean');
  static const string = Proto3BaseType('string');
  static const integer = Proto3BaseType('integer');
  static const double = Proto3BaseType('double');
  static const bytes = Proto3BaseType('bytes');
  static const message = Proto3BaseType('message');
  static const enumeration = Proto3BaseType('enumeration');
  static const undefined = Proto3BaseType('undefined');
  final String name;
  const Proto3BaseType(this.name);
  @override
  String toString() {
    return name;
  }
}

extension GeneratedMessageProto3Ext on GeneratedMessage {
  static bool isEnum(int fieldType) => baseType(fieldType) == ENUM_BIT;
  static int baseType(int fieldType) =>
      fieldType & ~(REQUIRED_BIT | REPEATED_BIT | PACKED_BIT | MAP_BIT);
  static bool isGroupOrMessage(int fieldType) =>
      (fieldType & (GROUP_BIT | MESSAGE_BIT)) != 0;
  static bool isRepeated(int fieldType) => (fieldType & REPEATED_BIT) != 0;
  static bool isMap(int fieldType) => (fieldType & MAP_BIT) != 0;

  static Proto3BaseType toBaseTypeEnum(int fieldType) {
    final tmp = GeneratedMessageProto3Ext.baseType(fieldType);
    switch (tmp) {
      case GROUP_BIT:
      case MESSAGE_BIT:
        return Proto3BaseType.integer;
      case BOOL_BIT:
        return Proto3BaseType.boolean;
      case BYTES_BIT:
        return Proto3BaseType.bytes;
      case STRING_BIT:
        return Proto3BaseType.string;
      case DOUBLE_BIT:
      case FLOAT_BIT:
        return Proto3BaseType.double;
      case ENUM_BIT:
        return Proto3BaseType.enumeration;
      case INT32_BIT:
      case INT64_BIT:
      case SINT32_BIT:
      case SINT64_BIT:
      case UINT32_BIT:
      case UINT64_BIT:
      case FIXED32_BIT:
      case FIXED64_BIT:
      case SFIXED32_BIT:
      case SFIXED64_BIT:
        return Proto3BaseType.integer;
    }
    return Proto3BaseType.undefined;
  }

  JsonValue toJsonValue(
      {TypeRegistry typeRegistry,
      Proto3Override override,
      bool skipEmptyFields = true}) {
    String convertToMapKey(dynamic key, int keyType) {
      final baseType = GeneratedMessageProto3Ext.baseType(keyType);
      assert(!isRepeated(keyType));
      switch (baseType) {
        case BOOL_BIT:
          return key ? 'true' : 'false';
        case STRING_BIT:
          return key;
        case UINT64_BIT:
          return (key).toStringUnsigned();
        case INT32_BIT:
        case SINT32_BIT:
        case UINT32_BIT:
        case FIXED32_BIT:
        case SFIXED32_BIT:
        case INT64_BIT:
        case SINT64_BIT:
        case SFIXED64_BIT:
        case FIXED64_BIT:
          return key.toString();
        default:
          throw StateError('Not a valid key type $keyType');
      }
    }

    JsonValue valueToProto3Json(dynamic fieldValue, int fieldType) {
      if (fieldValue == null) return null;

      if (isGroupOrMessage(fieldType)) {
        return (fieldValue as GeneratedMessage).toJsonValue(
          typeRegistry: typeRegistry,
          override: override,
          skipEmptyFields: skipEmptyFields,
        );
      } else if (isEnum(fieldType)) {
        return (fieldValue as ProtobufEnum).name.asJsonValue();
      } else {
        final baseType = GeneratedMessageProto3Ext.baseType(fieldType);
        switch (baseType) {
          case BOOL_BIT:
            return (fieldValue ? true : false).asJsonValue();
          case STRING_BIT:
            return (fieldValue as String).asJsonValue();
          case INT32_BIT:
          case SINT32_BIT:
          case UINT32_BIT:
          case FIXED32_BIT:
          case SFIXED32_BIT:
            return (fieldValue as num).asJsonValue();
          case INT64_BIT:
          case SINT64_BIT:
          case SFIXED64_BIT:
          case FIXED64_BIT:
            return (fieldValue.toString()).asJsonValue();
          case FLOAT_BIT:
          case DOUBLE_BIT:
            double value = fieldValue;
            if (value.isNaN) return 'NaN'.asJsonValue();
            if (value.isInfinite) {
              if (value.isNegative) {
                return '-Infinity'.asJsonValue();
              } else {
                return 'Infinity'.asJsonValue();
              }
            }
            return value.asJsonValue();
          case UINT64_BIT:
            return (fieldValue).toStringUnsigned();
          case BYTES_BIT:
            return base64Encode(fieldValue).asJsonValue();
          default:
            throw StateError(
                'Invariant violation: unexpected value type $fieldType');
        }
      }
    }

    if (override != null) {
      final res = override(info_, this, typeRegistry);
      if (res != null) return res;
    }

    final result = JsonObjectValue();
    for (final fieldInfo in info_.sortedByTag) {
      if (!hasField(fieldInfo.tagNumber) && skipEmptyFields) {
        continue;
      }
      final value = getField(fieldInfo.tagNumber);
      if (value == null || (value is List && value.isEmpty)) {
        continue; // It's missing, repeated, or an empty byte array.
      }
      JsonValue jsonValue;
      if (fieldInfo.isMapField) {
        final object = JsonObjectValue();
        for (final entry in (value as PbMap).entries) {
          final mapEntryInfo = fieldInfo as MapFieldInfo;
          object.value[convertToMapKey(entry.key, mapEntryInfo.keyFieldType)] =
              valueToProto3Json(entry.value, mapEntryInfo.valueFieldType);
        }
        jsonValue = JsonValue()..object = object;
      } else if (fieldInfo.isRepeated) {
        final array = JsonArrayValue();
        for (final value in (value as PbList)) {
          array.value.add(valueToProto3Json(value, fieldInfo.type));
        }
        jsonValue = JsonValue()..array = array;
      } else {
        jsonValue = valueToProto3Json(value, fieldInfo.type);
      }
      result.value[fieldInfo.name] = jsonValue;
    }
    // Extensions and unknown fields are not encoded by proto3 JSON.
    return JsonValue()..object = result;
  }
}
