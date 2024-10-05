part of 'introspection.dart';

void _checkNotNull(Object val) {
  if (val == null) {
    throw ArgumentError("Can't add a null to a repeated field");
  }
}

extension IntrospectionFieldExt on IntrospectionField {
  FieldInfo toFieldInfo() {
    final info = BuilderInfo('');
    final app = IntrospectionObjects();
    addToBuilder(info, IntrospectionObject(), app);
    return info.byName[fieldName];
  }

  IntrospectionField fromFieldInfo(String fieldName, FieldInfo value) {
    final enumValues = value.enumValues?.map((e) => e.name)?.toList() ?? <String>[];
    String subType;
    if (value.subBuilder != null) {
      subType = value.subBuilder().getFullQualifiedName();
    }
    if (value.isEnum && value.makeDefault() != null) {
      subType = value.makeDefault().runtimeType.toString();
    }
    this
      ..fieldName = fieldName
      ..fieldTypeName = subType
      ..fieldTypeInt = value.type
      ..isEnum = value.isEnum
      ..isMessage = value.isGroupOrMessage
      ..isRepeated = value.isRepeated
      ..isMap = value.isMapField
      ..enumValues.addAll(enumValues)
      ..tagNumber = value.tagNumber;
    return this;
  }

  void addToBuilder(BuilderInfo info, IntrospectionObject introspection, IntrospectionObjects app) {
    final field = this;
    final enums = <ProtobufEnum>[];
    for (var i = 0; i < field.enumValues.length; i++) {
      enums.add(DynamicProtobufEnum(
        i,
        field.enumValues[i],
        field.fieldTypeName,
      ));
    }
    dynamic defautOrMaker = field.isEnum && enums.isNotEmpty ? enums.first : null;
    final subBuilder = () {
      //need for linker (shared by designer and simulator)
      if (kIntrospectionSkipBuilder.containsKey(field.fieldTypeName)) {
        return kIntrospectionSkipBuilder[field.fieldTypeName].deepCopy();
      }
      //
      if (field.hasEmbedType()) {
        return DynamicMessage.fromIntrospection(field.embedType, app);
      } else {
        final sub = app.getIntrospectionByName(field.fieldTypeName);
        return DynamicMessage.fromIntrospection(sub.orElse(IntrospectionObject()), app);
      }
    };
    if (field.isMessage) {
      defautOrMaker = () {
        final tmp = subBuilder()..freeze();
        return tmp;
      };
    }
    final valueOf = (value) {
      return 0 <= value && value < enums.length ? enums[value] : null;
    };
    //
    if (field.isRepeated) {
      if (field.isMessage) {
        info.addRepeated<GeneratedMessage>(field.tagNumber, field.fieldName, field.fieldTypeInt, _checkNotNull, subBuilder, valueOf, enums,
            protoName: field.fieldName);
      } else {
        info.addRepeated(field.tagNumber, field.fieldName, field.fieldTypeInt, _checkNotNull, subBuilder, valueOf, enums,
            protoName: field.fieldName);
      }
    } else if (field.isMap) {
      info.m(field.tagNumber, field.fieldName,
          keyFieldType: field.fieldKeyTypeInt,
          valueFieldType: field.fieldTypeInt,
          valueCreator: subBuilder,
          valueOf: valueOf,
          enumValues: enums,
          entryClassName: '${introspection.messageName}.MappingEntry',
          protoName: field.fieldName);
    } else {
      info.add(field.tagNumber, field.fieldName, field.fieldTypeInt, defautOrMaker, subBuilder, valueOf, enums, protoName: field.fieldName);
    }
  }
}
