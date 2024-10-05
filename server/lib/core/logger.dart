part of 'core.dart';

//=== Extensions and module
class LoggerModule extends ServerModule {
  LoggerModule._(ServerApplication application) : super(application);

  LoggerFactory defaultLoggerFactory() =>
      application.context().getOrSet<LoggerFactory>(
          kApplicationContextKeys.defaultLoggerFactory(),
          () => getLoggerFactory());

  Logger createByType(Type type) => defaultLoggerFactory().loggerByType(type);
  Logger createByTag(String type) => defaultLoggerFactory().loggerByTag(type);

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    initLogFactory(application.id, writter: ConsoleLogWritter.defaut());
    final logger = defaultLoggerFactory().loggerByType(ServerApplication);
    if (reloading == true) {
      logger.i(kLogKeys.appReloaded(), {});
    } else {
      logger.i(kLogKeys.appStart(), {});
    }
  }

  @override
  Future<void> onStop(bool reloading, List<TenantConfig> tenants) async {
    final logger = defaultLoggerFactory().loggerByType(ServerApplication);
    logger.i(kLogKeys.appStop(), {});
  }
}
