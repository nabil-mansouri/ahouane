part of protobuf;

extension GeneratedMessageExt on GeneratedMessage {
  void setForceField(int tagNumber, value) {
    _fieldSet._setForceField(tagNumber, value);
  }

  String toDartString({
    bool skipUnknown = false,
    bool Function(String key, dynamic value, bool collection) filter,
    String Function(String key, dynamic value, bool collection, String prefix)
        replace,
  }) {
    var out = StringBuffer();
    out.write('${info_.messageName} (\n');
    _fieldSet.writeDartString(
      out,
      '',
      filter: filter,
      skipUnknown: skipUnknown,
      replace: replace,
    );
    out.write(')\n');
    return out.toString();
  }
}

extension _FieldSetExt on _FieldSet {
  void _setForceField(int tagNumber, value) {
    if (value == null) return;

    var fi = _nonExtensionInfo(tagNumber);
    if (fi == null) {
      if (!_hasExtensions) {
        throw ArgumentError('tag $tagNumber not defined in $_messageName');
      }
      _extensions._setField(tagNumber, value);
      return;
    }
    _setNonExtensionFieldUnchecked(fi, value);
  }

  void writeDartString(
    StringBuffer out,
    String indent, {
    bool skipUnknown = false,
    bool Function(String key, dynamic value, bool collection) filter,
    String Function(String key, dynamic value, bool collection, String prefix)
        replace,
  }) {
    void renderValue(final String key, value, final bool collection) {
      final prefix = collection ? '$indent' : '$indent$key: ';
      if (filter != null && !filter(key, value, collection)) {
        return;
      }
      if (replace != null) {
        final res = replace(key, value, collection, prefix);
        if (res != null) {
          out.write(res);
          return;
        }
      }
      if (value is GeneratedMessage) {
        out.write('$prefix${value.info_.messageName} (\n');
        value._fieldSet.writeDartString(
          out,
          '$indent  ',
          filter: filter,
          skipUnknown: skipUnknown,
          replace: replace,
        );
        out.write('$indent),\n');
      } else if (value is MapEntry) {
        if (value.value is GeneratedMessage) {
          out.write('$prefix"${value.key}" : ');
          final tmp = value.value as GeneratedMessage;
          tmp._fieldSet.writeDartString(
            out,
            '$indent  ',
            filter: filter,
            skipUnknown: skipUnknown,
            replace: replace,
          );
          out.write(' \n');
        }
        if (value.value is String) {
          out.write('$prefix"${value.key}" : "${value.value}", \n');
        } else {
          out.write('$prefix"${value.key}" : ${value.value}, \n');
        }
      } else if (value is ProtobufEnum) {
        out.write('$prefix${value.runtimeType}.$value,\n');
      } else if (value is String) {
        out.write('$prefix"$value",\n');
      } else {
        out.write('$prefix$value,\n');
      }
    }

    void writeFieldValue(fieldValue, String name) {
      if (fieldValue == null) return;
      if (fieldValue is ByteData) {
        // TODO(skybrian): possibly unused. Delete?
        final value = fieldValue.getUint64(0, Endian.little);
        renderValue(name, value, false);
      } else if (fieldValue is PbListBase) {
        if (filter != null && !filter(name, fieldValue, true)) {
          return;
        }
        out.write('$indent$name: [\n');
        for (var value in fieldValue) {
          renderValue(name, value, true);
        }
        out.write('$indent],\n');
      } else if (fieldValue is PbMap) {
        if (filter != null && !filter(name, fieldValue, true)) {
          return;
        }
        out.write('$indent$name: {\n');
        for (var entry in fieldValue.entries) {
          renderValue(name, entry, true);
        }
        out.write('$indent},\n');
      } else {
        if (filter != null && !filter(name, fieldValue, false)) {
          return;
        }
        renderValue(name, fieldValue, false);
      }
    }

    _infosSortedByTag
        .forEach((FieldInfo fi) => writeFieldValue(_values[fi.index], fi.name));

    if (_hasExtensions) {
      _extensions._info.keys.toList()
        ..sort()
        ..forEach((int tagNumber) => writeFieldValue(
            _extensions._values[tagNumber],
            '[${_extensions._info[tagNumber].name}]'));
    }
    if (skipUnknown == false) {
      if (_hasUnknownFields) {
        out.write(_unknownFields.toString());
      } else {
        out.write(UnknownFieldSet().toString());
      }
    }
  }
}
