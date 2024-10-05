part of 'introspection.dart';

class DynamicProtobufEnum extends ProtobufEnum {
  final String enumName;
  const DynamicProtobufEnum(int value, String name, this.enumName) : super(value, name);
}

class DynamicMessage extends GeneratedMessage {
  final BuilderInfo _info;
  final IntrospectionObject _intro;
  DynamicMessage(this._info, this._intro);
  static DynamicMessage fromMessage(final GeneratedMessage message) {
    return DynamicMessage(message.info_, message.introspectRecursive(<String, IntrospectionObject>{}));
  }

  static DynamicMessage fromIntrospection(
    IntrospectionObject introspection,
    final IntrospectionObjects app,
  ) {
    introspection = introspection ?? IntrospectionObject();
    final info = BuilderInfo(introspection?.qualifiedName ?? 'unknown', createEmptyInstance: () {
      return DynamicMessage.fromIntrospection(introspection, app);
    });
    for (final field in introspection.fields) {
      field.addToBuilder(info, introspection, app);
    }
    final temp = DynamicMessage(info, introspection);
    GeneratedMessage exceptional(String name) {
      return kIntrospectionException[name].deepCopy()..mergeFromMessage(temp);
    }

    if (kIntrospectionException.containsKey(introspection.qualifiedName)) {
      return exceptional(introspection.qualifiedName);
    }
    final check = introspection.qualifiedName.replaceAll(_kGooglePackage, '');
    if (kIntrospectionException.containsKey(check)) {
      return exceptional(check);
    }
    return temp;
  }

  @override
  GeneratedMessage clone() {
    return DynamicMessage(_info, _intro)..mergeFromMessage(this);
  }

  @override
  GeneratedMessage createEmptyInstance() {
    return DynamicMessage(_info, _intro);
  }

  @override
  // ignore: non_constant_identifier_names
  BuilderInfo get info_ => _info;

  Optional<IntrospectionField> getIntrospectionForField(FieldInfo fieldInfo) {
    for (final field in _intro.fields) {
      if (field.fieldName == fieldInfo.name) {
        return Optional.of(field);
      }
    }
    return Optional.empty();
  }
}
