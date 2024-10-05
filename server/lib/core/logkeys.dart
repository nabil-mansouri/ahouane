part of 'core.dart';

extension CoreLogKeys on LogKeys {
  LogKey appStart() =>
      const LogKey('appstart', description: 'Application started');
  LogKey appStop() =>
      const LogKey('appstop', description: 'Application stoped');
  LogKey appReloaded() =>
      const LogKey('appreload', description: 'Application reloaded');
  LogKey serviceStderr(String desc) =>
      LogKey('serviceStderr', description: desc);
  LogKey remoteEventParse() => const LogKey('remoteEventParse',
      description: 'failed to parse remote event');
  LogKey remoteLogParse() =>
      const LogKey('remoteLogParse', description: 'failed to parse remote log');
  LogKey remoteMetricParse() => const LogKey('remoteMetricParse',
      description: 'failed to parse remote metric');
  LogKey remoteRequestParse() => const LogKey('remoteRequestParse',
      description: 'failed to parse remote request');
  LogKey remoteResponseParse() => const LogKey('remoteResponseParse',
      description: 'failed to parse remote response');
  LogKey remoteStreamResponseParse() =>
      const LogKey('remoteStreamResponseParse',
          description: 'failed to parse remote stream response');
  LogKey serviceStartFail(String name) => LogKey('serviceStartFail',
      description: 'service with name $name failed to start');
  LogKey serviceStopFail(String name) => LogKey('serviceStopFail',
      description: 'service with name $name failed to stop');
  LogKey streamMissingPendingRequest() =>
      const LogKey('streamMissingPendingRequest',
          description: 'No pending stream request');
  LogKey channelOnErrorFail() => const LogKey('channelOnErrorFail',
      description: 'Error occured while calling error interceptors');
  LogKey channelOnAfterFail() => const LogKey('channelOnAfterFail',
      description: 'Error occured while calling after interceptors');
  LogKey channelReroutingFailed() => const LogKey('channelReroutingFailed',
      description: 'Error occured while rerouting');
}
