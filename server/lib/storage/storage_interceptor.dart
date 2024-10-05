part of 'storage.dart';

class StorageRights {
  static const PUBLIC_ID = 'global:public';
  static const AUTHENTICATED_ID = 'global:authenticated';
  static const ID = 'id';
  static const RIGHTS = 'rights';
  static const VALUE = 'value';
  static const owner = 0;
  static const read = 1;
  static const write = 10;
  static const manage = 100;
  static String roleId(String id) => 'role:$id';
  static String userId(String id) => 'user:$id';
  static bool isUser(String id) => id.startsWith('user:');
  static bool isRole(String id) => id.startsWith('role:');
  static String getUserId(String id) => id.replaceAll('user:', '');
  static String getRoleId(String id) => id.replaceAll('role:', '');
}

class StorageInterceptor extends GrpcInterceptor {
  final DBModule<String> db;
  final ServerStorageConfig config;
  StorageInterceptor(
      ServerApplication application, this.config, ClientApplication app)
      : db = app.db<String>();
  @override
  Future<void> onStart() async {
    await db.resource(config.rightResource).createIndex([
      QuerySort()..fieldName = ('${StorageRights.RIGHTS}.${StorageRights.ID}'),
      QuerySort()
        ..fieldName = ('${StorageRights.RIGHTS}.${StorageRights.VALUE}'),
    ]);
  }

  Future<bool> canAccessPath(
      ServiceCall call, StoragePath object, int right) async {
    if (call.isSuperUser()) {
      return true;
    }
    //
    final id = StorageClientModule.pathToId(object);
    Future<int> count(
        Optional<String> userId, List<String> roles, List<String> ids) async {
      final clauses = db.query();
      var init = false;
      if (userId.isPresent) {
        init = true;
        clauses.or(
          db
              .query()
              .eq(StorageRights.ID,
                  StorageRights.userId(userId.value).asJsonValue())
              .gte(StorageRights.VALUE, right.asJsonValue()),
        );
      }
      if (roles.isNotEmpty) {
        init = true;
        clauses.or(
          db
              .query()
              .isIn(StorageRights.ID,
                  roles.map((e) => StorageRights.roleId(e).asJsonValue()))
              .gte(StorageRights.VALUE, right.asJsonValue()),
        );
      }
      if (ids.isNotEmpty) {
        init = true;
        clauses.or(
          db
              .query()
              .isIn(StorageRights.ID, ids.map((e) => e.asJsonValue()))
              .gte(StorageRights.VALUE, right.asJsonValue()),
        );
      }
      if (!init) return 0;
      final query =
          db.query().id(id).subQueryMatch(StorageRights.RIGHTS, clauses);
      final res = await db.resource(config.rightResource).count(query);
      return res;
    }

    final session = call.getSession();
    if (session.isAuthenticated()) {
      if (object.bucketId.isEmpty) {
        object.bucketId = session.userId;
      }
      //
      if (object.bucketId != session.userId) {
        final res = await count(Optional.of(session.userId), session.roles,
            [StorageRights.AUTHENTICATED_ID, StorageRights.PUBLIC_ID]);
        if (res == 0) {
          return false;
        }
      }
    } else {
      final res =
          await count(Optional.empty(), <String>[], [StorageRights.PUBLIC_ID]);
      if (res == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Stream<T> onRequest<T extends GeneratedMessage>(
      ServiceMethod method, ServiceCall call, Stream<T> stream) {
    return stream.asyncMap((e) async {
      if (method.name == 'fetch' || method.name == 'meta') {
        final object = e as StoragePath;
        final res = await canAccessPath(call, object, StorageRights.read);
        if (!res) throw StorageErrors.forbidden;
      } else if (method.name == 'delete') {
        final object = e as StoragePath;
        final res = await canAccessPath(call, object, StorageRights.manage);
        if (!res) throw StorageErrors.forbidden;
      } else if (method.name == 'share') {
        final object = e as StorageSharePayload;
        final res =
            await canAccessPath(call, object.path, StorageRights.manage);
        if (!res) throw StorageErrors.forbidden;
      } else if (method.name == 'update') {
        final object = e as StorageCreatePayload;
        if (object.hasMeta()) {
          final res =
              await canAccessPath(call, object.meta.path, StorageRights.write);
          if (!res) {
            throw StorageErrors.forbidden;
          }
        }
      } else if (method.name == 'create') {
        final object = e as StorageCreatePayload;
        if (object.hasMeta()) {
          object.meta.path.bucketId = call.getSession().userId;
        }
      } else {
        throw StorageErrors.badRequest;
      }
      return e;
    });
  }
}
