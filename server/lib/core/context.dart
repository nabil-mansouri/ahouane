part of 'core.dart';

abstract class ContextKey<BODY> {
  final String name;
  const ContextKey(this.name);
}

mixin ContextBehaviour<KEY extends ContextKey> {
  Storage<String> storage();

  bool containsKey(KEY key) => storage().containsKey(key.name);

  T put<T>(covariant ContextKey<T> key, T value) =>
      storage().put<T>(key.name, value);

  T getByKey<T>(covariant ContextKey<T> key, {T Function() orValue}) =>
      storage().getByKey<T>(key.name, orValue: orValue);

  T getOrSet<T>(covariant ContextKey<T> key, T Function() generate) {
    storage().putIfAbsent(key.name, generate);
    return storage().getByKey(key.name);
  }

  void clear() {
    storage().clear();
  }
}
