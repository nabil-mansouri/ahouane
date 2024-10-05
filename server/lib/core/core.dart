library ahouane.core.server;

import 'dart:async';
import 'package:universal_io/io.dart';

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/core/core.dart';
import 'package:ahouane_common/generated/core.pb.dart';
import 'package:ahouane_microservice/microservice.dart';
import 'package:ahouane_common/utils/utils.dart';
import 'package:async/async.dart';
import 'package:csv/csv.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';
import 'package:grpc/src/client/channel.dart' as grpcchannel;
import 'package:uuid/uuid.dart';
import 'package:yaml/yaml.dart';
import './grpc/grpc.dart';

export './grpc/grpc.dart';
export 'package:ahouane_common/core/core.dart';
export 'package:ahouane_microservice/microservice.dart' hide Codec;

part 'application.dart';
part 'channel.dart';
part 'context.dart';
part 'endpoint.dart';
part 'interceptor.dart';
part 'logger.dart';
part 'logkeys.dart';
part 'metrics.dart';
part 'route_context.dart';
part 'router.dart';
part 'service.dart';
part 'storage.dart';

extension MessageSe on MessageSession {
  bool isAuthenticated() => userId?.isNotEmpty == true;
}
