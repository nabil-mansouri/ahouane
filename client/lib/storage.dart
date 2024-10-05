import 'dart:typed_data';

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/storage.pbgrpc.dart';
import 'package:ahouane_common/utils/utils.dart';

export 'dart:typed_data';
export 'package:ahouane_client/core/core.dart';
export 'package:ahouane_common/generated/storage.pbgrpc.dart';

class StorageErrors{
  static const badId = 'storage.errors.badid';
  static const forbidden = 'storage.errors.forbidden';
  static const toDepth = 'storage.errors.toodepth';
  static const notAuthenticated = 'storage.errors.notauth';
  static const missingPath = 'storage.errors.missingpath';
  static const alreadyExists = 'storage.errors.exists';
  static const notExists = 'storage.errors.notexists';
  static const badRequest = 'storage.errors.badrequest';
}

class _StorageShare {
  final StorageClientModule module;
  final _payload = StorageSharePayload();
  _StorageShare(this.module, StoragePath path) {
    _payload.path = path;
  }
  _StorageShare addUser(String id,
      {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(StorageShareRow()
      ..user = id
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _StorageShare addRole(String id,
      {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(StorageShareRow()
      ..role = id
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _StorageShare addAuthenticatedUser(
      {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(StorageShareRow()
      ..authenticated = true
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _StorageShare addPublic(
      {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(StorageShareRow()
      ..public = true
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _StorageShare removeUser(String id) {
    _payload.toRemove.add(StorageShareRow()..user = id);
    return this;
  }

  _StorageShare removeRole(String id) {
    _payload.toRemove.add(StorageShareRow()..role = id);
    return this;
  }

  _StorageShare removePublic() {
    _payload.toRemove.add(StorageShareRow()..public = true);
    return this;
  }

  _StorageShare removeAuthenticated() {
    _payload.toRemove.add(StorageShareRow()..authenticated = true);
    return this;
  }

  Future<void> end() async {
    await module._service.share(_payload);
  }
}

class _StorageModulePath {
  final StoragePath path;
  final StorageClientModule module;
  _StorageModulePath(this.path, this.module);

  _StorageShare share() {
    return _StorageShare(module, path);
  }

  String getUrl() {
    final url1 = module.application.baseUri.resolve('./StorageService/');
    final url2 = url1.resolve('./${StorageClientModule.pathToId(path)}');
    return url2.toString();
  }

  Future<StorageMeta> create(Stream<Uint8List> buffer,
      {bool upsert = false}) async {
    final meta = StorageMeta()..path = path;

    Stream<StorageCreatePayload> generator() async* {
      yield (StorageCreatePayload()
        ..upsert = upsert
        ..meta = meta);
      await for (final chunk in buffer) {
        yield StorageCreatePayload()..chunk = (StorageFile()..buffer = chunk);
      }
    }

    return module._service.create(generator());
  }

  Future<StorageMeta> update(Stream<Uint8List> buffer,
      {bool upsert = false}) async {
    final meta = StorageMeta()..path = path;
    Stream<StorageCreatePayload> generator() async* {
      yield StorageCreatePayload()
        ..upsert = upsert
        ..meta = meta;
      await for (final chunk in buffer) {
        yield StorageCreatePayload()..chunk = (StorageFile()..buffer = chunk);
      }
    }

    return module._service.update(generator());
  }

  Future<StorageMeta> meta() {
    return module._service.meta(path);
  }

  Stream<Uint8List> fetch() {
    return module._service.fetch(path).map((event) => event.buffer);
  }

  Future<void> delete() async {
    await module._service.delete(path);
  }
}

class StorageClientModule extends ClientModule {
  static Optional<StoragePath> pathFromId(String id) {
    final split = StringUtils.fromBase64(id).split(':');
    return split.length == 2
        ? Optional.of(StoragePath()
          ..bucketId = split[0]
          ..path = split[1])
        : Optional.empty();
  }

  static String pathToId(StoragePath path) {
    return StringUtils.toBase64('${path.bucketId}:${path.path}');
  }

  final StorageServiceClient _service;
  StorageClientModule(ClientApplication app)
      : _service = StorageServiceClient(app.createChannel()),
        super(app);
  _StorageModulePath path(String path, {String bucketId}) => _StorageModulePath(
      StoragePath()
        ..path = path
        ..bucketId = bucketId,
      this);
  _StorageModulePath id(String id) {
    final path = StorageClientModule.pathFromId(id);
    if (path.isEmpty) throw StorageErrors.badId;
    return _StorageModulePath(path.value, this);
  }
}

extension ClientApplicationStorage on ClientApplication {
  StorageClientModule storage() => StorageClientModule(this);
}
