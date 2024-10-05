part of 'mongo.dart';

class MongoDBService extends DBServiceBase with GrpcService {
  static const UPDATEDAT = 'updatedAt';
  static const CREATEDAT = 'createdAt';
  static const ID = '_id';
  Db _db;
  Future _opening;
  String _uri;
  final DBModule<String> db;
  final MongoDBConfig mongoConfig;
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(MongoDBService);

  MongoDBService(ServerApplication application, this.mongoConfig, ClientApplication app)
      : db = app.db<String>(),
        super() {
    _uri = 'mongodb://${mongoConfig.host}:${mongoConfig.port ?? 27017}/${mongoConfig.db}';
    _db = Db(_uri);
  }

  DbCollection _collection(String collection) {
    return _db.collection('${mongoConfig.collectionPrefix}$collection');
  }

  @override
  Future<void> start() async {
    if (_opening != null) return _opening;
    logger.i(kLogKeys.mongoStarting(), {'uri': _uri});
    _opening = _db.open().then((value) async {
      if (mongoConfig.hasUsername() && mongoConfig.hasPassword()) {
        await _db.authenticate(mongoConfig.username, mongoConfig.password);
      }
    });
  }

  @override
  Future<void> stop() async {
    logger.i(kLogKeys.mongoStopping(), {'uri': _uri});
    return _db.close();
  }

  @override
  Stream<CreateResult> create(ServiceCall call, Stream<CreatePayload> request) async* {
    var resource;
    final ids = <String>[];
    final objects = await request.map((e) {
      resource ??= e.resource;
      try {
        final id = e.value.value[ID]?.stringValue ?? e.value.value['id']?.stringValue ?? Uuid().v4();
        e.value.value.remove('id');
        ids.add(id);
        return e.value.toNative(logger: logger, customNativeTransformer: MongoJsonToNativeTransformer)
          ..[CREATEDAT] = mongo.BsonDate(DateTime.now())
          ..[DBRights.CREATOR] = call.getSession().userId
          ..[UPDATEDAT] = mongo.BsonDate(DateTime.now())
          ..[ID] = id;
      } catch (e) {
        //print('[MongoDB.create] $e \n $stacktrace');
        rethrow;
      }
    }).toList();
    try {
      await _collection(resource).insertAll(objects);
      for (final id in ids) {
        yield CreateResult()..id = id;
      }
    } catch (e, s) {
      if (e is MongoDartError) {
        throw GrpcServiceError('db.errors.${e.errorCodeName}', e, s);
      } else if (e is Map && e.containsKey('codeName')) {
        throw GrpcServiceError('db.errors.${e['codeName']}', e, s);
      } else {
        rethrow;
      }
    }
  }

  Future<void> _ensureOpen() {
    return start();
  }

  @override
  Future<DeleteResult> delete(ServiceCall call, DeletePayload request) async {
    final query = request.query.toMongo(logger);
    final res = await _collection(request.query.resource).remove(query.map.isNotEmpty ? query : null);
    return DeleteResult()..nbDeleted = res['n'] as int ?? 0;
  }

  @override
  Stream<JsonObjectValue> fetch(ServiceCall call, FetchPayload request) async* {
    final query = request.query.toMongo(logger);
    await for (final chunk in _collection(request.query.resource).find(query)) {
      yield parseMongoObject(chunk, logger);
    }
  }

  @override
  Future<FetchOneResponse> fetchOne(ServiceCall call, FetchPayload request) async {
    final res = await _collection(request.query.resource).findOne(request.query.toMongo(logger));
    if (res == null) return FetchOneResponse();
    final resJson = parseMongoObject(res, logger);
    return FetchOneResponse()..object = resJson;
  }

  @override
  Future<UpdateResult> update(ServiceCall call, UpdatePayload request) async {
    final object = request.value.toNative(logger: logger, customNativeTransformer: MongoJsonToNativeTransformer)
      ..[UPDATEDAT] = mongo.BsonDate(DateTime.now());
    if (object.containsKey('id')) {
      object[ID] = object['id'];
      object.remove('id');
    }
    final res = await _collection(request.query.resource).update(
      request.query.toMongo(logger),
      object,
      upsert: request.upsert ?? false,
      multiUpdate: request.multiple ?? false,
    );
    return UpdateResult()..nbModified = res['n'] as int ?? 0;
  }

  @override
  Stream<PatchResult> patch(ServiceCall call, Stream<PatchPayload> request) async* {
    await for (final patch in request) {
      final mod = modify;
      for (final operation in patch.operation) {
        if (operation.hasLink()) {
          final link = operation.link;
          if (link.link) {
            mod.addToSetAll('${link.foreignField.resource}', link.foreignId);
          } else {
            mod.pullAll('${link.foreignField.resource}', link.foreignId);
          }
        } else if (operation.hasListOpe()) {
          final listOpe = operation.listOpe;
          final values =
              listOpe.values.map((e) => e.toNative(logger: logger, customNativeTransformer: MongoJsonToNativeTransformer)).toList();
          if (listOpe.add) {
            mod.addToSetAll('${listOpe.fieldName}', values);
          } else {
            for (final val in values) {
              //pull is exact match while pull is query match
              mod.pull('${listOpe.fieldName}', val);
            }
          }
        } else if (operation.hasUpdateOp()) {
          final updateOp = operation.updateOp;
          for (final entry in updateOp.data.entries) {
            mod.set(entry.key, entry.value.toNative(logger: logger, customNativeTransformer: MongoJsonToNativeTransformer));
          }
        } else {
          continue;
        }
      }
      mod.set(UPDATEDAT, mongo.BsonDate(DateTime.now()));
      final res = await _collection(patch.query.resource).update(
        patch.query.toMongo(logger),
        mod,
        upsert: patch.upsert ?? false,
        multiUpdate: patch.multiple ?? false,
      );
      yield PatchResult()..nbModified = res['n'] as int ?? 0;
    }
  }

  @override
  Future<CountResult> count(ServiceCall call, FetchPayload request) async {
    final query = request.query.toMongo(logger);
    final res = await _collection(request.query.resource).count(query);
    return CountResult()..count = res;
  }

  @override
  Future<CountResult> share(ServiceCall call, DBSharePayload request) async {
    int _toRight(DBShareRow row) {
      return int.parse('${row.manage ? 1 : 0}${row.write ? 1 : 0}${row.read ? 1 : 0}');
    }

    String _toId(DBShareRow row) {
      if (row.hasUser()) {
        return DBRights.userId(row.user);
      } else if (row.hasRole()) {
        return DBRights.roleId(row.role);
      } else if (row.public) {
        return DBRights.PUBLIC_ID;
      } else {
        return DBRights.AUTHENTICATED_ID;
      }
    }

    final resource = request.query.resource;
    final builder = QueryBuilder.fromQuery(request.query);
    if (request.toAdd.isNotEmpty) {
      final objects = <DBObject>[];
      for (final entry in request.toAdd) {
        objects.add(db.fromJson(JsonObject().putString(DBRights.ID, _toId(entry)).putInt(DBRights.VALUE, _toRight(entry))));
      }
      await db.resource(resource).patchBuilder(builder, upsert: true).addToSet(DBRights.RIGHTS, objects).end();
    }
    if (request.toRemove.isNotEmpty) {
      final objects = <DBObject>[];
      for (final entry in request.toRemove) {
        objects.add(db.fromJson(JsonObject().putString(DBRights.ID, _toId(entry))));
      }
      await db.resource(resource).patchBuilder(builder).removeFromSet(DBRights.RIGHTS, objects).end();
    }
    return CountResult();
  }
}

class MongoDBAdminService extends DBAdminServiceBase with GrpcService {
  final MongoDBService _service;
  MongoDBAdminService(this._service);

  String _collectionName(String collection) {
    return '${_service.mongoConfig.collectionPrefix}$collection';
  }

  @override
  Future<CreateIndexResult> createIndex(ServiceCall call, CreateIndexPayload request) async {
    await _service._ensureOpen();
    try {
      final keys = <String, dynamic>{}..addEntries(request.fields.map((e) {
          if (e.hasForeignField()) {
            return MapEntry('${e.foreignField.resource}', e.descending ? -1 : 1);
          } else {
            return MapEntry(e.fieldName, e.descending ? -1 : 1);
          }
        }));
      final res = await _service._db.createIndexExt(
        _collectionName(request.resource),
        name: request.hasName() ? request.name : null,
        unique: request.unique,
        expireAfterSeconds: request.hasExpireAfterSeconds() ? request.expireAfterSeconds : null,
        keys: keys,
      );
      return CreateIndexResult()..nbIndex = res['n'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> start() async {}

  @override
  Future<void> stop() async {}
}
