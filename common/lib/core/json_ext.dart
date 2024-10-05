part of 'core.dart';

typedef JsonToNativeTransformer = dynamic Function(Any any);
typedef JsonWrapperFunc = Any Function(dynamic any);

extension NumJsonValue on num {
  JsonValue asJsonValue() {
    if (this is int) {
      return JsonValue()..intValue = Int64(toInt());
    } else {
      return JsonValue()..doubleValue = toDouble();
    }
  }
}

extension StringJsonValue on String {
  JsonValue asJsonValue() => JsonValue()..stringValue = this;
}

extension BoolJsonValue on bool {
  JsonValue asJsonValue() => JsonValue()..boolValue = this;
}

extension JsonValueExt on JsonValue {
  dynamic toNative(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    if (hasArray()) {
      return array.toNative(
          logger: logger, customNativeTransformer: customNativeTransformer);
    } else if (hasBoolValue()) {
      return boolValue;
    } else if (hasDoubleValue()) {
      return doubleValue;
    } else if (hasIntValue()) {
      return intValue.toInt();
    } else if (hasNullValue()) {
      return null;
    } else if (hasObject()) {
      return object.toNative(
          logger: logger, customNativeTransformer: customNativeTransformer);
    } else if (hasStringValue()) {
      return stringValue;
    } else if (hasCustom()) {
      if (customNativeTransformer != null) {
        return customNativeTransformer(custom as dynamic);
      } else {
        logger?.warn(kLogKeys.missingUnwrapper(), details: [toDebugString()]);
      }
    } else {
      logger?.warn(kLogKeys.invalidUnwrapType(), details: [toDebugString()]);
    }
  }

  List toNativeAsList(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    final res = toNative(
        logger: logger, customNativeTransformer: customNativeTransformer);
    if (res is List) {
      return res;
    } else if (res == null) {
      return [];
    } else {
      return [res];
    }
  }
}

extension JsonArrayValueExt on JsonArrayValue {
  List<dynamic> toNative(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    return value
        .map((e) => e.toNative(
            logger: logger, customNativeTransformer: customNativeTransformer))
        .toList();
  }

  JsonArray toJsonArray(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    return JsonArray.fromList(toNative(
        logger: logger, customNativeTransformer: customNativeTransformer));
  }
}

extension JsonObjectValueExt on JsonObjectValue {
  Map<String, dynamic> toNative(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    return value.map((key, value) => MapEntry(
        key,
        value.toNative(
            logger: logger, customNativeTransformer: customNativeTransformer)));
  }

  JsonObject toJsonObject(
      {Logger logger, JsonToNativeTransformer customNativeTransformer}) {
    return JsonObject.fromMap(toNative(
        logger: logger, customNativeTransformer: customNativeTransformer));
  }
}

JsonValue _mapJsonValue(dynamic value,
    {Logger logger, JsonWrapperFunc wrapper}) {
  if (value == null) {
    return JsonValue()..nullValue = true;
  } else if (value is int) {
    return JsonValue()..intValue = Int64(value);
  } else if (value is double) {
    return JsonValue()..doubleValue = value;
  } else if (value is String) {
    return JsonValue()..stringValue = value;
  } else if (value is bool) {
    return JsonValue()..boolValue = value;
  } else if (value is Map) {
    return JsonValue()
      ..object = JsonObject.fromMap(value)
          .toProto(logger: logger, wrapper: wrapper)
          .object;
  } else if (value is JsonObject) {
    return JsonValue()
      ..object = value.toProto(logger: logger, wrapper: wrapper).object;
  } else if (value is List) {
    return JsonValue()
      ..array = JsonArray.fromList(value)
          .toProto(logger: logger, wrapper: wrapper)
          .array;
  } else if (value is JsonArray) {
    return JsonValue()
      ..array = (value).toProto(logger: logger, wrapper: wrapper).array;
  } else if (wrapper != null) {
    final v = JsonValue()..custom = wrapper(value) as dynamic;
    if (v == null) {
      logger?.warn(kLogKeys.invalidWrapValue(), details: [value]);
    }
    return v;
  } else {
    logger?.warn(kLogKeys.invalidJsonValue(), details: [value]);
    return null;
  }
}

extension JsonArrayExt on JsonArray {
  JsonValue toProto({Logger logger, JsonWrapperFunc wrapper}) {
    final inner = JsonArrayValue()
      ..value.addAll(
        _values
            .map((e) => _mapJsonValue(e, logger: logger, wrapper: wrapper))
            .toList(),
      );
    return JsonValue()..array = inner;
  }
}

extension JsonObjectExt on JsonObject {
  JsonValue toProto({Logger logger, JsonWrapperFunc wrapper}) {
    final inner = JsonObjectValue();
    _values.forEach((key, value) {
      inner.value[key] = _mapJsonValue(value, logger: logger, wrapper: wrapper);
    });
    return JsonValue()..object = inner;
  }
}

extension JsonProtoExt on Json {
  JsonValue toProto({Logger logger, JsonWrapperFunc wrapper}) {
    return isArray
        ? asArray.toProto(logger: logger, wrapper: wrapper)
        : asObject.toProto(logger: logger, wrapper: wrapper);
  }
}

extension JsonObjectValueParse on JsonObjectValue {
  JsonValue asJsonValue() => JsonValue()..object = this;
  JsonObjectValue fromMap(
    Map<String, dynamic> map, {
    bool convertToStringIfNeeded = true,
    Logger logger,
    JsonValue Function(dynamic value) override,
  }) {
    if (map != null) {
      for (final entry in map.entries) {
        if (override != null) {
          final res = override(entry.value);
          if (res != null) {
            value[entry.key] = res;
            continue;
          }
        }
        //
        if (entry.value == null) {
          value[entry.key] = JsonValue()..nullValue = true;
        } else if (entry.value is JsonObject) {
          final arr = entry.value as JsonObject;
          value[entry.key] = JsonObjectValue()
              .fromMap(
                arr.asMap(),
                convertToStringIfNeeded: convertToStringIfNeeded,
                override: override,
                logger: logger,
              )
              .asJsonValue();
        } else if (entry.value is JsonArray) {
          final arr = entry.value as JsonArray;
          value[entry.key] = JsonArrayValue()
              .fromList(
                arr.asList(),
                convertToStringIfNeeded: convertToStringIfNeeded,
                override: override,
                logger: logger,
              )
              .asJsonValue();
        } else if (_isValidJsonType(entry.value)) {
          value[entry.key] = primitiveToJsonValue(entry.value);
        } else if (entry.value is List) {
          value[entry.key] = JsonArrayValue()
              .fromList(
                entry.value,
                convertToStringIfNeeded: convertToStringIfNeeded,
                override: override,
                logger: logger,
              )
              .asJsonValue();
        } else if (entry.value is Map) {
          value[entry.key] = JsonObjectValue()
              .fromMap(
                entry.value,
                convertToStringIfNeeded: convertToStringIfNeeded,
                override: override,
                logger: logger,
              )
              .asJsonValue();
        } else {
          if (convertToStringIfNeeded) {
            final val = entry.value?.toString()?.asJsonValue();
            if (val != null) {
              value[entry.key] = val;
            } else {
              value[entry.key] = JsonValue()..nullValue = true;
            }
          } else {
            logger?.warn(kLogKeys.invalidJsonMapEntry(entry.key),
                details: entry.value);
          }
        }
      }
    }
    return this;
  }
}

JsonValue primitiveToJsonValue(dynamic any) {
  if (any is bool) {
    return any.asJsonValue();
  } else if (any is int) {
    return any.asJsonValue();
  } else if (any is double) {
    return any.asJsonValue();
  } else if (any is num) {
    return any.asJsonValue();
  } else if (any is String) {
    return any.asJsonValue();
  } else {
    return JsonValue()..nullValue = true;
  }
}

extension JsonArrayValueParse on JsonArrayValue {
  JsonValue asJsonValue() => JsonValue()..array = this;
  JsonArrayValue fromList(
    List list, {
    bool convertToStringIfNeeded = true,
    Logger logger,
    JsonValue Function(dynamic value) override,
  }) {
    if (list != null) {
      for (final element in list) {
        if (override != null) {
          final res = override(element);
          if (res != null) {
            value.add(res);
            continue;
          }
        }
        //
        if (element == null) {
          value.add(JsonValue()..nullValue = true);
        } else if (element is JsonObject) {
          value.add(JsonObjectValue()
              .fromMap(
                element.asMap(),
                convertToStringIfNeeded: convertToStringIfNeeded,
                override: override,
                logger: logger,
              )
              .asJsonValue());
        } else if (element is JsonArray) {
          value.add(
            JsonArrayValue()
                .fromList(
                  element.asList(),
                  convertToStringIfNeeded: convertToStringIfNeeded,
                  override: override,
                  logger: logger,
                )
                .asJsonValue(),
          );
        } else if (_isValidJsonType(element)) {
          value.add(primitiveToJsonValue(element));
        } else if (element is List) {
          value.add(
            JsonArrayValue()
                .fromList(
                  element,
                  convertToStringIfNeeded: convertToStringIfNeeded,
                  override: override,
                  logger: logger,
                )
                .asJsonValue(),
          );
        } else if (element is Map) {
          value.add(
            JsonObjectValue()
                .fromMap(
                  element,
                  convertToStringIfNeeded: convertToStringIfNeeded,
                  override: override,
                  logger: logger,
                )
                .asJsonValue(),
          );
        } else {
          logger.warn(kLogKeys.invalidJsonListElement(), details: element);
        }
      }
    }
    return this;
  }
}
