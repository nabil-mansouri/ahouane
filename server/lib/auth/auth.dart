library ahouane.auth.server;

import 'dart:async';

import 'package:ahouane_common/utils/utils.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_client/db.dart';
import 'package:ahouane_server/clients/token.dart';
import 'package:ahouane_server/clients/email.dart';
import 'package:ahouane_client/auth.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:grpc/src/server/call.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'auth_service.dart';
part 'scope_service.dart';
part 'admin_service.dart';

extension MessageSessionExt on MessageSession {
  Optional<T> getCustom<T extends GeneratedMessage>(T example) {
    return Optional.ofNullable(custom
        .where((element) => element.canUnpackInto(example))
        .map((e) => e.unpackInto(example))
        .firstWhere((element) => true, orElse: () => null));
  }

  void setCustom<T extends GeneratedMessage>(T example) {
    custom.removeWhere((element) => element.canUnpackInto(example));
    custom.add(Any.pack(example));
  }

  Optional<User> getUser() {
    return getCustom<User>(User());
  }

  void setUser(User user) {
    setCustom(user);
  }
}

class AuthServerModule extends ServerModule {
  AuthServerModule._(ServerApplication application) : super(application) {
    MessageSession().addToTypeRegistry(User());
  }
  Future<AuthService> createAuthService(ServerAuthConfig config, Channel channel) async {
    final admin = AuthAdminService(config, application.client(channel));
    await channel.register(admin.route, GrpcChannelService(admin, config?.serviceConfig));
    final grpc = AuthService(config, admin, application.client(channel));
    await channel.register(grpc.route, GrpcChannelService(grpc, config?.serviceConfig));
    return grpc;
  }

  Future<SuperAdminInterceptor> createAuthSuperUserInterceptor(ServerAuthConfig config, Channel channel) async {
    final grpc = SuperAdminInterceptor(
      application,
      config.deepCopy()
        ..unfreeze()
        ..serviceConfig.priority = -10000000,
      application.client(channel),
    );
    await channel.register('*', grpc);
    return grpc;
  }

  Future<ScopeService> createScopeService(ServerScopeConfig config, Channel channel) async {
    final grpc = ScopeService(application, config, application.client(channel));
    await channel.register(grpc.route, GrpcChannelService(grpc, config?.serviceConfig));
    return grpc;
  }

  Future<ScopeInterceptor> createScopeInterceptor(String route, ServerScopeConfig config, Channel channel) async {
    final inter = ScopeInterceptor(application, config, application.client(channel));
    await channel.register(route, inter);
    return inter;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('auth', ServerAuthConfig());
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      for (final configOriginal in all) {
        final config = getAuthConfig(configOriginal.deepCopy());
        await createAuthService(config, channel);
        if (config.hasAdminApiKey()) {
          await createAuthSuperUserInterceptor(config, channel);
        }
      }
      final scopesList = application.configForKey('scopes', ServerScopeConfig(), registry: TypeRegistry([Role(), Scope()]));
      for (final scoOriginal in scopesList) {
        final sco = getScopeConfig(scoOriginal.deepCopy());
        await createScopeService(sco, channel);
        await createScopeInterceptor(sco.hasIntercept() ? sco.intercept : '*', sco, channel);
      }
    }
  }

  static ServerAuthConfig getAuthConfig(ServerAuthConfig config) {
    return ServerAuthConfig()
      ..mergeFromMessage(defaultAuthConfig())
      ..mergeFromMessage(config ?? ServerAuthConfig());
  }

  static ServerScopeConfig getScopeConfig(ServerScopeConfig config) {
    return ServerScopeConfig()
      ..mergeFromMessage(defaultScopeConfig())
      ..mergeFromMessage(config ?? ServerScopeConfig());
  }

  static ServerAuthConfig defaultAuthConfig() => ServerAuthConfig()
    ..userResource = 'users'
    ..sessionDurationMinutes = 60
    ..tokenDurationMinutes = 10 * 24 * 60; //10 days

  static ServerScopeConfig defaultScopeConfig() => ServerScopeConfig()
    ..roleResource = 'roles'
    ..userResource = 'users'
    ..scopeResource = 'scopes'
    ..defaultRoleIds.add('user')
    ..intercept = '*';
}

extension ApplicationAuth on ServerApplication {
  AuthServerModule auth() => createSingleton(AuthServerModule, () => AuthServerModule._(this));
}
