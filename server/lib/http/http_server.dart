part of 'http.dart';

enum HttpServerWrapperState { Started, Stopped }

class HttpServerWrapper with ServerApplicationAware implements Activable {
  final String id;
  final logger = ServerApplication.instance()
      .logger()
      .defaultLoggerFactory()
      .loggerByType(HttpServerWrapper);
  final _finish = Completer();
  final HttpServerConfig config;
  final ChannelDispatcher channel;
  HttpServer _server;
  HttpServerWrapperState _state = HttpServerWrapperState.Stopped;
  HttpServerWrapper(this.config, this.channel, {String id})
      : id = id ?? Uuid().v4();
  HttpServerWrapperState get state => _state;
  @override
  Future<HttpServerWrapper> start() async {
    logger.i(
      kLogKeys.httpServerStarting(),
      {'host': config.host, 'port': config.port, 'serverId': id},
    );
    if (config.secure) {
      var serverContext = SecurityContext();
      serverContext.useCertificateChain(config.certificatePath);
      serverContext.usePrivateKey(config.privateKeyPath,
          password: config.privateKeyPassword);
      _server = await HttpServer.bindSecure(
        config.host,
        config.port,
        serverContext,
        shared: true,
      );
    } else {
      _server = await HttpServer.bind(
        config.host,
        config.port,
        shared: true,
      );
    }
    _state = HttpServerWrapperState.Started;
    logger.i(kLogKeys.httpServerStart(), {'serverId': id});
    _server.listen((request) async {
      final start = DateTime.now();
      final requestId = Uuid().v4();
      logger.i(
        kLogKeys.httpRequest(),
        {
          'path': request.uri.path,
          'method': request.method,
          'serverId': id,
          'requestId': requestId
        },
      );
      final response = channel.send(
          request,
          request.uri.path,
          createHttpReader(
            request,
            config,
          ));
      if (response.isPresent) {
        final res = await response.value;
        processHttpWritter(request, res, config, start);
        logger.i(
          kLogKeys.httpResponse(),
          {
            'path': request.uri.path,
            'method': request.method,
            'status': request.response.statusCode,
            'serverId': id,
            'requestId': requestId,
            'durationMs': DateTime.now().difference(start).inMilliseconds
          },
        );
      } else {
        logger.i(
          kLogKeys.httpNoResponse(),
          {
            'path': request.uri.path,
            'method': request.method,
            'status': request.response.statusCode,
            'serverId': id,
            'requestId': requestId,
            'durationMs': DateTime.now().difference(start).inMilliseconds
          },
        );
      }
    }, onDone: () {
      _finish.complete();
      logger.i(kLogKeys.httpServerStop(), {'serverId': id});
    }, onError: (e, stacktrace) {
      logger.e(kLogKeys.httpServerError(), {},
          error: e, stacktrace: stacktrace);
    });
    return this;
  }

  Future<void> get onFinish => _finish.future;
  @override
  Future<HttpServerWrapper> stop() async {
    logger.i(
      kLogKeys.httpServerStop(),
      {'host': config.host, 'port': config.port, 'id': id},
    );
    await _server?.close();
    return this;
  }

  static HttpServerConfig httpOnLocalhost({
    int port = 8080,
    InternetAddress address,
  }) {
    return HttpServerConfig()
      ..port = port
      ..host = address?.address ?? InternetAddress.loopbackIPv4.address
      ..certificatePath = null
      ..privateKeyPassword = null
      ..privateKeyPath = null
      ..secure = false;
  }

  static HttpServerConfig httpsOnAny(
    String certificate,
    String privateKey,
    String password, {
    int port = 443,
    InternetAddress address,
  }) {
    return HttpServerConfig()
      ..port = port
      ..host = address?.address ?? InternetAddress.anyIPv4.address
      ..certificatePath = certificate
      ..privateKeyPassword = password
      ..privateKeyPath = privateKey
      ..secure = true;
  }
}

class ChannelDispatcher {
  final ServerApplication application;
  final List<TenantConfig> tenants;
  final vhosts = <String, TenantConfig>{};
  final defauts = <TenantConfig>[];
  ChannelDispatcher(this.application, this.tenants) {
    for (final tenant in tenants) {
      if (tenant.defaut) {
        defauts.add(tenant);
      }
      if (tenant.hasVhost()) {
        vhosts[tenant.vhost] = tenant;
      }
    }
  }
  Optional<FutureMessageReader> send(
      HttpRequest request, String uri, MessageReader read) {
    final host = request.headers.host;
    if (vhosts.containsKey(host)) {
      final res =
          application.channel().defaultChannel(vhosts[host]).send(uri, read);
      return Optional.of(res);
    } else if (defauts.isNotEmpty) {
      final res =
          application.channel().defaultChannel(defauts.first).send(uri, read);
      return Optional.of(res);
    } else {
      request.response
        ..statusCode = 404
        ..reasonPhrase = 'Host not found';
      request.response.close();
      return Optional.empty();
    }
  }
}
