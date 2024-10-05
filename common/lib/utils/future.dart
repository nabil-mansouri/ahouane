import 'dart:async';

import 'package:async/async.dart';
import 'package:optional/optional_internal.dart';

class FutureOptional<T> extends DelegatingFuture<Optional<T>> {
  final Completer<Optional<T>> _completer;

  FutureOptional._(Completer<Optional<T>> completer, Future<T> future)
      : _completer = completer,
        super(completer.future) {
    future
        .then((value) => _completer.complete(Optional.ofNullable(value)))
        .catchError((e, stacktrace) => _completer.completeError(e, stacktrace));
  }
  factory FutureOptional.sync(Future<T> future) =>
      FutureOptional._(Completer<Optional<T>>.sync(), future);
}
