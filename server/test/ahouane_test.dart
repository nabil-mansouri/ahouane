import 'dart:io';

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_server/server.dart';
import 'package:ahouane_common/http/http.dart';
import 'package:ahouane_client/db.dart';
import 'package:test/test.dart';

import 'auth.dart';
import 'db.dart';
import 'email.dart';
import 'storage.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

import 'token.dart';

void run(String suffix, String host, bool withTenant) {
  final client = ClientApplication(ClientApplicationConfig()
    ..host = host
    ..port = 8084);
  final clientAdmin = ClientApplication(ClientApplicationConfig()
    ..host = host
    ..port = 8084
    ..adminApiKey = 'nabil');
  final path = p.join(Directory.current.absolute.path, 'test', '_config.yaml');
  final file = File(path);

  group('[Ahoune]$suffix', () {
    ServerApplication app;
    setUpAll(() async {
      if (!await file.exists()) throw 'Missing file $path';
      final content = await file.readAsString();
      final yaml = {};
      yaml.addAll(loadYaml(content));
      if (!withTenant) {
        yaml.remove('tenants');
      }
      app = await serverSetupFromMap(yaml);
      await app.start();
    });
    tearDownAll(() async {
      await app?.shutdown();
    });
    auth(client,
        clientAdmin: clientAdmin,
        email: 'nabil@test.com',
        password: 'password');
    db(
      client,
      clientAdmin: clientAdmin,
      jsonExample: JsonObject()
        ..putArray(
            'users',
            JsonArray()
              ..addBool(true)
              ..addDouble(2.0)
              ..addInt(2)
              ..addNum(1)
              ..addString('string')
              ..addArray(JsonArray()..addBool(true))
              ..addJson(JsonObject().putBool('bool', true)))
        ..putBool('bool', true)
        ..putDouble('double', 2.0)
        ..putInt('int', 1)
        ..putJson('json', JsonObject().putBool('bool', true))
        ..putNum('num', 1)
        ..putString('string', 'value'),
      patch: JsonObject()
        ..putInt('int', 200)
        ..putString('string', 'newvalue'),
      resource: 'test_json',
      update: JsonObject()
        ..putBool('bool2', true)
        ..putDouble('double', 2.0)
        ..putInt('int2', 1)
        ..putJson('json2', JsonObject().putBool('bool', true))
        ..putNum('num2', 1)
        ..putString('string2', 'value'),
      where: client
          .db()
          .query()
          .where(client.db().query().eq('double', 2.0.asJsonValue())),
    );
    email(client, clientAdmin: clientAdmin, host: 'localhost', port: 9999);
    storage(client,
        appAdmin: clientAdmin,
        content: ('nabilmansouri...nabilmansouri'),
        newContent: ('mansourinabil...mansourinabil..mansourinabil'));
    token(
      client,
      clientAdmin: clientAdmin,
    );
  });
}

void main() async {
  run('[NoTenant]', 'localhost', false);
  run('[MultiTenant]', 'client1.localhost', true);
}
