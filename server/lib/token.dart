library ahouane.token.server;

import 'package:ahouane_client/auth.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_client/db.dart';
import 'package:ahouane_common/generated/token.pbgrpc.dart';
import 'package:secure_random/secure_random.dart';
export 'package:ahouane_common/generated/token.pbgrpc.dart';

class TokenService extends TokenServiceBase with GrpcService {
  static const VALUE = 'value';
  static const TOKENTYPE = 'tokenType';
  static const EXPIREAT = 'expireAt';
  final ServerApplication application;
  final DBModule<String> db;
  final TokenConfig config;
  final secureRandom = SecureRandom();
  final logger = ServerApplication.instance()
      .logger()
      .defaultLoggerFactory()
      .loggerByType(TokenService);

  TokenService(this.application, this.config, ClientApplication app)
      : db = app.db<String>();

  @override
  Future<void> start() async {
    logger.i(kLogKeys.tokenStarting(), {'ressource': config.ressource});
    try {
      await db.resource(config.ressource).createIndex(
        <QuerySort>[
          QuerySort()
            ..fieldName = VALUE
            ..descending = false,
          QuerySort()
            ..fieldName = TOKENTYPE
            ..descending = false
        ],
        unique: true,
      );
      await db.resource(config.ressource).createIndex(
        <QuerySort>[
          QuerySort()
            ..fieldName = EXPIREAT
            ..descending = false,
        ],
        expireAfterSeconds: 0,
      );
    } catch (e) {
      logger.e(kLogKeys.tokenStartingFail(), {'ressource': config.ressource});
      rethrow;
    }
  }

  @override
  Future<void> stop() async {
    logger.i(kLogKeys.tokenStop(), {'ressource': config.ressource});
  }

  @override
  Future<Token> create(ServiceCall call, CreateTokenPayload request) async {
    final tokenValue = secureRandom.nextString(length: config.tokenLength);
    final token = Token()
      ..expireAt = request.expireAt
      ..tokenType = request.tokenType
      ..value = tokenValue;
    final query = db.query().eq(TOKENTYPE, request.tokenType.asJsonValue());
    await db
        .resource(config.ressource)
        .update(query, db.fromProto(token), upsert: true);
    return token;
  }

  @override
  Future<TokenValidation> validate(
      ServiceCall call, TokenPayload request) async {
    final res = await db.resource(config.ressource).fetchOneByQuery(db
        .query()
        .eq(TOKENTYPE, request.tokenType.asJsonValue())
        .eq(VALUE, request.value.asJsonValue()));
    return TokenValidation()..success = res.isPresent;
  }

  @override
  Future<TokenEmpty> remove(ServiceCall call, TokenPayload request) async {
    await db.resource(config.ressource).delete(db
        .query()
        .eq(TOKENTYPE, request.tokenType.asJsonValue())
        .eq(VALUE, request.value.asJsonValue()));
    return TokenEmpty();
  }

  @override
  Future<TokenValidation> validateAndRemove(
      ServiceCall call, TokenPayload request) async {
    final val = await validate(call, request);
    await remove(call, request);
    return val;
  }
}

class TokenServerModule extends ServerModule {
  TokenServerModule._(ServerApplication application) : super(application);
  Future<TokenService> create(Channel channel, [TokenConfig config]) async {
    final grpc = TokenService(application, config, application.client(channel));
    await channel.register(grpc.route, GrpcChannelService(grpc, null));
    return grpc;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('tokens', TokenConfig());
    for (final tenant in tenants) {
      final config = getConfig(all.isEmpty ? null : all.first);
      final channel = application.channel().defaultChannel(tenant);
      await create(channel, config);
    }
  }

  static TokenConfig defaultConfig() => TokenConfig()
    ..tokenLength = 32
    ..ressource = 'tokens';

  static TokenConfig getConfig(TokenConfig config) {
    return TokenConfig()
      ..mergeFromMessage(defaultConfig())
      ..mergeFromMessage(config ?? TokenConfig());
  }
}

extension ApplicationToken on ServerApplication {
  TokenServerModule token() =>
      createSingleton(TokenServerModule, () => TokenServerModule._(this));
}

extension TokenLogKeys on LogKeys {
  LogKey tokenStarting() =>
      const LogKey('tokenStart', description: 'Token service starting');
  LogKey tokenStop() =>
      const LogKey('tokenStop', description: 'Token service stopping');
  LogKey tokenStartingFail() => const LogKey('tokenStartingFail',
      description: 'Token service start failed');
}
