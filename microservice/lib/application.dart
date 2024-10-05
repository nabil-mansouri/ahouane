part of 'microservice.dart';

class MicroApplication {
  static final _instance = MicroApplication._();
  final params = JsonObject();
  MicroApplication._() {
    initLogFactory(name, writter: RemoteLogWritter());
  }
  factory MicroApplication.get() => _instance;
  String get name => params.getString('name', defaut: 'unknown');
  static Logger loggerByTag(String tag) => getLoggerFactory().loggerByTag(tag);
  static Logger loggerByType(Type type) =>
      loggerByTag(type.runtimeType.toString());
}
