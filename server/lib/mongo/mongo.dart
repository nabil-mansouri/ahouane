library ahouane.db.server.mongo;

import 'package:ahouane_client/auth.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_client/db.dart';
import 'package:fixnum/fixnum.dart';
import 'package:mongo_dart/mongo_dart.dart' hide Timestamp;
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:uuid/uuid.dart';
part 'mongo_service.dart';
part 'db_ext.dart';
part 'db_interceptor.dart';
part 'query_ext.dart';

dynamic MongoJsonToNativeTransformer(Any any) {
  if (any.canUnpackInto(DBValue())) {
    final val = any.unpackInto<DBValue>(DBValue());
    if (val.hasBufferValue()) {
      return mongo.BsonBinary.from(val.bufferValue);
    } else if (val.hasDateValue()) {
      return mongo.BsonDate(val.dateValue.asDateTime);
    } else if (val.hasObjectId()) {
      return mongo.ObjectId.fromHexString(val.objectId);
    } else if (val.hasRegexValue()) {
      return mongo.BsonRegexp(val.regexValue);
    } else {
      return null;
    }
  } else {
    return null;
  }
}

JsonObjectValue parseMongoObject(Map<String, dynamic> mongoObject, Logger logger) {
  mongoObject['id'] = mongoObject[MongoDBService.ID];
  mongoObject.remove(MongoDBService.ID);
  return JsonObjectValue()
    ..fromMap(
      mongoObject,
      override: (value) {
        if (value is mongo.Timestamp) {
          final tt = (Timestamp()..seconds = Int64(value.seconds));
          return JsonValue()..stringValue = tt.toProto3Json();
        } else if (value is mongo.BsonDate) {
          final tt = value.data.asTimestamp;
          return JsonValue()..stringValue = tt.toProto3Json();
        }
        return null;
      },
    );
}

extension MongoLogKeys on LogKeys {
  LogKey mongoStopping() => LogKey('mongoStopping', description: 'Mongo stopping');
  LogKey mongoStarting() => LogKey('mongoStarting', description: 'Mongo starting');
  LogKey invalidMongoOperation() => const LogKey('invalidMongoOperation', description: 'Could not determine the mongo operation');
  LogKey notFoundMongoOperation() => const LogKey('notFoundMongoOperation', description: 'Could not found the mongo operation');
  LogKey invalidMongoFilter() => const LogKey('invalidMongoFilter', description: 'Could not determine the kind of mongo filter');
  LogKey invalidMongoComparator() =>
      const LogKey('invalidMongoComparator', description: 'Could not determine the kind of mongo comparator');
  LogKey mongoNotOperator() => const LogKey('mongoNotOperator', description: 'Not operator is not implemented');
  LogKey mongoLogicalOperatorNotFound() =>
      const LogKey('mongoLogicalOperatorNotFound', description: 'Could not identify the mongo operator');
  LogKey mongoJoin() => const LogKey('mongoJoin', description: 'Mongo is not compatible with join');
}

class MongoDBServerModule extends ServerModule {
  MongoDBServerModule._(ServerApplication application) : super(application);
  Future<MongoDBService> create(Channel channel, [MongoDBConfig mongoConfig]) async {
    final db = MongoDBService(application, mongoConfig, application.client(channel));
    final service = GrpcChannelService(db, mongoConfig?.serviceConfig);
    service.interceptors.add(DBInterceptor(application, mongoConfig, application.client(channel)));
    final futures = <Future>[];
    futures.add(
      channel.register(db.route, service),
    );
    final admin = MongoDBAdminService(db);
    futures.add(
      channel.register(admin.route, GrpcChannelService(admin, mongoConfig?.serviceConfig)),
    );
    //dbadmin must be added as soon as possible
    await Future.wait(futures);
    return db;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('mongodb', MongoDBConfig());
    final futures = <Future>[];
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      for (final originalConfig in all) {
        final config = getConfig(originalConfig.deepCopy());
        config.collectionPrefix = tenant.defaut ? config.collectionPrefix : '${tenant.id}.';
        futures.add(create(channel, config));
      }
    }
    //db must be added as soon as possible
    await Future.wait(futures);
  }

  static MongoDBConfig getConfig(MongoDBConfig mongoCfg) {
    return MongoDBConfig()
      ..mergeFromMessage(defautConfig())
      ..mergeFromMessage(mongoCfg ?? MongoDBConfig());
  }

  static MongoDBConfig defautConfig() {
    return MongoDBConfig()
      ..db = 'main'
      ..host = 'localhost'
      ..port = 27017;
  }
}

extension ApplicationMongoDB on ServerApplication {
  MongoDBServerModule mongodb() => createSingleton(MongoDBServerModule, () => MongoDBServerModule._(this));
}
