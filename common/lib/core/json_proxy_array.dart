part of 'core.dart';

class JsonArrayProxy implements JsonArray {
  final JsonArrayValue _inner;
  JsonArrayProxy(this._inner);

  @override
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

  @override
  T _safeGet<T>(int atIndex, Type type, {T defaut}) {
    throw UnimplementedError();
  }

  T _safeGetProto<T>(
    int atIndex, {
    @required bool Function(JsonValue) check,
    @required T Function(JsonValue) getter,
    T defaut,
  }) {
    if (_values.length > atIndex) {
      final res = _values[atIndex];
      if (res != null && check(res)) {
        return getter(res);
      }
    }
    return defaut;
  }

  @override
  List<Object> get _values => asRecursiveList();

  @override
  JsonArray addArray(JsonArray value, {int atIndex}) {
    _safeAdd(value.toProto(), atIndex);
    return this;
  }

  @override
  JsonArray addBool(bool value, {int atIndex}) {
    _safeAdd(JsonValue()..boolValue = value, atIndex);
    return this;
  }

  @override
  JsonArray addDouble(double value, {int atIndex}) {
    _safeAdd(JsonValue()..doubleValue = value, atIndex);
    return this;
  }

  @override
  JsonArray addInt(int value, {int atIndex}) {
    _safeAdd(JsonValue()..intValue = Int64(value), atIndex);
    return this;
  }

  @override
  JsonArray addJson(JsonObject value, {int atIndex}) {
    _safeAdd(value.toProto(), atIndex);
    return this;
  }

  @override
  JsonArray addNull({int atIndex}) {
    _safeAdd(JsonValue(), atIndex);
    return this;
  }

  @override
  JsonArray addNum(num value, {int atIndex}) {
    _safeAdd(JsonValue()..doubleValue = value.toDouble(), atIndex);
    return this;
  }

  @override
  JsonArray addString(String value, {int atIndex}) {
    _safeAdd(JsonValue()..stringValue = value, atIndex);
    return this;
  }

  @override
  Json get asJson => Json(this);

  @override
  Uint8List asJsonBuffer() => _inner.writeToBuffer();

  @override
  JsonObject asJsonObject() => JsonObject.fromMap(asRecursiveMap());

  @override
  String asJsonString() => json.encode(asRecursiveList());

  @override
  List<Object> asList() => asRecursiveList();

  @override
  List<Object> asRecursiveList() => _inner.value.map((e) => e.toNative());

  @override
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

  @override
  JsonArray getArray(int atIndex, {JsonArray defaut}) {
    return _safeGetProto<JsonArray>(atIndex,
        check: (value) => value.hasArray(), getter: (value) => JsonArrayProxy(value.array), defaut: defaut);
  }

  @override
  bool getBool(int atIndex, {bool defaut}) {
    return _safeGetProto<bool>(atIndex, check: (value) => value.hasBoolValue(), getter: (value) => value.boolValue, defaut: defaut);
  }

  @override
  double getDouble(int atIndex, {double defaut}) {
    return _safeGetProto<double>(atIndex, check: (value) => value.hasDoubleValue(), getter: (value) => value.doubleValue, defaut: defaut);
  }

  @override
  int getInt(int atIndex, {int defaut}) {
    return _safeGetProto<int>(atIndex, check: (value) => value.hasIntValue(), getter: (value) => value.intValue.toInt(), defaut: defaut);
  }

  @override
  JsonObject getJson(int atIndex, {JsonObject defaut}) {
    return _safeGetProto<JsonObject>(atIndex,
        check: (value) => value.hasObject(), getter: (value) => JsonObjectProxy(value.object), defaut: defaut);
  }

  @override
  num getNum(int atIndex, {num defaut}) {
    return _safeGetProto<num>(atIndex, check: (value) => value.hasDoubleValue(), getter: (value) => value.doubleValue, defaut: defaut);
  }

  @override
  String getString(int atIndex, {String defaut}) {
    return _safeGetProto<String>(atIndex, check: (value) => value.hasStringValue(), getter: (value) => value.stringValue, defaut: defaut);
  }

  @override
  bool get isEmpty => _inner.value.isEmpty;

  @override
  bool get isNotEmpty => _inner.value.isNotEmpty;

  @override
  int get length => _inner.value.length;

  @override
  JsonArray merge(JsonArray other, {bool inPlace = false}) {
    var dest = this;
    if (!inPlace) {
      dest = JsonArrayProxy(_inner.deepCopy());
    }
    for (final entry in other._values) {
      dest._values.add(entry);
    }
    return dest;
  }

  @override
  bool contains(Object key) => _values.contains(key);

  @override
  void remove(Object key) => _values.remove(key);

  @override
  void removeAt(int key) => _values.removeAt(key);

  @override
  List<JsonObject> asJsonList() => asList().map((e) => e as JsonObject).toList();
}
