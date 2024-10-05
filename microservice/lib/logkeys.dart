part of 'microservice.dart';

extension MicroserviceLogKeys on LogKeys {
  LogKey appStartFailed() => const LogKey('appStartFailed',
      description: 'MicroService failed to start');
  LogKey remoteEventParse() => const LogKey('remoteEventParse',
      description: 'failed to parse remote event');
  LogKey remoteRequestParse() => const LogKey('remoteRequestParse',
      description: 'failed to parse remote request');
  LogKey remoteResponseParse() => const LogKey('remoteResponseParse',
      description: 'failed to parse remote response');
  LogKey remoteStreamResponseParse() =>
      const LogKey('remoteStreamResponseParse',
          description: 'failed to parse remote stream response');
  LogKey remoteStreamErrorParse() => const LogKey('remoteStreamErrorParse',
      description: 'failed to parse remote error stream response');
  LogKey streamMissingPendingRequest() =>
      const LogKey('streamMissingPendingRequest',
          description: 'No pending stream request');
  LogKey streamMissingPendingResponse() =>
      const LogKey('streamMissingPendingResponse',
          description: 'No pending stream response');
  LogKey notGrpcData() =>
      const LogKey('notGrpcData', description: 'event is not of type GrpcData');
  LogKey writterInvalidType(dynamic type) => LogKey('writterInvalidType',
      description: 'Could not write object of type : ${type?.runtimeType}');
  LogKey httpResponseClosed() => const LogKey('httpResponseClosed',
      description: 'Could not write after http response closed');
  LogKey httpSendAsFailed() => const LogKey('httpSendAsFailed',
      description: 'Failed to write buffer on http response');
  LogKey httpServiceError() => const LogKey('httpServiceError',
      description: 'Failed to process request');
  LogKey httpInterceptorError() => const LogKey('httpInterceptorError',
      description: 'Failed to intercept request');
}
