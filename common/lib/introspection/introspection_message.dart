part of 'introspection.dart';

extension GenerateMessageIntrospection on GeneratedMessage {
  IntrospectionObject introspectRecursive(Map<String, IntrospectionObject> context) {
    final intro = IntrospectionObject();
    final rules = getValidationRules();
    intro.qualifiedName = getFullQualifiedName();
    if (context.containsKey(intro.qualifiedName)) {
      return context[intro.qualifiedName];
    }
    for (final entry in info_.byName.entries) {
      final value = entry.value;
      final field = IntrospectionField().fromFieldInfo(entry.key, value);
      if (rules.containsKey(value.name)) {
        field.validationRules = rules[value.name];
      }
      intro.fields.add(field);
      context[intro.qualifiedName] = intro; //MUST BE BEFORE
      if (value.isGroupOrMessage) {
        if (value is MapFieldInfo) {
          if (value.valueFieldInfo.subBuilder != null) {
            value.valueFieldInfo.subBuilder().introspectRecursive(context);
            field.fieldTypeName = value.valueFieldInfo.subBuilder().getFullQualifiedName();
          }
          field.fieldKeyTypeInt = value.keyFieldType;
          field.fieldTypeInt = value.valueFieldType;
        } else {
          value.subBuilder().introspectRecursive(context);
        }
      }
    }
    return intro;
  }

  String getFullQualifiedName() => info_.qualifiedMessageName;
}
