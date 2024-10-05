library ahouane.storage.server;

import 'package:ahouane_client/http/http.dart';
import 'package:universal_io/io.dart';
import 'package:ahouane_common/generated/http.pb.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_client/storage.dart';
import 'package:ahouane_client/db.dart';
import 'package:ahouane_common/utils/utils.dart';
import 'package:ahouane_server/http/http.dart';
import 'package:grpc/src/server/call.dart';
import 'package:path/path.dart' as p;
part 'storage_service.dart';
part 'storage_interceptor.dart';

class StorageHttpService extends HttpChannelService {
  StorageServiceClient service;
  StorageHttpService(ServerApplication app, HttpServiceConfig httpConfig, ClientApplication appC)
      : service = StorageServiceClient(appC.createChannel(), options: CallOptionsDefault.withSession(null)),
        super(httpConfig);
  @override
  Future<void> get(RouteContext context, MicroHttpRequest request, MicroHttpResponse response) async {
    final id = request.pathSegments[1];
    final path = StorageClientModule.pathFromId(id);
    if (path.isEmpty) throw NotFoundException('storage.notfound');
    final stream = service.fetch(path.value, options: CallOptionsDefault.withSession(await request.session));
    await for (final chunk in stream) {
      await response.buffer(chunk.buffer);
    }
  }
}

class StorageServerModule extends ServerModule {
  StorageServerModule._(ServerApplication application) : super(application);
  Future<StorageService> create(ServerStorageConfig config, Channel channel) async {
    final grpc = StorageService(application, config, application.client(channel));
    final service = GrpcChannelService(grpc, config?.serviceConfig);
    service.interceptors.add(StorageInterceptor(application, config, application.client(channel)));
    await channel.register(grpc.route, service);
    await channel.register(
        grpc.route,
        StorageHttpService(
          application,
          HttpServiceConfig()..serviceConfig ??= config?.serviceConfig,
          application.client(channel),
        ));
    return grpc;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('storage', ServerStorageConfig());
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      for (final configOriginal in all) {
        final config = getConfig(configOriginal.deepCopy());
        config.directory = tenant.defaut ? config.directory : p.join(config.directory, tenant.id);
        await create(config, channel);
      }
    }
  }

  static ServerStorageConfig getConfig(ServerStorageConfig config) {
    return ServerStorageConfig()
      ..mergeFromMessage(defaultConfig())
      ..mergeFromMessage(config ?? ServerStorageConfig());
  }

  static ServerStorageConfig defaultConfig() => ServerStorageConfig()
    ..directory = 'storage'
    ..rightResource = 'storage_rights'
    ..allowDotFiles = false
    ..maxPathDepth = 15
    ..forbidExtentions.addAll(<String>['exe', 'php', 'java', 'py', 'dart']);
}

extension ApplicationStorage on ServerApplication {
  StorageServerModule storage() => createSingleton(StorageServerModule, () => StorageServerModule._(this));
}
