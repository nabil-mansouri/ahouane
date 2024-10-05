part of 'auth.dart';

extension AuthLogKeys on LogKeys {
  LogKey authStopping() => LogKey('authStopping', description: 'Auth stopping');
  LogKey authStarting() => LogKey('authStarting', description: 'Auth starting');
  LogKey authCreateByEmail() => LogKey('authCreateByEmail', description: 'Auth create by email');
  LogKey authDeleteUser() => LogKey('authDeleteUser', description: 'Auth delete user');
  LogKey authLoginEmail() => LogKey('authLoginEmail', description: 'Auth login user');
}

class AuthService extends AuthServiceBase with GrpcService {
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(AuthService);
  static const EMAIL = 'email';
  static const PASSWORD = 'password';
  final DBModule<String> db;
  final ServerAuthConfig config;
  final TokenModule token;
  final EmailModule email;
  final AuthAdminService admin;
  final AuthAdminModule authClient;
  AuthService(this.config, this.admin, ClientApplication app)
      : db = app.db<String>(),
        token = app.token(),
        email = app.email(),
        authClient = app.authAdmin();

  static bool checkPwd(String password, {@required String hashed}) {
    return DBCrypt().checkpw(password, hashed);
  }

  static String tokenTypeEmail(String email) => 'userEmail_$email';
  static String tokenTypePwd(String email) => 'userPwd_$email';

  Future<MessageSession> _createSession(User user, bool firstCreation) async {
    final allScopes = <String>[];
    final allRoles = <String>[];
    if (!firstCreation) {
      final roles = await authClient.getRolesForUser(user);
      allScopes.addAll(roles.expand((element) => element.scopes).toList());
      allRoles.addAll(roles.map((e) => e.id).toList());
    }
    user.clearPassword();
    return MessageSession()
      ..createdAt = Timestamp().now()
      ..displayName = user.displayName
      ..expireAt = DateTime.now().add(Duration(minutes: config.sessionDurationMinutes)).asTimestamp
      ..id = Uuid().v4()
      ..updatedAt = Timestamp().now()
      ..userId = user.id
      ..setUser(user)
      ..scopes.addAll(allScopes)
      ..roles.addAll(allRoles);
  }

  @override
  Future<User> createUserByEmail(ServiceCall call, CreateUserByEmailPayload request) async {
    logger.d(
      kLogKeys.authCreateByEmail(),
      {'email': request.email},
    );
    final user = User()
      ..email = request.email
      ..password = request.password;
    final res = await admin.createUser(call, user);
    final session = await _createSession(user, true);
    session
      ..roles.addAll(res.roles)
      ..scopes.addAll(res.scopes);
    call.setSession(session);
    return user;
  }

  @override
  Future<User> currentUser(ServiceCall call, AuthEmpty request) async {
    final session = call.getSession();
    final user = session.getUser();
    if (user.isEmpty) {
      throw AuthErrors.notAuthenticated;
    }
    return user.first;
  }

  Future<bool> _checkSelf(ServiceCall call, User request) async {
    final current = await currentUser(call, AuthEmpty());
    if (current.id == request.id) return true;
    throw AuthErrors.forbidden;
  }

  @override
  Future<AuthEmpty> deleteUser(ServiceCall call, User request) async {
    logger.d(
      kLogKeys.authDeleteUser(),
      {'email': request.email},
    );
    await _checkSelf(call, request);
    await admin.deleteUser(call, request);
    call.setSession(MessageSession());
    return AuthEmpty();
  }

  @override
  Future<User> loginInByEmail(ServiceCall call, LoginInByEmailPayload request) async {
    logger.d(
      kLogKeys.authLoginEmail(),
      {'email': request.email},
    );
    final user = await db.resource(config.userResource).fetchOneByQuery(
          db.query().eq(EMAIL, request.email.asJsonValue()),
        );
    if (user.isEmpty) {
      throw AuthErrors.badCredentials;
    }
    final u = db.toProto(user.value, User());
    if (!checkPwd(request.password, hashed: u.password)) {
      throw AuthErrors.badCredentials;
    }
    call.setSession(await _createSession(u, false));
    return u;
  }

  @override
  Future<AuthEmpty> logout(ServiceCall call, AuthEmpty request) async {
    call.setSession(MessageSession());
    return AuthEmpty();
  }

  @override
  Future<User> updateUser(ServiceCall call, User request) async {
    await _checkSelf(call, request);
    return admin.updateUser(call, UpdateUserPayload()..user = request);
  }

  @override
  Future<void> start() async {
    logger.i(
      kLogKeys.authStarting(),
      {'userResource': config.userResource},
    );
    await db.resource(config.userResource).createIndex(
      <QuerySort>[
        QuerySort()
          ..fieldName = EMAIL
          ..descending = false
      ],
      unique: true,
    );
  }

  @override
  Future<void> stop() async {
    logger.i(
      kLogKeys.authStopping(),
      {'userResource': config.userResource},
    );
  }

  @override
  Future<User> resetPasswordByMail(ServiceCall call, ResetPasswordPayload request) async {
    final res = await token.validateToken(request.token, tokenType: tokenTypePwd(request.email));
    if (!res) {
      throw AuthErrors.badResetToken;
    }
    final json = db.fromProto(
      User()..password = AuthAdminService.cryptPwd(request.password),
    );
    await db.resource(config.userResource).patch(db.query().eq(EMAIL, request.email.asJsonValue()), json);
    return loginInByEmail(
        call,
        LoginInByEmailPayload()
          ..email = request.email
          ..password = request.password);
  }

  @override
  Future<AuthEmpty> sendMailVerification(ServiceCall call, SendMailVerificationPayload request) async {
    //CREATE VERIFY TOKEN
    final tok = await token.createToken(tokenTypeEmail(request.email), Duration(minutes: config.tokenDurationMinutes));
    //SEND TOKEN BY EMAIL IF TEMPLATE
    if (config.hasVerifyEmailTemplate()) {
      final json = JsonObject().putString('_token', tok.value).putNum('_tokenExpireAt', tok.expireAt.asDateTime.millisecondsSinceEpoch);
      await email
          .create()
          .to(request.email)
          .i18Subject(config.verifyEmailSubject)
          .i18Html(config.verifyEmailTemplate, variables: json)
          .send();
    }
    return AuthEmpty();
  }

  @override
  Future<AuthEmpty> sendResetPasswordByMail(ServiceCall call, SendResetPasswordPayload request) async {
    //CREATE VERIFY TOKEN
    final tok = await token.createToken(tokenTypePwd(request.email), Duration(minutes: config.tokenDurationMinutes));
    //SEND TOKEN BY EMAIL IF TEMPLATE
    if (config.hasResetPwdTemplate()) {
      final json = JsonObject().putString('_token', tok.value).putNum('_tokenExpireAt', tok.expireAt.asDateTime.millisecondsSinceEpoch);
      await email.create().to(request.email).i18Subject(config.resetPwdSubject).i18Html(config.resetPwdTemplate, variables: json).send();
    }
    return AuthEmpty();
  }

  @override
  Future<AuthEmpty> verifyMail(ServiceCall call, VerifyMailPayload request) async {
    final res = await token.validateToken(request.token, tokenType: tokenTypeEmail(request.email));
    if (!res) {
      throw AuthErrors.badVerifyToken;
    }
    final session = call.getSession();
    final user = session.getUser();
    if (user.isNotEmpty) {
      user.value.verifiedEmail = true;
      session.setUser(user.value);
      call.setSession(session);
    }
    final json = db.fromJson(JsonObject()..putBool('verifiedEmail', true));
    await db.resource(config.userResource).patch(db.query().eq(EMAIL, request.email.asJsonValue()), json);
    return AuthEmpty();
  }
}

class SuperAdminInterceptor extends ChannelInterceptor {
  final DBModule<String> db;
  final ServerAuthConfig config;
  final String parsedPwd;
  SuperAdminInterceptor(ServerApplication application, this.config, ClientApplication app)
      : db = app.db<String>(),
        parsedPwd = StringUtils.toBase64(config.adminApiKey),
        super(ChannelInterceptorConfig());
  @override
  bool acceptType(InterceptorType type) => InterceptorType.Before == (type);
  @override
  Future<void> onIntercept(RouteContext context, MessageReader request, MessageWritter response, InterceptorType type) async {
    final header = await request.header();
    if (header.authorization == parsedPwd) {
      header.setSuperUser();
    }
  }
}
