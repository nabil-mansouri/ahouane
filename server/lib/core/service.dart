part of 'core.dart';

abstract class ChannelService extends Endpoint with ServerApplicationAware {
  final ChannelServiceConfig config;
  ChannelService(ChannelServiceConfig config, {String id})
      : config = config ?? ChannelServiceConfig(),
        super(kEndpointTypes.service(), id: id, priority: config.priority);
  bool get sequential => config.sequential;
  @nonVirtual
  @override
  Future<void> onReceive(RouteContext context) {
    return onRequest(context, context.input, context.output);
  }

  Future<void> onRequest(
      RouteContext context, MessageReader request, MessageWritter response);
}
