part of 'auth.dart';

class ScopeService extends ScopeServiceBase with GrpcService {
  final ServerApplication application;
  final DBModule<String> db;
  final ServerScopeConfig config;
  StreamSubscription _subscription;
  ScopeService(this.application, this.config, ClientApplication app)
      : db = app.db<String>();
  @override
  Future<ScopeEmpty> attachRole(
      ServiceCall call, AttachRolePayload request) async {
    await db.resource(config.userResource).linkOneToOne(
          request.userId,
          foreignResource: config.roleResource,
          foreignId: request.roleId,
        );
    return ScopeEmpty();
  }

  @override
  Future<ScopeEmpty> detachRole(
      ServiceCall call, AttachRolePayload request) async {
    await db.resource(config.userResource).unlinkOneToOne(
          request.userId,
          foreignResource: config.roleResource,
          foreignId: request.roleId,
        );
    return ScopeEmpty();
  }

  @override
  Future<ScopeEmpty> attachScope(
      ServiceCall call, AttachScopePayload request) async {
    await db.resource(config.roleResource).linkOneToOne(request.roleId,
        foreignResource: config.scopeResource, foreignId: request.scopeId);
    return ScopeEmpty();
  }

  @override
  Future<ScopeEmpty> detachScope(
      ServiceCall call, AttachScopePayload request) async {
    final scopes = await db
        .resource(config.scopeResource)
        .fetch(db.query().idStartsWith(request.scopeId))
        .toList();
    final ids = scopes.map((e) => e.getString('id')).toList();
    await db.resource(config.roleResource).unlinkOneToMany(request.roleId,
        foreignResource: config.scopeResource, foreignId: ids);
    return ScopeEmpty();
  }

  @override
  Future<RoleList> getRoles(ServiceCall call, ScopesPayload request) async {
    final user =
        await db.resource(config.userResource).fetchOne(request.userId);
    if (user.isEmpty) return RoleList();
    final ids = user.value
        .getArray(config.roleResource)
        .asList()
        .cast<String>()
        .toList();
    final roles = db.resource(config.roleResource).fetch(db.query().idIn(ids));
    final scopeList = RoleList();
    await for (JsonObject roleJson in roles) {
      final role = db.toProto(roleJson, Role(), TypeRegistry([Scope()]));
      scopeList.roles.add(role);
    }
    return scopeList;
  }

  @override
  Future<Role> createRole(ServiceCall call, Role request) async {
    if (request.id != null) {
      await db
          .resource(config.roleResource)
          .updateOne(request.id, db.fromProto(request), upsert: true);
    } else {
      final id = await db
          .resource(config.roleResource)
          .createOne(db.fromProto(request));
      request.id = id;
    }
    return request;
  }

  @override
  Future<Scope> createScope(ServiceCall call, Scope request) async {
    await db
        .resource(config.scopeResource)
        .updateOne(request.id, db.fromProto(request), upsert: true);
    return request;
  }

  @override
  Future<void> start() async {
    _subscription = GrpcChannelService.onGrpcServiceStart.listen((event) async {
      final futures = <Future>[];
      futures.add(createScope(
          null, AuthModule.buildScope(event.i18Name, service: event.$name)));
      for (final method in event.allMethods) {
        futures.add(createScope(
            null,
            AuthModule.buildScope('${event.i18Name}.$method',
                service: event.$name, method: method)));
      }
      await Future.wait(futures);
    });
    final futures = <Future>[];
    for (final role in config.initRoles) {
      futures.add(createRole(null, role));
    }
    await Future.wait(futures);
    await db.resource(config.roleResource).createIndex(
      [QuerySort()..foreignField = db.foreignField(config.userResource)],
    );
    await db.resource(config.roleResource).createIndex([
      QuerySort()..fieldName = config.scopeResource,
    ]);
  }

  @override
  Future<void> stop() async {
    await _subscription?.cancel();
  }

  @override
  Future<RoleList> affectDefaultRoles(ServiceCall call, User request) async {
    if (config.defaultRoleIds.isEmpty) return RoleList();
    await db.resource(config.userResource).linkOneToMany(request.id,
        foreignResource: config.roleResource, foreignId: config.defaultRoleIds);
    return getRoles(null, ScopesPayload()..userId = request.id);
  }
}

class ScopeInterceptor extends ChannelInterceptor {
  final DBModule<String> db;
  final ServerScopeConfig config;
  ScopeInterceptor(
      ServerApplication application, this.config, ClientApplication app)
      : db = app.db<String>(),
        super(ChannelInterceptorConfig());
  @override
  bool acceptType(InterceptorType type) => InterceptorType.Before == (type);
  @override
  Future<void> onIntercept(RouteContext context, MessageReader request,
      MessageWritter response, InterceptorType type) async {
    final scope = context.routeSegments.join('.');
    final header = await request.header();
    //if call came from local microservice skip
    if (header.isSuperUser()) {
      return;
    }
    final sessionScope = header.session.scopes;
    //public scope
    for (final expectScope in config.publicScopes) {
      if (scope.startsWith(expectScope)) {
        return;
      }
    }
    //
    for (final expectScope in sessionScope) {
      //--- expectScope= service | scope=service.method => ok
      //--- expectScope= service.method | scope= service => nok
      if (scope.startsWith(expectScope)) {
        return;
      }
    }
    response.addError(AuthErrors.unauthorized).end();
    context.stop();
  }
}
