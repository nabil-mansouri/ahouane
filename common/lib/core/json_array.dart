part of 'core.dart';

class JsonArray {
  static Logger _logger;
  static Logger get logger {
    _logger ??= getLoggerFactory().loggerByType(JsonArray);
    return _logger;
  }

  Json get asJson => Json(this);
  final List<Object> _values = [];
  JsonArray();

  JsonArray.fromJson(JsonArray other, {bool deep = false}) {
    for (final entry in other._values) {
      var value = entry;
      if (deep) {
        if (entry is JsonObject) {
          value = JsonObject.fromJson(entry, deep: deep);
        } else if (entry is JsonArray) {
          value = JsonArray.fromJson(entry, deep: deep);
        }
      }
      _values.add(value);
    }
  }

  JsonArray.fromList(List list) {
    for (final entry in list) {
      if (entry == null) {
        _values.add(null);
      } else if (_isValidJsonType(entry)) {
        _values.add(entry);
      } else if (entry is List) {
        _values.add(JsonArray.fromList(entry));
      } else if (entry is Map) {
        _values.add(JsonObject.fromMap(entry));
      } else {
        logger.warn(kLogKeys.invalidJsonListElement(), details: entry);
      }
    }
  }

  factory JsonArray.fromString(String value) {
    final result = json.decode(value);
    if (result is List) {
      return JsonArray.fromList(result);
    } else {
      logger.warn(kLogKeys.invalidJsonString(), details: value);
      return JsonArray();
    }
  }

  bool get isEmpty => _values.isEmpty;

  bool get isNotEmpty => _values.isNotEmpty;

  int get length => _values.length;

  bool contains(Object key) => _values.contains(key);

  void remove(Object key) => _values.remove(key);

  void removeAt(int key) => _values.removeAt(key);

  JsonArray merge(JsonArray other, {bool inPlace = false}) {
    var dest = this;
    if (!inPlace) {
      dest = JsonArray.fromJson(this);
    }
    for (final entry in other._values) {
      dest._values.add(entry);
    }
    return dest;
  }

  void _safeAdd(Object value, int atIndex) {
    if (atIndex == null) {
      _values.add(value);
    } else {
      if (atIndex >= _values.length) {
        _values.length = atIndex + 1;
      }
      _values[atIndex] = value;
    }
  }

  JsonArray addString(String value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addBool(bool value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addInt(int value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addDouble(double value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addNum(num value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addJson(JsonObject value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addArray(JsonArray value, {int atIndex}) {
    _safeAdd(value, atIndex);
    return this;
  }

  JsonArray addNull({int atIndex}) {
    _safeAdd(null, atIndex);
    return this;
  }

  T _safeGet<T>(int index, Type type, {T defaut}) {
    if (_values.length > index) {
      final res = _values[index];
      if (res != null && res.runtimeType == type) {
        return res;
      }
    }
    return defaut;
  }

  bool getBool(int index, {bool defaut}) {
    return _safeGet<bool>(index, bool, defaut: defaut);
  }

  int getInt(int index, {int defaut}) {
    return _safeGet<int>(index, int, defaut: defaut);
  }

  double getDouble(int index, {double defaut}) {
    return _safeGet<double>(index, double, defaut: defaut);
  }

  num getNum(int index, {num defaut}) {
    if (_values.length > index) {
      final res = _values[index];
      if (res != null && res is num) {
        return res;
      }
    }
    return defaut;
  }

  String getString(int index, {String defaut}) {
    return _safeGet<String>(index, String, defaut: defaut);
  }

  JsonObject getJson(int index, {JsonObject defaut}) {
    return _safeGet<JsonObject>(index, JsonObject, defaut: defaut);
  }

  JsonArray getArray(int index, {JsonArray defaut}) {
    return _safeGet<JsonArray>(index, JsonArray, defaut: defaut);
  }

  String asJsonString() => json.encode(asRecursiveList());

  Uint8List asJsonBuffer() {
    return utf8.encode(asJsonString());
  }

  List<JsonObject> asJsonList() => _values.map((e) => e as JsonObject).toList();
  List<Object> asList() => _values;
  List<Object> asRecursiveList() {
    var values = <Object>[];
    for (final val in _values) {
      var value = val;
      if (val is JsonObject) {
        value = val.asRecursiveMap();
      } else if (val is JsonArray) {
        value = val.asRecursiveList();
      }
      values.add(value);
    }
    return values;
  }

  Map<String, Object> asRecursiveMap() {
    final list = asRecursiveList();
    var i = 0;
    final map = {};
    for (final value in list) {
      map[i] = value;
      i++;
    }
    return map;
  }

  JsonObject asJsonObject() => JsonObject.fromMap(asRecursiveMap());
}
