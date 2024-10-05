import 'dart:async';
import 'dart:convert';

import 'package:universal_io/io.dart';
import 'package:ahouane_client/http/http.dart';
import 'package:ahouane_common/generated/http.pb.dart';
import 'package:ahouane_common/http/http.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:path/path.dart' as p;
import 'package:ahouane_client/storage.dart';
import 'package:uuid/uuid.dart';

part 'http_server.dart';
part 'request.dart';
part 'logkeys.dart';
part 'service.dart';
part 'reader.dart';
part 'writter.dart';
part 'response.dart';
part 'exceptions.dart';
part 'interceptor.dart';

extension ApplicationHttp on ServerApplication {
  HttpModule http() => createSingleton(HttpModule, () => HttpModule._(this));
}

class HttpModule extends ServerModule {
  final servers = <HttpServerWrapper>[];

  HttpModule._(ServerApplication application) : super(application);
  HttpModule initExceptionInterceptors(Channel channel) {
    channel.register('*', HttpExceptionInterceptor());
    return this;
  }

  HttpServerWrapper createServer(
      HttpServerConfig config, ChannelDispatcher dispatcher) {
    final s = HttpServerWrapper(config, dispatcher);
    servers.add(s);
    return s;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('http', HttpServerConfig());
    for (final config in all) {
      final server =
          createServer(config, ChannelDispatcher(application, tenants));
      await server.start();
    }
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      initExceptionInterceptors(channel);
    }
  }

  @override
  Future<void> onStop(bool reloading, List<TenantConfig> tenants) async {
    for (final s in servers) {
      await s.stop();
    }
  }
}
