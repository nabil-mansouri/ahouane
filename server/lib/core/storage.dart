part of 'core.dart';

typedef StorageLazyValue<T> = T Function();

T _voidFunc<T>() {
  return null;
}

abstract class Storage<KEY> {
  T put<T>(KEY key, T value);
  T putIfAbsent<T>(KEY key, StorageLazyValue<T> compute);
  T getByKey<T>(KEY key, {T Function() orValue});
  bool containsKey(KEY key);
  void clear();
  Set<KEY> keys();
  static Storage<KEY> inMemory<KEY>() => InMemoryStorage<KEY>();
}

class InMemoryStorage<KEY> extends Storage<KEY> {
  final Map<KEY, dynamic> _cache = {};

  @override
  T putIfAbsent<T>(KEY key, StorageLazyValue<T> compute) =>
      _cache.putIfAbsent(key, compute);

  @override
  bool containsKey(KEY key) => _cache.containsKey(key);

  @override
  void clear() => _cache.clear();

  @override
  T put<T>(KEY key, T value) {
    _cache[key] = value;
    return value;
  }

  @override
  T getByKey<T>(KEY key, {T Function() orValue}) {
    orValue ??= _voidFunc;
    try {
      return _cache.containsKey(key) ? _cache[key] as T : orValue();
    } catch (e) {
      return orValue();
    }
  }

  @override
  Set<KEY> keys() => _cache.keys.toSet();
}

//=== Module and extensions

class StorageModule extends ServerModule {
  StorageModule._(ServerApplication application) : super(application);

  InMemoryStorage imMemory() => InMemoryStorage();
}
