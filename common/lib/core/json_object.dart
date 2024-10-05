part of 'core.dart';

bool _isValidJsonType(Object any) {
  if (any is bool) {
    return true;
  } else if (any is int) {
    return true;
  } else if (any is double) {
    return true;
  } else if (any is num) {
    return true;
  } else if (any is String) {
    return true;
  } else if (any is JsonObject) {
    return true;
  } else if (any is JsonArray) {
    return true;
  } else {
    return false;
  }
}

class JsonObject {
  static Logger _logger;
  static Logger get logger {
    _logger ??= getLoggerFactory().loggerByType(JsonObject);
    return _logger;
  }

  final Map<String, Object> _values = {};
  JsonObject();
  Json get asJson => Json(this);
  JsonObject.fromJson(JsonObject other, {bool deep = false}) {
    for (final entry in other._values.entries) {
      var value = entry.value;
      if (deep) {
        if (entry.value is JsonObject) {
          value = JsonObject.fromJson(entry.value, deep: deep);
        } else if (entry.value is JsonArray) {
          value = JsonArray.fromJson(entry.value, deep: deep);
        }
      }
      _values[entry.key] = value;
    }
  }

  JsonObject.fromMap(Map<String, Object> map,
      {bool convertToStringIfNeeded = true}) {
    if (map != null) {
      for (final entry in map.entries) {
        if (entry.value == null) {
          //do nothing
        } else if (_isValidJsonType(entry.value)) {
          _values[entry.key] = entry.value;
        } else if (entry.value is List) {
          _values[entry.key] = JsonArray.fromList(entry.value);
        } else if (entry.value is Map) {
          _values[entry.key] = JsonObject.fromMap(entry.value);
        } else {
          if (convertToStringIfNeeded) {
            _values[entry.key] = entry.value?.toString();
          } else {
            logger.warn(kLogKeys.invalidJsonMapEntry(entry.key),
                details: entry.value);
          }
        }
      }
    }
  }

  factory JsonObject.fromBuffer(Uint8List value) {
    return JsonObject.fromString(utf8.decode(value));
  }
  factory JsonObject.fromString(String value) {
    final result = json.decode(value);
    if (result is Map) {
      return JsonObject.fromMap(result);
    } else {
      logger.warn(kLogKeys.invalidJsonString(), details: value);
      return JsonObject();
    }
  }

  Map<String, Object> get values => Map.from(_values);

  List<String> get keys => _values.keys.toList();

  bool get isEmpty => _values.isEmpty;

  bool get isNotEmpty => _values.isNotEmpty;

  int get length => _values.length;

  bool containsKey(String key) => _values.containsKey(key);

  void remove(String key) => _values.remove(key);

  JsonObject merge(JsonObject other, {bool inPlace = false}) {
    var dest = this;
    if (!inPlace) {
      dest = JsonObject.fromJson(this);
    }
    for (final entry in other._values.entries) {
      dest._values[entry.key] = entry.value;
    }
    return dest;
  }

  JsonObject putString(String key, String value) {
    _values[key] = value;
    return this;
  }

  JsonObject putBool(String key, bool value) {
    _values[key] = value;
    return this;
  }

  JsonObject putInt(String key, int value) {
    _values[key] = value;
    return this;
  }

  JsonObject putDouble(String key, double value) {
    _values[key] = value;
    return this;
  }

  JsonObject putNum(String key, num value) {
    _values[key] = value;
    return this;
  }

  JsonObject putJson(String key, JsonObject value) {
    _values[key] = value;
    return this;
  }

  JsonObject putArray(String key, JsonArray value) {
    _values[key] = value;
    return this;
  }

  JsonObject putNull(String key) {
    _values[key] = null;
    return this;
  }
  
  T _safeGet<T>(String key, Type type, {T defaut}) {
    if (_values.containsKey(key)) {
      final res = _values[key];
      if (res != null && res.runtimeType == type) {
        return res;
      }
    }
    return defaut;
  }

  bool getBool(String key, {bool defaut}) {
    return _safeGet<bool>(key, bool, defaut: defaut);
  }

  int getInt(String key, {int defaut}) {
    return _safeGet<int>(key, int, defaut: defaut);
  }

  double getDouble(String key, {double defaut}) {
    return _safeGet<double>(key, double, defaut: defaut);
  }

  num getNum(String key, {num defaut}) {
    if (_values.containsKey(key)) {
      final res = _values[key];
      if (res != null && res is num) {
        return res;
      }
    }
    return defaut;
  }

  String getString(String key, {String defaut}) {
    return _safeGet<String>(key, String, defaut: defaut);
  }

  JsonObject getJson(String key, {JsonObject defaut}) {
    return _safeGet<JsonObject>(key, JsonObject, defaut: defaut);
  }

  JsonArray getArray(String key, {JsonArray defaut}) {
    return _safeGet<JsonArray>(key, JsonArray, defaut: defaut);
  }

  String asJsonString() {
    return json.encode(asRecursiveMap());
  }

  Uint8List asJsonBuffer() {
    return utf8.encode(asJsonString());
  }

  Map<String, Object> asMap() => _values;
  Map<String, Object> asRecursiveMap() {
    final map = <String, Object>{};
    for (final entry in _values.entries) {
      var value = entry.value;
      if (value is JsonObject) {
        value = (value as JsonObject).asRecursiveMap();
      } else if (value is JsonArray) {
        value = (value as JsonArray).asRecursiveList();
      }
      map[entry.key] = value;
    }
    return map;
  }

  List<Object> asRecursiveList() => List.from(asRecursiveMap().values);

  JsonArray asJsonArray() => JsonArray.fromList(asRecursiveList());
}

class Json {
  static Logger _logger;
  static Logger get logger {
    _logger ??= getLoggerFactory().loggerByType(Json);
    return _logger;
  }

  final dynamic _inner;
  bool get isArray => _inner is JsonArray;
  bool get isObject => _inner is JsonObject;
  JsonArray get asArray => _inner as JsonArray;
  JsonObject get asObject => _inner as JsonObject;
  Json(this._inner);
  factory Json.parseMessage(GeneratedMessage message, {TypeRegistry registry}) {
    return Json.parseObject(message.toProto3JsonSafe(typeRegistry: registry));
  }
  factory Json.parseObject(dynamic json) {
    if (json is List) {
      return Json(JsonArray.fromList(json));
    } else if (json is Map) {
      return Json(JsonObject.fromMap(json));
    } else {
      logger.warn(kLogKeys.invalidJsonObject(), details: json);
      return Json(JsonObject());
    }
  }
  factory Json.parseString(String json) {
    final decoded = jsonDecode(json);
    if (decoded is List) {
      return Json(JsonArray.fromList(decoded));
    } else if (decoded is Map) {
      return Json(JsonObject.fromMap(decoded));
    } else {
      logger.warn(kLogKeys.invalidJsonString(), details: json);
      return Json(JsonObject());
    }
  }
  String asJsonString() {
    if (_inner is JsonObject) {
      return asObject.asJsonString();
    } else {
      return asArray.asJsonString();
    }
  }
}
