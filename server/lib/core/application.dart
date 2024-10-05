part of 'core.dart';

class ApplicationContextKeys {
  const ApplicationContextKeys();
  ApplicationContextKey<LoggerFactory> defaultLoggerFactory() => ApplicationContextKey<LoggerFactory>('application.logger.factory');
  ApplicationContextKey<Channel> channel([String tenant]) => ApplicationContextKey<Channel>('channel.${tenant ?? 'default'}');
  ApplicationContextKey<MetricWriterDispatcher> defaultMetricWriter() =>
      const ApplicationContextKey<MetricWriterDispatcher>('defaultMetricWriter');
}

const kApplicationContextKeys = ApplicationContextKeys();

class ApplicationContextKey<BODY> extends ContextKey<BODY> {
  const ApplicationContextKey(String name) : super(name);
}

class ApplicationContext with ContextBehaviour<ApplicationContextKey> {
  final Storage<String> _storage;
  ApplicationContext(this._storage);
  factory ApplicationContext.inMemory() {
    return ApplicationContext(Storage.inMemory());
  }
  @override
  Storage<String> storage() => _storage;
  @override
  T put<T>(ApplicationContextKey<T> key, T value) => super.put(key, value);
  @override
  T getByKey<T>(ApplicationContextKey<T> key, {T Function() orValue}) => super.getByKey(key, orValue: orValue);
  @override
  T getOrSet<T>(ContextKey<T> key, T Function() generate) => super.getOrSet(key, generate);
}

abstract class Activable {
  Future<void> start();
  Future<void> stop();
}

class ServerModule {
  final ServerApplication application;
  ServerModule(this.application) {
    application.addModule(this);
  }
  void setup() {}
  Future<void> onStart(bool reloading, List<TenantConfig> multitenant) async {}
  Future<void> onStop(bool reloading, List<TenantConfig> multitenant) async {}
}

enum ServerApplicationState { Start, Stop, Reload }

class ServerApplication implements Activable {
  static final stateChanges = StreamController<ServerApplicationState>.broadcast(sync: true);

  static int _count = 0;
  static ServerApplication _instance;
  final String id;
  final ApplicationContext _context;
  final _modules = <ServerModule>{};
  final _singletons = <Type, dynamic>{};
  ServerApplicationState _state = ServerApplicationState.Stop;
  Map _config;
  final _shutdown = Completer<void>();
  ServerApplication._(this._config)
      : id = 'application-${_count++}',
        _context = ApplicationContext.inMemory();
  static Future<ServerApplication> yamlConfig(String path) async {
    final file = File(path);
    if (!await file.exists()) throw 'Missing file $path';
    final content = await file.readAsString();
    final yaml = loadYaml(content) as Map;
    return ServerApplication.instance(yaml);
  }

  factory ServerApplication.instance([Map config]) {
    _instance ??= ServerApplication._(config ?? {});
    return _instance;
  }
  bool get isStarted => _state == ServerApplicationState.Start;
  bool get isStopped => _state == ServerApplicationState.Stop;

  List<TenantConfig> _getTenants() {
    final config = mapConfigForKey('tenants', TenantConfig());
    final res = config.entries.map((e) => e.value..id = e.key).toList();
    if (res.isEmpty) {
      res.add(TenantConfig()..defaut = true);
    }
    return res;
  }

  Future<void> addModule(ServerModule module) async {
    _modules.add(module);
    if (_state == ServerApplicationState.Start) {
      await module.onStart(false, _getTenants());
    }
  }

  @override
  Future<void> start({bool reloading = false}) async {
    if (_state == ServerApplicationState.Start) return;
    //must be before starting module (module can add module on startup they should be started)
    _state = ServerApplicationState.Start;
    final tenants = _getTenants();
    final mods = List<ServerModule>.from(_modules);
    for (final mod in mods) {
      await mod.onStart(reloading, tenants);
    }
    stateChanges.add(ServerApplicationState.Start);
  }

  @override
  Future<void> stop({bool reloading = false}) async {
    if (_state == ServerApplicationState.Stop) return;
    final tenants = _getTenants();
    final futures = _modules.map((e) => e.onStop(reloading, tenants)).toList();
    await Future.wait(futures);
    stateChanges.add(ServerApplicationState.Stop);
    _state = ServerApplicationState.Stop;
  }

  Future<void> get onShutdown => _shutdown.future;

  Future<void> shutdown() async {
    await stop();
    _shutdown.complete();
    _singletons.clear();
    _instance = null;
  }

  Future<void> reload(Map config) async {
    if (_state == ServerApplicationState.Reload) return;
    _state = ServerApplicationState.Reload;
    stateChanges.add(ServerApplicationState.Reload);
    _config = config;
    await stop(reloading: true);
    await start(reloading: true);
  }

  List<T> configsFor<T extends GeneratedMessage>(T example) {
    final key = example.info_.qualifiedMessageName;
    return configForKey(key, example);
  }

  List<T> configForKey<T extends GeneratedMessage>(String key, T example, {TypeRegistry registry}) {
    if (_config.containsKey(key)) {
      T parse(YamlMap object) {
        final conf = example.deepCopy()..mergeFromProto3Json(object.toMap(), ignoreUnknownFields: true, typeRegistry: registry);
        return conf;
      }

      final value = _config[key];
      if (value is List) {
        return value.map((e) => e as YamlMap).map(parse).toList();
      } else if (value != null) {
        return [parse(value)];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Map<String, T> mapConfigForKey<T extends GeneratedMessage>(String key, T example, {TypeRegistry registry}) {
    if (_config.containsKey(key)) {
      T parse(YamlMap object) {
        final conf = example.deepCopy()..mergeFromProto3Json(object.toMap(), ignoreUnknownFields: true, typeRegistry: registry);
        return conf;
      }

      final value = _config[key];
      if (value is Map) {
        final res = <String, T>{};
        for (final entry in value.entries) {
          res[entry.key] = parse(entry.value);
        }
        return res;
      } else {
        return {};
      }
    } else {
      return {};
    }
  }

  T createSingleton<T>(Type type, T Function() creator) {
    if (_singletons.containsKey(type)) {
      return _singletons[type];
    } else {
      _singletons[type] = creator();
      return _singletons[type];
    }
  }

  Map config() => _config;

  ChannelModule channel() => createSingleton(ChannelModule, () => ChannelModule._(this));
  ApplicationContext context() => _context;
  LoggerModule logger() => createSingleton(LoggerModule, () => LoggerModule._(this));
  RouterModule router() => createSingleton(RouterModule, () => RouterModule._(this));
  StorageModule appStorage() => createSingleton(StorageModule, () => StorageModule._(this));
  GrpcModule grpc() => createSingleton(GrpcModule, () => GrpcModule(this));
  ClientApplication client(Channel channel) => ServerClientApplication(this, channel);
}

class ServerClientApplication implements ClientApplication {
  final ServerApplication server;
  final Channel channel;
  @override
  final session = <String, String>{};
  ServerClientApplication(this.server, this.channel);
  @override
  ClientApplicationConfig get config => ClientApplicationConfig();

  @override
  grpcchannel.ClientChannel createChannel() => ServerGrpcClientChannel(this, channel);

  @override
  Uri get baseUri => throw UnimplementedError();

  @override
  bool isError(dynamic e, String error) {
    return getError(e) == error;
  }

  @override
  String getError(dynamic e) {
    if (e is String) {
      return e;
    } else if (e is GrpcError) {
      return e.message;
    } else {
      return 'unknown';
    }
  }
}

mixin ServerApplicationAware {
  ServerApplication application() => ServerApplication.instance();

  ApplicationContext applicationContext() => application().context();
}
