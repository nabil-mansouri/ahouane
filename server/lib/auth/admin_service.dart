part of 'auth.dart';

class AuthAdminService extends AuthAdminServiceBase with GrpcService {
  final ServerAuthConfig config;
  final TokenModule token;
  final DBModule<String> db;
  final EmailModule email;
  final AuthAdminModule authClient;
  AuthAdminService(this.config, ClientApplication app)
      : db = app.db<String>(),
        token = app.token(),
        email = app.email(),
        authClient = app.authAdmin();
  static String cryptPwd(String password) {
    return DBCrypt().hashpw(password, DBCrypt().gensalt());
  }

  static String tokenTypeEmail(String email) => 'userEmail_$email';
  static String tokenTypePwd(String email) => 'userPwd_$email';
  @override
  Future<User> blockUser(ServiceCall call, User request) async {
    await db.resource(config.userResource).patchOne(request.id, db.fromJson(JsonObject().putBool('blocked', true)));
    return request..blocked = true;
  }

  @override
  Future<User> unblockUser(ServiceCall call, User request) async {
    await db.resource(config.userResource).patchOne(request.id, db.fromJson(JsonObject().putBool('blocked', false)));
    return request..blocked = false;
  }

  @override
  Future<CreateUserResponse> createUser(ServiceCall call, User request) async {
    request.password = cryptPwd(request.password);
    final id = await db.resource(config.userResource).createOne(db.fromProto(request));
    request.id = id;
    final roles = await authClient.affectDefaultRoles(request);
    final allScopes = (roles.expand((element) => element.scopes).toList());
    final allRoles = (roles.map((e) => e.id).toList());
    return CreateUserResponse()
      ..user = request
      ..roles.addAll(allRoles)
      ..scopes.addAll(allScopes);
  }

  @override
  Future<AuthEmpty> deleteUser(ServiceCall call, User request) async {
    await db.resource(config.userResource).deleteOne(request.id);
    return AuthEmpty();
  }

  @override
  Stream<User> listUsers(ServiceCall call, AuthEmpty request) {
    final users = db.resource(config.userResource).fetch(db.query());
    return users.map((event) => db.toProto(event, User()));
  }

  @override
  Future<void> start() async {
    User()
      ..addToTypeRegistry(UserDetails())
      ..addToTypeRegistry(UserAddress());
  }

  @override
  Future<void> stop() async {}

  @override
  Future<User> updateUser(ServiceCall call, UpdateUserPayload request) async {
    final user = request.user;
    user
      ..clearCreatedAt()
      ..clearUpdatedAt();
    if (request.hasNewPassword()) {
      user.password = cryptPwd(request.newPassword);
    } else {
      user.clearPassword();
    }
    final json = db.fromProto(user);
    await db.resource(config.userResource).patchOne(user.id, json);
    return user..updatedAt = Timestamp().now();
  }
}
