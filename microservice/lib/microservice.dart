/// Support for doing something awesome.
///
/// More dartdocs go here.
library ahouane_microservice;


import 'dart:async';
import 'dart:typed_data';
import 'package:universal_io/io.dart';
import 'package:ahouane_common/generated/logger.pbgrpc.dart';
import 'package:ahouane_common/generated/microservice.pb.dart';
import 'package:ahouane_common/http/http.dart';
import 'package:ahouane_common/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart';
import 'package:rxdart/rxdart.dart';
import 'package:grpc/src/client/transport/web_streams.dart' as grpcstream;
export 'package:ahouane_common/generated/microservice.pb.dart';
part 'application.dart';
part 'codec.dart';
part 'logger.dart';
part 'logkeys.dart';
part 'message_reader.dart';
part 'message_serializer.dart';
part 'message_writter.dart';
