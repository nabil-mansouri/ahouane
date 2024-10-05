library ahouane.token.client;

import 'package:meta/meta.dart';
import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/token.pbgrpc.dart';
export 'package:ahouane_common/generated/token.pbgrpc.dart';

class TokenModule extends ClientModule {
  final TokenServiceClient _service;
  TokenModule(ClientApplication app)
      : _service = TokenServiceClient(app.createChannel()),
        super(app);

  Future<Token> createToken(String tokenType, Duration duration) async {
    final payload = CreateTokenPayload()
      ..expireAt = DateTime.now().add(duration).asTimestamp
      ..tokenType = tokenType;
    return _service.create(payload);
  }

  Future<bool> validateToken(String tokenValue,
      {@required String tokenType}) async {
    final payload = TokenPayload()
      ..value = tokenValue
      ..tokenType = tokenType;
    final res = await _service.validateAndRemove(payload);
    return res.success;
  }
}

extension ClientApplicationToken on ClientApplication {
  TokenModule token() => TokenModule(this);
}
