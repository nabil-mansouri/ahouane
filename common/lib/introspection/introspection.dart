import 'package:ahouane_common/core/core.dart';
import 'package:ahouane_common/generated/introspection.pb.dart';
import 'package:ahouane_common/validation/validation.dart';
export 'package:ahouane_common/generated/introspection.pb.dart';
part 'dynamic_message.dart';
part 'introspection_field.dart';
part 'introspection_message.dart';

const _kGooglePackage = 'type.googleapis.com/';
final kIntrospectionException = <String, GeneratedMessage>{};
const kIntrospectionSkipBuilder = <String, GeneratedMessage>{};

class Introspection {
  final all = IntrospectionObjects();
  static final _instance = Introspection();
  static Introspection get instance {
    return _instance;
  }

  void add(IntrospectionObject object) {
    all.objects[object.messageName] = object;
  }

  void addAll(IntrospectionObjects objects) {
    for (final o in objects.objects.entries) {
      add(o.value);
    }
  }

  void register(GeneratedMessage message) {
    final o = message.introspectRecursive(all.objects);
    add(o);
  }

  Optional<GeneratedMessage> anyToMessage(final Any any) {
    final res = all.getIntrospectionByName(any.typeUrl);
    return res.map((p0) {
      final dyn = DynamicMessage.fromIntrospection(p0, all);
      return any.unpackInto(dyn);
    });
  }

  Optional<GeneratedMessage> typeToMessage(final String type) {
    final res = all.getIntrospectionByName(type);
    return res.map((p0) {
      final dyn = DynamicMessage.fromIntrospection(p0, all);
      return dyn;
    });
  }
}

extension IntrospectionObjectsExt on IntrospectionObjects {
  Optional<IntrospectionObject> getIntrospectionByName(String name) {
    if (objects.containsKey(name)) {
      return Optional.of(objects[name]);
    }
    final test = name.replaceAll(_kGooglePackage, '');
    if (objects.containsKey(test)) {
      return Optional.of(objects[test]);
    }
    return Optional.empty();
  }
}

extension IntrospectionObjectExt on IntrospectionObject {
  String get messageName {
    final lastDot = qualifiedName.lastIndexOf('.');
    return lastDot == -1 ? qualifiedName : qualifiedName.substring(lastDot + 1);
  }
}
