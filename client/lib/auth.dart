library ahouane.auth.client;

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/scope.pbgrpc.dart';
import 'package:optional/optional.dart';
import 'package:meta/meta.dart';
import 'package:ahouane_common/generated/auth.pbgrpc.dart';
import 'package:ahouane_common/generated/auth.pb.dart';
export 'package:ahouane_common/generated/auth.pbgrpc.dart';
export 'package:ahouane_common/generated/auth.pb.dart';
export 'package:ahouane_common/generated/scope.pbgrpc.dart';
export 'package:ahouane_client/core/core.dart';

class AuthErrors {
  static const notAuthenticated = 'auth.errors.notAuthenticated';
  static const badCredentials = 'auth.errors.badCredentials';
  static const badResetToken = 'auth.errors.badResetToken';
  static const badVerifyToken = 'auth.errors.badVerifyToken';
  static const forbidden = 'auth.errors.forbidden';
  static const unauthorized = 'auth.errors.unauthorized';
}

class AuthModule extends ClientModule {
  final AuthServiceClient _service;
  AuthModule(ClientApplication app)
      : _service = AuthServiceClient(app.createChannel()),
        super(app);

  Future<void> sendResetPasswordByMail(String email) async {
    await _service.sendResetPasswordByMail(SendResetPasswordPayload()..email = email);
  }

  Future<void> sendMailVerification(String email) async {
    await _service.sendMailVerification(SendMailVerificationPayload()..email = email);
  }

  Future<void> verifyMail(String token, String email) async {
    await _service.verifyMail(VerifyMailPayload()
      ..token = token
      ..email = email);
  }

  Future<User> resetPasswordByMail(String email, {@required String password, @required String token}) async {
    final res = await _service.resetPasswordByMail(ResetPasswordPayload()
      ..token = token
      ..password = password
      ..email = email);
    return res;
  }

  Future<User> createUserByEmail(String email, String password) async {
    final res = await _service.createUserByEmail(CreateUserByEmailPayload()
      ..email = email
      ..password = password);
    return res;
  }

  Future<Optional<User>> currentUser() async {
    try {
      final res = await _service.currentUser(AuthEmpty());
      res.unfreeze(); //avoid read only
      return Optional.of(res);
    } catch (e) {
      return Optional.empty();
    }
  }

  Future<void> deleteUser(User user) => _service.deleteUser(user);
  Future<User> loginInByEmail(String email, String password) => _service.loginInByEmail(LoginInByEmailPayload()
    ..email = email
    ..password = password);
  Future<User> updateUser(User user) => _service.updateUser(user);
  Future<void> logout() => _service.logout(AuthEmpty());

  static Scope buildScope(String name, {@required String service, String method}) {
    final id = '$service.${method ?? ''}';
    return Scope()
      ..name = name
      ..id = id;
  }
}

class AuthAdminModule extends ClientModule {
  final AuthAdminServiceClient _service;
  final ScopeServiceClient _scope;
  AuthAdminModule(ClientApplication app)
      : _service = AuthAdminServiceClient(app.createChannel()),
        _scope = ScopeServiceClient(app.createChannel()),
        super(app);

  Future<Scope> createScope(String name, {@required String service, String method}) async {
    final scope = buildScope(name, service: service, method: method);
    await _scope.createScope(scope);
    return scope;
  }

  Future<Role> createRole(String name, {@required List<String> scopes}) async {
    final role = Role()
      ..name = name
      ..scopes.addAll(scopes);
    return _scope.createRole(role);
  }

  Future<void> attachScope(String scopeId, {@required String roleId}) async {
    await _scope.attachScope(AttachScopePayload()
      ..roleId = roleId
      ..scopeId = scopeId);
  }

  Future<void> detachScope(String scopeId, {@required String roleId}) async {
    await _scope.detachScope(AttachScopePayload()
      ..roleId = roleId
      ..scopeId = scopeId);
  }

  Future<void> attachRole(String roleId, {@required String userId}) async {
    await _scope.attachRole(AttachRolePayload()
      ..roleId = roleId
      ..userId = userId);
  }

  Future<void> detachRole(String roleId, {@required String userId}) async {
    await _scope.detachRole(AttachRolePayload()
      ..roleId = roleId
      ..userId = userId);
  }

  Future<List<Role>> affectDefaultRoles(User user) async {
    final res = await _scope.affectDefaultRoles(user);
    return res.roles;
  }

  Future<List<String>> getScopesForUser(User user) async {
    final res = await _scope.getRoles(ScopesPayload()..userId = user.id);
    return res.roles.expand((element) => element.scopes).toList();
  }

  Future<List<Role>> getRolesForUser(User user) async {
    final res = await _scope.getRoles(ScopesPayload()..userId = user.id);
    return res.roles;
  }

  Stream<User> listUsers() {
    return _service.listUsers(AuthEmpty());
  }

  Future<CreateUserResponse> createUser(User user) {
    return _service.createUser(user);
  }

  Future<void> deleteUser(User user) => _service.deleteUser(user);

  Future<User> updateUser(User user, {bool withPassword = false}) {
    return _service.updateUser(UpdateUserPayload()
      ..user = user
      ..newPassword = withPassword ? user.password : null);
  }

  Future<User> blockUser(User user) {
    return _service.blockUser(user);
  }

  Future<User> unblockUser(User user) {
    return _service.unblockUser(user);
  }

  static Scope buildScope(String name, {@required String service, String method}) {
    final id = '$service.${method ?? ''}';
    return Scope()
      ..name = name
      ..id = id;
  }
}

extension UserCustoms on User {
  JsonObject getDetails() {
    return JsonObjectProxy(custom);
  }

  void setDetails(JsonObject details) {
    custom = details.toProto().object;
  }
}

extension ClientApplicationAuth on ClientApplication {
  AuthModule auth() => AuthModule(this);
  AuthAdminModule authAdmin() => AuthAdminModule(this);
}
