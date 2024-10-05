import 'package:ahouane_client/auth.dart';
import 'package:ahouane_common/generated/google/protobuf/wrappers.pb.dart';
import 'package:ahouane_common/generated/validate.pbgrpc.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_common/validation/validation.dart';
import 'package:ahouane_common/introspection/introspection.dart';

extension ValidateLogKeys on LogKeys {
  LogKey validationStop() => LogKey('validationStop', description: 'Validation stopping');
  LogKey validationStart() => LogKey('validationStart', description: 'Validation starting');
}

class AHValidationService extends ValidationServiceBase with GrpcService {
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(ValidationServiceBase);
  final ClientApplication app;
  AHValidationService(this.app);

  @override
  Future<BoolValue> isValid(ServiceCall call, ValidationRequest request) async {
    final found = Introspection.instance.anyToMessage(request.body);
    if (found.isPresent) {
      final tmp = found.value.validate();
      return BoolValue(value: tmp.hasErrors());
    } else {
      //could not found message for any type
      return BoolValue(value: false);
    }
  }

  @override
  Future<ValidationResult> validate(ServiceCall call, ValidationRequest request) async {
    final found = Introspection.instance.anyToMessage(request.body);
    if (found.isPresent) {
      final tmp = found.value.validate(
        recursive: request.hasRecursive() ? request.recursive : true,
        stopFirst: request.hasStopFirst() ? request.stopFirst : false,
        customRules: request.customRules.isNotEmpty ? request.customRules : null,
      );
      return tmp;
    } else {
      final tmp = ValidationResult();
      tmp.add(ValidationErrors.typeNotFound);
      return tmp;
    }
  }

  @override
  Future<void> start() async {
    logger.i(
      kLogKeys.validationStart(),
      {},
    );
  }

  @override
  Future<void> stop() async {
    logger.i(
      kLogKeys.validationStop(),
      {},
    );
  }
}

class ValidationInterceptor extends ChannelInterceptor {
  final ServerValidationConfig config;
  ValidationInterceptor(ServerApplication application, this.config) : super(ChannelInterceptorConfig());
  @override
  bool acceptType(InterceptorType type) => InterceptorType.Before == (type);
  @override
  Future<void> onIntercept(RouteContext context, MessageReader request, MessageWritter response, InterceptorType type) async {
    final messages = request.body().where((event) => event.hasObject()).map((event) {
      return Introspection.instance.anyToMessage(event.object);
    });
    await for (final message in messages) {
      if (message.isPresent) {
        final res = message.value.validate(
          recursive: config.hasRecursive() ? config.recursive : true,
          stopFirst: config.hasStopFirst() ? config.stopFirst : false,
        );
        if (res.hasErrors()) {
          response.addError(ValidationErrors.invalid, details: Any.pack(res)).end();
          context.stop();
          return;
        }
      }
    }
  }
}

class ValidationErrors {
  static final typeNotFound = 'validation.errors.type.notfound';
  static final invalid = 'validation.errors.invalid';
}

class ValidationServerModule extends ServerModule {
  ValidationServerModule._(ServerApplication application) : super(application);
  Future<AHValidationService> createService(Channel channel) async {
    final vald = AHValidationService(application.client(channel));
    await channel.register(vald.route, GrpcChannelService(vald, ChannelServiceConfig()));
    final configs = application.configForKey('validation', ServerValidationConfig());
    for (final config in configs) {
      await channel.register(config.hasIntercept() ? config.intercept : '*', ValidationInterceptor(application, config));
    }
    return vald;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      await createService(channel);
    }
  }
}

extension ApplicationValid on ServerApplication {
  ValidationServerModule validation() => createSingleton(ValidationServerModule, () => ValidationServerModule._(this));
}
