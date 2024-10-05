library ahouane.i18.client;

import 'package:interpolation/interpolation.dart';
import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/i18.pbgrpc.dart';
export 'package:ahouane_common/generated/i18.pbgrpc.dart';

class I18Module extends ClientModule {
  final interpolation = Interpolation();
  final I18ServiceClient _service;
  final _caches = <String, I18Values>{};
  I18Module(ClientApplication app)
      : _service = I18ServiceClient(app.createChannel()),
        super(app);
  Future<String> valueForKey(String key,
      {String forceLang, JsonObject variables}) async {
    final cacheKey = '$forceLang';
    if (!_caches.containsKey(cacheKey)) {
      _caches[cacheKey] =
          await _service.getKeys(I18KeysPayload()..forceLang = forceLang);
    }
    if (_caches[cacheKey].values.containsKey(key)) {
      final value = _caches[cacheKey].values[key];
      if (variables?.isNotEmpty == true) {
        return interpolation.eval(value, variables.asRecursiveMap());
      } else {
        return value;
      }
    } else {
      return key;
    }
  }

  Future<String> templateForKey(
    String key, {
    String forceLang,
    JsonObject variables,
    JsonObjectValue jsonVariables,
  }) async {
    try {
      final payload = I18Key()
        ..key = key
        ..forceLang = forceLang
        ..variables = jsonVariables ?? variables?.toProto()?.object;
      final res = await _service.getTemplate(payload);
      return res.value;
    } catch (e) {
      return key;
    }
  }
}

extension ClientApplicationI18 on ClientApplication {
  I18Module i18() => I18Module(this);
}
