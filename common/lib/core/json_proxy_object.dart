part of 'core.dart';

class JsonObjectProxy implements JsonObject {
  final JsonObjectValue _inner;
  JsonObjectProxy(this._inner);
  @override
  T _safeGet<T>(String key, Type type, {T defaut}) {
    throw UnimplementedError();
  }

  T _safeGetProto<T>(String key, {@required T Function(JsonValue) getter, @required bool Function(JsonValue) check, T defaut}) {
    if (_inner.value.containsKey(key)) {
      final value = _inner.value[key];
      if (check(value)) {
        return getter(value);
      }
    }
    return defaut;
  }

  @override
  Map<String, Object> get _values => _inner.toNative();

  @override
  Json get asJson => Json.parseObject(this);

  @override
  JsonArray asJsonArray() => JsonArray().addJson(this);

  @override
  Uint8List asJsonBuffer() => _inner.writeToBuffer();

  @override
  String asJsonString() => json.encode(asRecursiveMap());

  @override
  Map<String, Object> asMap() => _values;

  @override
  List<Object> asRecursiveList() => List.from(asRecursiveMap().values);

  @override
  Map<String, Object> asRecursiveMap() => _values;

  @override
  bool containsKey(String key) => _inner.value.containsKey(key);

  @override
  JsonArray getArray(String key, {JsonArray defaut}) {
    return _safeGetProto<JsonArray>(key,
        check: (value) => value.hasArray(), getter: (value) => JsonArrayProxy(value.array), defaut: defaut);
  }

  @override
  bool getBool(String key, {bool defaut}) {
    return _safeGetProto<bool>(key, check: (value) => value.hasBoolValue(), getter: (value) => value.boolValue, defaut: defaut);
  }

  @override
  double getDouble(String key, {double defaut}) {
    return _safeGetProto<double>(key, check: (value) => value.hasDoubleValue(), getter: (value) => value.doubleValue, defaut: defaut);
  }

  @override
  int getInt(String key, {int defaut}) {
    return _safeGetProto<int>(key, check: (value) => value.hasIntValue(), getter: (value) => value.intValue.toInt(), defaut: defaut);
  }

  @override
  JsonObject getJson(String key, {JsonObject defaut}) {
    return _safeGetProto<JsonObject>(key,
        check: (value) => value.hasObject(), getter: (value) => JsonObjectProxy(value.object), defaut: defaut);
  }

  @override
  num getNum(String key, {num defaut}) {
    return _safeGetProto<num>(key, check: (value) => value.hasDoubleValue(), getter: (value) => value.doubleValue, defaut: defaut);
  }

  @override
  String getString(String key, {String defaut}) {
    return _safeGetProto<String>(key, check: (value) => value.hasStringValue(), getter: (value) => value.stringValue, defaut: defaut);
  }

  @override
  bool get isEmpty => _inner.value.isEmpty;

  @override
  bool get isNotEmpty => _inner.value.isNotEmpty;

  @override
  List<String> get keys => _inner.value.keys.toList();

  @override
  int get length => _inner.value.length;

  @override
  JsonObject merge(JsonObject other, {bool inPlace = false}) {
    var dest = this;
    if (!inPlace) {
      dest = JsonObjectProxy(_inner.deepCopy());
    }
    for (final entry in other._values.entries) {
      dest._values[entry.key] = entry.value;
    }
    return dest;
  }

  @override
  JsonObject putArray(String key, JsonArray array) {
    _inner.value[key] = array.toProto();
    return this;
  }

  @override
  JsonObject putBool(String key, bool b) {
    _inner.value[key] = JsonValue();
    _inner.value[key].boolValue = b;
    return this;
  }

  @override
  JsonObject putDouble(String key, double d) {
    _inner.value[key] = JsonValue();
    _inner.value[key].doubleValue = d;
    return this;
  }

  @override
  JsonObject putInt(String key, int i) {
    _inner.value[key] = JsonValue();
    _inner.value[key].intValue = Int64(i);
    return this;
  }

  @override
  JsonObject putJson(String key, JsonObject j) {
    _inner.value[key] = j.toProto();
    return this;
  }

  @override
  JsonObject putNull(String key) {
    _inner.value[key] = JsonValue();
    return this;
  }

  @override
  JsonObject putNum(String key, num n) {
    _inner.value[key] = JsonValue();
    _inner.value[key].doubleValue = n.toDouble();
    return this;
  }

  @override
  JsonObject putString(String key, String s) {
    _inner.value[key] = JsonValue();
    _inner.value[key].stringValue = s;
    return this;
  }

  @override
  void remove(String key) {
    _inner.value.remove(key);
  }

  @override
  Map<String, Object> get values => _values;
}
