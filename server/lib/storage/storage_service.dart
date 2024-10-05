part of 'storage.dart';

extension StorageLogKeys on LogKeys {
  LogKey storageStopping() =>
      LogKey('storageStopping', description: 'Storage stopping');
  LogKey storageStarting() =>
      LogKey('storageStarting', description: 'Storage starting');
}

class StorageService extends StorageServiceBase with GrpcService {
  final logger = ServerApplication.instance()
      .logger()
      .defaultLoggerFactory()
      .loggerByType(StorageService);
  final ServerStorageConfig config;
  final DBModule<String> db;
  StorageService(
      ServerApplication application, this.config, ClientApplication app)
      : db = app.db<String>();

  @override
  Future<void> start() async {
    logger.i(
      kLogKeys.storageStarting(),
      {'directory': config.directory},
    );
  }

  Future<File> _file(
    ServiceCall call,
    StoragePath path,
    bool shouldExists,
  ) async {
    var bucketId = path.bucketId;
    if (bucketId?.trim()?.isNotEmpty != true) {
      final session = call.getSession();
      if (!session.isAuthenticated()) throw StorageErrors.notAuthenticated;
      bucketId = session.userId;
    }
    if (path?.path?.trim()?.isNotEmpty != true) {
      throw StorageErrors.forbidden;
    }
    if (path.path.split('/').length > config.maxPathDepth) {
      throw StorageErrors.toDepth;
    }
    final directory = Directory(config.directory).absolute;
    final basePath = p.normalize(p.join(directory.path, bucketId));
    final realPath = p.normalize(p.join(basePath, path.path));
    if (!p.isWithin(basePath, realPath)) throw StorageErrors.forbidden;
    if (await FileSystemEntity.isDirectory(realPath)) {
      throw StorageErrors.forbidden;
    }
    final fileName = p.basename(realPath);
    if (!config.allowDotFiles && fileName.startsWith('.')) {
      throw StorageErrors.forbidden;
    }
    //allowed extensions
    final ext = StringUtils.removeStart(p.extension(fileName), '.');
    if (config.allowExtentions.isNotEmpty &&
        !config.allowExtentions.contains(ext)) {
      throw StorageErrors.forbidden;
    }
    //forbid extensions
    if (config.forbidExtentions.isNotEmpty &&
        config.forbidExtentions.contains(ext)) {
      throw StorageErrors.forbidden;
    }
    final file = File(realPath);
    if (shouldExists != null) {
      final exists = await file.exists();
      if (shouldExists != exists) {
        throw shouldExists
            ? StorageErrors.notExists
            : StorageErrors.alreadyExists;
      }
    }
    return file;
  }

  @override
  Future<StorageMeta> create(
      ServiceCall call, Stream<StorageCreatePayload> request) async {
    IOSink fileOpen;
    File file;
    StorageMeta meta;
    try {
      await for (final chunk in request) {
        if (chunk.hasMeta()) {
          meta = chunk.meta;
          file = await _file(call, meta.path, chunk.upsert ? null : false);
          await file.create(recursive: true);
          fileOpen = file.openWrite();
        } else {
          if (fileOpen == null) throw StorageErrors.missingPath;
          fileOpen.add(chunk.chunk.buffer);
        }
      }
      return StorageMeta()
        ..mergeFromMessage(meta)
        ..createdAt = Timestamp().now()
        ..path = meta.path
        ..id = StorageClientModule.pathToId(meta.path)
        ..size = await file.length();
    } finally {
      // ignore: unawaited_futures
      fileOpen?.close();
    }
  }

  @override
  Future<StorageMeta> update(
      ServiceCall call, Stream<StorageCreatePayload> request) async {
    IOSink fileOpen;
    File file;
    StorageMeta meta;
    try {
      await for (final chunk in request) {
        if (chunk.hasMeta()) {
          meta = chunk.meta;
          file = await _file(call, meta.path, chunk.upsert ? null : true);
          fileOpen = file.openWrite(mode: FileMode.writeOnly);
        } else {
          if (fileOpen == null) throw StorageErrors.missingPath;
          fileOpen.add(chunk.chunk.buffer);
        }
      }
      return StorageMeta()
        ..mergeFromMessage(meta)
        ..path = meta.path
        ..createdAt = Timestamp().now()
        ..updatedAt = Timestamp().now()
        ..size = await file.length();
    } finally {
      // ignore: unawaited_futures
      fileOpen?.close();
    }
  }

  @override
  Future<StorageEmpty> delete(ServiceCall call, StoragePath request) async {
    final file = await _file(call, request, true);
    await file.delete();
    return StorageEmpty();
  }

  @override
  Stream<StorageFile> fetch(ServiceCall call, StoragePath request) async* {
    final file = await _file(call, request, true);
    final open = file.openRead();
    await for (final chunk in open) {
      yield StorageFile()..buffer = chunk;
    }
  }

  @override
  Future<StorageMeta> meta(ServiceCall call, StoragePath request) async {
    final file = await _file(call, request, true);
    final stat = await file.stat();
    final res = await db
        .resource(config.rightResource)
        .fetchOne(StorageClientModule.pathToId(request));
    final shares = <StorageShareRow>[];
    if (res.isPresent) {
      final rights = res.value.getArray(StorageRights.RIGHTS).asJsonList();
      for (final right in rights) {
        final row = StorageShareRow();
        row.read = right.getInt(StorageRights.VALUE) >= 1;
        row.write = right.getInt(StorageRights.VALUE) >= 10;
        row.manage = right.getInt(StorageRights.VALUE) >= 100;
        final id = right.getString(StorageRights.ID);
        if (StorageRights.AUTHENTICATED_ID == id) {
          row.authenticated = true;
        } else if (StorageRights.PUBLIC_ID == id) {
          row.public = true;
        } else if (StorageRights.isRole(id)) {
          row.role = StorageRights.getRoleId(id);
        } else {
          row.user = StorageRights.getUserId(id);
        }
        shares.add(row);
      }
    }
    return StorageMeta()
      ..updatedAt = stat.modified.asTimestamp
      ..path = request
      ..size = stat.size
      ..rights.addAll(shares)
      ..id = StorageClientModule.pathToId(request);
  }

  @override
  Future<void> stop() async {
    logger.i(
      kLogKeys.storageStopping(),
      {'directory': config.directory},
    );
  }

  @override
  Future<StorageEmpty> share(
      ServiceCall call, StorageSharePayload request) async {
    int _toRight(StorageShareRow row) {
      return int.parse(
          '${row.manage ? 1 : 0}${row.write ? 1 : 0}${row.read ? 1 : 0}');
    }

    String _toId(StorageShareRow row) {
      if (row.hasUser()) {
        return StorageRights.userId(row.user);
      } else if (row.hasRole()) {
        return StorageRights.roleId(row.role);
      } else if (row.public) {
        return StorageRights.PUBLIC_ID;
      } else {
        return StorageRights.AUTHENTICATED_ID;
      }
    }

    if (request.toAdd.isNotEmpty) {
      final objects = <DBObject>[];
      for (final entry in request.toAdd) {
        objects.add(db.fromJson(JsonObject()
            .putString(StorageRights.ID, _toId(entry))
            .putInt(StorageRights.VALUE, _toRight(entry))));
      }
      await db
          .resource(config.rightResource)
          .patchOneBuilder(StorageClientModule.pathToId(request.path),
              upsert: true)
          .addToSet(StorageRights.RIGHTS, objects)
          .end();
    }
    if (request.toRemove.isNotEmpty) {
      final objects = <DBObject>[];
      for (final entry in request.toRemove) {
        objects.add(db
            .fromJson(JsonObject().putString(StorageRights.ID, _toId(entry))));
      }
      await db
          .resource(config.rightResource)
          .patchOneBuilder(StorageClientModule.pathToId(request.path))
          .removeFromSet(StorageRights.RIGHTS, objects)
          .end();
    }
    return StorageEmpty();
  }
}
