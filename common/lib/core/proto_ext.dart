part of 'core.dart';

class _TypeRegistry implements TypeRegistry {
  final Map<String, BuilderInfo> _mapping;

  _TypeRegistry(Iterable<GeneratedMessage> types)
      : _mapping = Map.fromEntries(types.map((message) => MapEntry(message.info_.qualifiedMessageName, message.info_)));

  @override
  BuilderInfo lookup(String qualifiedName) {
    return _mapping[qualifiedName];
  }
}

final _kTypeRegistries = <Type, _TypeRegistry>{};

extension GeneratedMessageExt on GeneratedMessage {
  void visit(void Function(GeneratedMessage message, String field, dynamic value) visitor) {
    for (final field in info_.byIndex) {
      visitor(this, field.name, getField(field.tagNumber));
      if (field.isGroupOrMessage) {
        (field as GeneratedMessage).visit(visitor);
      }
    }
  }

  void unfreezeField(String field) {
    for (final entry in info_.fieldInfo.entries) {
      if (entry.value.name == field) {
        final value = getField(entry.value.tagNumber);
        if (value != null && (value is GeneratedMessage) && value.isFrozen) {
          setField(entry.value.tagNumber, value.deepCopy());
        }
        break;
      }
    }
  }

  void unfreeze() {
    for (final entry in info_.fieldInfo.entries) {
      final value = getField(entry.value.tagNumber);
      if (value != null && (value is GeneratedMessage) && value.isFrozen) {
        setField(entry.value.tagNumber, value.deepCopy());
      }
    }
  }

  void unfreezeDeep() {
    for (final entry in info_.fieldInfo.entries) {
      final value = getField(entry.value.tagNumber);
      if (value != null && (value is GeneratedMessage)) {
        if (value.isFrozen) {
          final clone = value.deepCopy();
          setField(entry.value.tagNumber, clone);
          clone.unfreezeDeep();
        } else {
          value.unfreezeDeep();
        }
      }
    }
  }

  void addToTypeRegistry(GeneratedMessage message) {
    final reg = typeRegistry() as _TypeRegistry;
    reg._mapping[message.info_.qualifiedMessageName] = message.info_;
  }

  TypeRegistry typeRegistry() {
    _kTypeRegistries.putIfAbsent(runtimeType, () => _TypeRegistry([]));
    final reg = _kTypeRegistries[runtimeType];
    return reg;
  }

  Map<String, dynamic> toProto3JsonSafe({TypeRegistry typeRegistry}) {
    return toProto3Json(typeRegistry: typeRegistry ?? this.typeRegistry());
  }

  void mergeFromProto3JsonSafe(Object json,
      {TypeRegistry typeRegistry = const TypeRegistry.empty(),
      bool ignoreUnknownFields = false,
      bool supportNamesWithUnderscores = true,
      bool permissiveEnums = false}) {
    mergeFromProto3Json(json,
        ignoreUnknownFields: ignoreUnknownFields,
        permissiveEnums: permissiveEnums,
        supportNamesWithUnderscores: supportNamesWithUnderscores,
        typeRegistry: typeRegistry ?? this.typeRegistry());
  }
}
