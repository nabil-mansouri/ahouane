part of 'mongo.dart';

class DBRights {
  static const PUBLIC_ID = 'global:public';
  static const AUTHENTICATED_ID = 'global:authenticated';
  static const ID = 'id';
  static const RIGHTS = '_rights';
  static const CREATOR = '_creator';
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

class DBInterceptor extends GrpcInterceptor {
  final DBModule<String> db;
  final MongoDBConfig config;
  DBInterceptor(
      ServerApplication application, this.config, ClientApplication app)
      : db = app.db<String>();
  @override
  Future<void> onStart() async {
    for (final res in config.protectedResources) {
      await db.resource(res).createIndex([
        QuerySort()..fieldName = ('${DBRights.RIGHTS}.${DBRights.ID}'),
        QuerySort()..fieldName = ('${DBRights.RIGHTS}.${DBRights.VALUE}'),
      ]);
      await db.resource(res).createIndex([
        QuerySort()..fieldName = ('${DBRights.CREATOR}'),
      ]);
    }
  }

  Future<bool> canAccessResource(ServiceCall call, String resource) async {
    if (call.isSuperUser()) {
      return true;
    }
    if (config.publicResources.contains(resource)) {
      return true;
    }
    if (config.protectedResources.contains(resource)) {
      return true;
    }
    return false;
  }

  void protectedResource(ServiceCall call, Query query, int right) {
    if (call.isSuperUser()) return;
    if (!config.protectedResources.contains(query.resource)) {
      return;
    }
    //
    final session = call.getSession();
    final ids = <String>[];
    if (session.isAuthenticated()) {
      ids.addAll([DBRights.AUTHENTICATED_ID, DBRights.PUBLIC_ID]);
    } else {
      ids.addAll([DBRights.PUBLIC_ID]);
    }
    final roles = session.roles;
    final userId = session.isAuthenticated()
        ? Optional.of(session.userId)
        : Optional.empty();
    final subQueryRights = db.query();
    final rootQuery = db.query();
    if (userId.isPresent) {
      rootQuery.or(db.query().eq(
          DBRights.CREATOR, DBRights.getUserId(userId.value).asJsonValue()));
      subQueryRights.or(
        db
            .query()
            .eq(DBRights.ID, DBRights.userId(userId.value).asJsonValue())
            .gte(DBRights.VALUE, right.asJsonValue()),
      );
    }
    if (roles.isNotEmpty) {
      subQueryRights.or(
        db
            .query()
            .isIn(
                DBRights.ID, roles.map((e) => DBRights.roleId(e).asJsonValue()))
            .gte(DBRights.VALUE, right.asJsonValue()),
      );
    }
    if (ids.isNotEmpty) {
      subQueryRights.or(
        db
            .query()
            .isIn(DBRights.ID, ids.map((e) => e.asJsonValue()))
            .gte(DBRights.VALUE, right.asJsonValue()),
      );
    }
    if (subQueryRights.hasFilters) {
      rootQuery.or(db.query().subQueryMatch(DBRights.RIGHTS, subQueryRights));
    }
    if (!rootQuery.hasFilters) return;
    final wrapped = QueryBuilder.fromQuery(query).and(rootQuery);
    query
      ..clear()
      ..mergeFromMessage(wrapped.build());
  }

  @override
  Stream<T> onRequest<T extends GeneratedMessage>(
      ServiceMethod method, ServiceCall call, Stream<T> stream) {
    return stream.asyncMap((e) async {
      if (call.isSuperUser()) return e;
      if (method.name == 'fetch' ||
          method.name == 'fetchOne' ||
          method.name == 'count') {
        final object = e as FetchPayload;
        final res = await canAccessResource(call, object.query.resource);
        if (!res) throw DBErrors.forbidden;
        protectedResource(call, object.query, DBRights.read);
      } else if (method.name == 'create') {
        final object = e as CreatePayload;
        final res = await canAccessResource(call, object.resource);
        if (!res) throw DBErrors.forbidden;
      } else if (method.name == 'patch') {
        final object = e as PatchPayload;
        final res = await canAccessResource(call, object.query.resource);
        if (!res) throw DBErrors.forbidden;
        protectedResource(call, object.query, DBRights.write);
      } else if (method.name == 'update') {
        final object = e as UpdatePayload;
        final res = await canAccessResource(call, object.query.resource);
        if (!res) throw DBErrors.forbidden;
        protectedResource(call, object.query, DBRights.write);
      } else if (method.name == 'delete') {
        final object = e as DeletePayload;
        final res = await canAccessResource(call, object.query.resource);
        if (!res) throw DBErrors.forbidden;
        protectedResource(call, object.query, DBRights.manage);
      } else if (method.name == 'share') {
        final object = e as DBSharePayload;
        final res = await canAccessResource(call, object.query.resource);
        if (!res) throw DBErrors.forbidden;
        protectedResource(call, object.query, DBRights.manage);
      } else {
        throw DBErrors.badRequest;
      }
      return e;
    });
  }
}
