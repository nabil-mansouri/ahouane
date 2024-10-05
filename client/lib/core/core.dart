library ahouane.core.client;

import 'dart:async';
import 'package:ahouane_common/utils/utils.dart';
import 'package:universal_io/io.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:protobuf/protobuf.dart';

import 'package:ahouane_common/core/core.dart';
import 'package:grpc/src/client/connection.dart';
import 'package:grpc/src/client/transport/transport.dart';
import 'package:grpc/src/client/channel.dart';
import 'package:grpc/src/client/transport/web_streams.dart' as grpcstream;
import 'package:grpc/src/client/channel.dart' as grpcchannel;
export 'package:ahouane_common/core/core.dart';
part 'grpc.dart';
part 'grpc_transport.dart';

class ClientModule {
  final ClientApplication application;
  ClientModule(this.application);
}

class ClientApplication {
  static const SESSION_KEY = 'cookie';
  final ClientApplicationConfig config;
  final session = <String, String>{};
  ClientApplication(this.config);

  bool isError(dynamic e, String error) {
    return getError(e) == error;
  }

  String getError(dynamic e) {
    if (e is String) {
      return e;
    } else if (e is GrpcError) {
      return e.message;
    } else {
      return 'app.errors.unknown';
    }
  }

  Uri get baseUri => Uri(
        scheme: config.secure == true ? 'https' : 'http',
        host: config.host,
        port: config.port,
      );

  grpcchannel.ClientChannel createChannel() {
    return _ClientChannelProxy(this, baseUri, adminApiKey: config.adminApiKey);
  }
}
