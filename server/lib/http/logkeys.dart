part of 'http.dart';

extension HttpServerLogKeys on LogKeys {
  LogKey exceptionMappingFail() => const LogKey('exceptionMappingFail', description: 'Could not found mapping for error');
  LogKey requestLogger() => const LogKey('requestLogger', description: 'Dump http request');
  LogKey responseLogger() => const LogKey('responseLogger', description: 'Dump http response');
  LogKey httpServerStarting() => const LogKey('httpServerStarting', description: 'Server http is starting');
  LogKey httpServerStart() => const LogKey('httpServerStart', description: 'Server http started');
  LogKey httpServerStop() => const LogKey('httpServerStop', description: 'Server http stopped');
  LogKey httpServerError() => const LogKey('httpServerError', description: 'Server http failed to listen socket');
  LogKey httpRequest() => const LogKey('httpRequest', description: 'Http request received');
  LogKey httpResponse() => const LogKey('httpResponse', description: 'Http response send');
  LogKey httpNoResponse() => const LogKey('httpNoResponse', description: 'Http no response send');
  LogKey httpResponseTime(String method, String path, int status, int duration) =>
      LogKey('httpResponseTime', description: '$method $path $status - Duration=$duration ms');
}
