import 'package:universal_io/io.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_server/mongo/mongo.dart';
import 'package:ahouane_server/http/http.dart';
import 'package:ahouane_server/storage/storage.dart';
import 'package:ahouane_server/auth/auth.dart';
import 'package:ahouane_server/email.dart';
import 'package:ahouane_server/token.dart';
import 'package:ahouane_server/i18.dart';
import 'package:ahouane_server/validation/validation.dart';
import 'package:path/path.dart' as p;

Future<ServerApplication> serverSetup(String configFile) async {
  final app = await ServerApplication.yamlConfig(configFile);
  return _setup(app);
}

Future<ServerApplication> serverSetupFromMap(Map configFile) async {
  final app = ServerApplication.instance(configFile);
  return _setup(app);
}

Future<ServerApplication> _setup(ServerApplication app) async {
  app.mongodb().setup();
  app.http().setup();
  app.storage().setup();
  app.auth().setup();
  app.token().setup();
  app.grpc().setup();
  app.email().setup();
  app.i18().setup();
  app.validation().setup();
  return app;
}

void main(List<String> args) async {
  final path = p.join(Directory.current.absolute.path, 'config.yml');
  final app = await serverSetup(path);
  print('starting...');
  await app.start();
  await app.onShutdown;
  print('shutting down');
}
