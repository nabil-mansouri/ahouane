part of 'validation.dart';

extension GeneratedMessageValidation on GeneratedMessage {
  Map<String, FieldRules> getValidationRules() {
    try {
      return (this as dynamic).$getValidationRules();
    } catch (e) {
      return <String, FieldRules>{};
    }
  }

  ValidationResult validate({final bool stopFirst = false, final recursive = true, Map<String, FieldRules> customRules}) {
    final result = ValidationResult();
    final map = customRules ?? getValidationRules();
    //if no need to validate
    if (map.isEmpty && recursive != true) {
      return result;
    }
    //iterate fields
    for (final field in info_.byIndex) {
      final value = getFieldOrNull(field.tagNumber);
      if (map.containsKey(field.name)) {
        final validator = map[field.name];
        final tmp = validator.doValidate(value);
        result.mergeField(field.name, tmp);
      }
      //checkif return
      if (stopFirst == true && result.hasErrors()) {
        return result;
      }
      //recursive
      if (recursive == true) {
        if (value is Any) {
          //TODO use introspection to parse
        } else if (value is GeneratedMessage) {
          final tmp = value.validate(recursive: recursive, stopFirst: stopFirst);
          result.mergeField(field.name, tmp);
        } else if (value is List) {
          for (final o in value) {
            if (o is GeneratedMessage) {
              final tmp = o.validate(recursive: recursive, stopFirst: stopFirst);
              result.mergeField(field.name, tmp);
            }
          }
        } else if (value is Map) {
          for (final o in value.values) {
            if (o is GeneratedMessage) {
              final tmp = o.validate(recursive: recursive, stopFirst: stopFirst);
              result.mergeField(field.name, tmp);
            }
          }
        }
      }
      //checkif return
      if (stopFirst == true && result.hasErrors()) {
        return result;
      }
    }
    return result;
  }
}

extension FieldRulesValidation on FieldRules {
  ValidationResult doValidate(dynamic value) {
    final result = ValidationResult();
    if (message.skip) {
      return result;
    }
    if (message.required && value == null) {
      result.add(ValidationKeys.REQUIRED);
      return result;
    }
    final validator = this;
    if (validator.hasAny()) {
      final tmp = validator.any.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasBool_13()) {
      final tmp = validator.bool_13.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasString()) {
      final tmp = validator.string.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasFloat()) {
      final tmp = validator.float.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasDouble_2()) {
      final tmp = validator.double_2.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasInt32()) {
      final tmp = validator.int32.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasInt64()) {
      final tmp = validator.int64.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasUint32()) {
      final tmp = validator.uint32.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasUint64()) {
      final tmp = validator.uint64.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasSint32()) {
      final tmp = validator.sint32.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasSint64()) {
      final tmp = validator.sint64.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasFixed32()) {
      final tmp = validator.fixed32.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasFixed64()) {
      final tmp = validator.fixed64.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasSfixed32()) {
      final tmp = validator.sfixed32.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasSfixed64()) {
      final tmp = validator.sfixed64.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasBytes()) {
      final tmp = validator.bytes.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasEnum_16()) {
      final tmp = validator.enum_16.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasRepeated()) {
      final tmp = validator.repeated.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasMap()) {
      final tmp = validator.map.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasDuration()) {
      final tmp = validator.duration.doValidate(value);
      result.mergeErrors(tmp);
    }
    if (validator.hasTimestamp()) {
      final tmp = validator.timestamp.doValidate(value);
      result.mergeErrors(tmp);
    }
    return result;
  }
}

extension AnyRulesValidation on AnyRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (value is Any) {
      if (in_2.isNotEmpty) {
        if (!in_2.contains(value.typeUrl)) {
          result.add(ValidationKeys.ANY_IN);
        }
      }
      if (notIn.isNotEmpty) {
        if (notIn.contains(value.typeUrl)) {
          result.add(ValidationKeys.ANY_NOT_IN);
        }
      }
      if (this.required) {
        if (isFrozen) {
          result.add(ValidationKeys.ANY_REQUIRED);
        }
      }
    } else {
      result.add(ValidationKeys.ANY_BADTYPE);
    }
    return result;
  }
}

extension BoolRulesValidation on BoolRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (value is bool) {
      if (hasConst_1()) {
        if (const_1 != value) {
          result.add(ValidationKeys.BOOL_CONST);
        }
      }
    } else {
      result.add(ValidationKeys.BOOL_BADTYPE);
    }
    return result;
  }
}

extension StringRulesValidation on StringRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (value is String) {
      if (ignoreEmpty && value.isEmpty) {
        return result;
      }
      if (hasConst_1()) {
        if (const_1 != value) {
          result.add(ValidationKeys.STRING_CONST);
        }
      }
      if (hasLen()) {
        if (value.length != len.toInt()) {
          result.add(ValidationKeys.STRING_LEN);
        }
      }
      if (hasMinLen()) {
        if (value.length < minLen.toInt()) {
          result.add(ValidationKeys.STRING_MINLEN);
        }
      }
      if (hasMaxLen()) {
        if (value.length > maxLen.toInt()) {
          result.add(ValidationKeys.STRING_MAXLEN);
        }
      }
      if (hasLenBytes()) {
        if (value.codeUnits.length != lenBytes.toInt()) {
          result.add(ValidationKeys.STRING_LENBYTES);
        }
      }
      if (hasMinBytes()) {
        if (value.codeUnits.length < minBytes.toInt()) {
          result.add(ValidationKeys.STRING_MINLENBYTES);
        }
      }
      if (hasMaxBytes()) {
        if (value.codeUnits.length > maxBytes.toInt()) {
          result.add(ValidationKeys.STRING_MAXLENBYTES);
        }
      }
      if (hasPattern()) {
        final reg = RegExp(pattern);
        if (!reg.hasMatch(value)) {
          result.add(ValidationKeys.STRING_PATTERN);
        }
      }
      if (hasPrefix()) {
        if (!value.startsWith(prefix)) {
          result.add(ValidationKeys.STRING_PREFIX);
        }
      }
      if (hasSuffix()) {
        if (!value.endsWith(prefix)) {
          result.add(ValidationKeys.STRING_SUFFIX);
        }
      }
      if (hasContains()) {
        if (!value.contains(contains)) {
          result.add(ValidationKeys.STRING_CONTAINS);
        }
      }
      if (hasNotContains()) {
        if (value.contains(notContains)) {
          result.add(ValidationKeys.STRING_NOTCONTAINS);
        }
      }
      if (in_10.isNotEmpty) {
        if (!in_10.contains(value)) {
          result.add(ValidationKeys.STRING_IN);
        }
      }
      if (notIn.isNotEmpty) {
        if (notIn.contains(value)) {
          result.add(ValidationKeys.STRING_NOTIN);
        }
      }
      if (email) {
        if (!StringValidation.isEmail(value)) {
          result.add(ValidationKeys.STRING_EMAIL);
        }
      }
      if (hostname) {
        if (!StringValidation.isHostname(value)) {
          result.add(ValidationKeys.STRING_HOSTNAME);
        }
      }
      if (ip) {
        if (!StringValidation.isIp(value)) {
          result.add(ValidationKeys.STRING_IP);
        }
      }
      if (ipv4) {
        if (!StringValidation.isIp4(value)) {
          result.add(ValidationKeys.STRING_IP4);
        }
      }
      if (ipv6) {
        if (!StringValidation.isIp6(value)) {
          result.add(ValidationKeys.STRING_IP6);
        }
      }
      if (uri) {
        if (!StringValidation.isUri(value)) {
          result.add(ValidationKeys.STRING_URI);
        }
      }
      if (uriRef) {
        if (!StringValidation.isUriRef(value)) {
          result.add(ValidationKeys.STRING_URIREF);
        }
      }
      if (address) {
        if (!StringValidation.isAddress(value)) {
          result.add(ValidationKeys.STRING_ADDRESS);
        }
      }
      if (uuid) {
        if (!StringValidation.isUUid(value)) {
          result.add(ValidationKeys.STRING_UUID);
        }
      }
      if (wellKnownRegex == KnownRegex.HTTP_HEADER_NAME) {
        final reg = r"^:?[0-9a-zA-Z!#$%&\'*+-.^_|~\x60]+$";
        if (!RegExp(reg).hasMatch(value)) {
          result.add(ValidationKeys.STRING_HTTPHEADER);
        }
      }
      if (wellKnownRegex == KnownRegex.HTTP_HEADER_VALUE) {
        final reg = r'^[^\u0000-\u0008\u000A-\u001F\u007F]*$';
        if (!RegExp(reg).hasMatch(value)) {
          result.add(ValidationKeys.STRING_HTTPVALUE);
        }
      }
    } else {
      result.add(ValidationKeys.STRING_BADTYPE);
    }
    return result;
  }
}

extension FloatRulesValidation on FloatRules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1,
      gt: gt,
      gte: gte,
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6,
      lt: lt,
      lte: lte,
      notIn: notIn,
    );
  }
}

extension DoubleRulesValidation on DoubleRules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1,
      gt: gt,
      gte: gte,
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6,
      lt: lt,
      lte: lte,
      notIn: notIn,
    );
  }
}

extension Int32RulesValidation on Int32Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1,
      gt: gt,
      gte: gte,
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6,
      lt: lt,
      lte: lte,
      notIn: notIn,
    );
  }
}

extension UInt32RulesValidation on UInt32Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension SInt32RulesValidation on SInt32Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension Fixed32RulesValidation on Fixed32Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension SFixed32RulesValidaiton on SFixed32Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension SFixed64RulesValidation on SFixed64Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension Fixed64RulesValidation on Fixed64Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension SInt64RulesValidation on SInt64Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension UInt64RulesValidation on UInt64Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

extension Int64RulesValidation on Int64Rules {
  ValidationResult doValidate(final dynamic value) {
    return doValidateNum(
      value,
      const_1: const_1.toInt(),
      gt: gt.toInt(),
      gte: gte.toInt(),
      hasConst_1: hasConst_1(),
      hasGt: hasGt(),
      hasGte: hasGte(),
      hasLt: hasLt(),
      hasLte: hasLte(),
      ignoreEmpty: ignoreEmpty,
      in_6: in_6.map((e) => e.toInt()).toList(),
      lt: lt.toInt(),
      lte: lte.toInt(),
      notIn: notIn.map((e) => e.toInt()).toList(),
    );
  }
}

ValidationResult doValidateNum(
  final dynamic value, {
  @required final bool ignoreEmpty,
  @required final bool hasConst_1,
  @required final num const_1,
  @required final bool hasLt,
  @required final num lt,
  @required final bool hasLte,
  @required final num lte,
  @required final bool hasGt,
  @required final num gt,
  @required final bool hasGte,
  @required final List<num> in_6,
  @required final List<num> notIn,
  @required final num gte,
}) {
  final result = ValidationResult();
  if (value == null && ignoreEmpty) {
    return result;
  }
  if (value is num) {
    if (hasConst_1) {
      if (value != const_1) {
        result.add(ValidationKeys.NUM_BADTYPE);
      }
    }
    if (hasLt) {
      if (value >= lt) {
        result.add(ValidationKeys.NUM_LT);
      }
    }
    if (hasLte) {
      if (value > lte) {
        result.add(ValidationKeys.NUM_LTE);
      }
    }
    if (hasGt) {
      if (value <= gt) {
        result.add(ValidationKeys.NUM_GT);
      }
    }
    if (hasGte) {
      if (value < gte) {
        result.add(ValidationKeys.NUM_GTE);
      }
    }
    if (in_6.isNotEmpty) {
      if (!in_6.contains(value)) {
        result.add(ValidationKeys.NUM_IN);
      }
    }
    if (notIn.isNotEmpty) {
      if (notIn.contains(value)) {
        result.add(ValidationKeys.NUM_NOTIN);
      }
    }
  } else {
    result.add(ValidationKeys.NUM_BADTYPE);
  }
  return result;
}

extension BytesRulesValidation on BytesRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (value == null && ignoreEmpty) {
      return result;
    }
    if (value is List<int>) {
      if (hasConst_1()) {
        if (value != const_1) {
          result.add(ValidationKeys.BYTES_CONST);
        }
      }
      if (hasLen()) {
        if (value.length == len.toInt()) {
          result.add(ValidationKeys.BYTES_LEN);
        }
      }
      if (hasMinLen()) {
        if (value.length < minLen.toInt()) {
          result.add(ValidationKeys.BYTES_MINLEN);
        }
      }
      if (hasMaxLen()) {
        if (value.length > maxLen.toInt()) {
          result.add(ValidationKeys.BYTES_MAXLEN);
        }
      }
      if (hasPattern()) {
        if (!RegExp(pattern).hasMatch(String.fromCharCodes(value))) {
          result.add(ValidationKeys.BYTES_PATTERN);
        }
      }
      if (hasPrefix()) {
        if (!Bytes.startsWith(value, prefix)) {
          result.add(ValidationKeys.BYTES_PREFIX);
        }
      }
      if (hasSuffix()) {
        if (!Bytes.endsWith(value, prefix)) {
          result.add(ValidationKeys.BYTES_SUFFIX);
        }
      }
      if (hasContains()) {
        if (!BytesValidation.isContains(value, contains)) {
          result.add(ValidationKeys.BYTES_CONTAINS);
        }
      }
      if (in_8.isNotEmpty) {
        if (!in_8.contains(value)) {
          result.add(ValidationKeys.BYTES_IN);
        }
      }
      if (notIn.isNotEmpty) {
        if (notIn.contains(value)) {
          result.add(ValidationKeys.BYTES_NOTIN);
        }
      }
      if (ip) {
        if (!BytesValidation.isIp(value)) {
          result.add(ValidationKeys.BYTES_IP);
        }
      }
      if (ipv4) {
        if (!BytesValidation.isIp4(value)) {
          result.add(ValidationKeys.BYTES_IP4);
        }
      }
      if (ipv6) {
        if (!BytesValidation.isIp6(value)) {
          result.add(ValidationKeys.BYTES_IP6);
        }
      }
    } else {
      result.add(ValidationKeys.BYTES_BADTYPE);
    }
    return result;
  }
}

extension EnumRulesValidation on EnumRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (value is ProtobufEnum) {
      if (hasConst_1()) {
        if (value.value != const_1) {
          result.add(ValidationKeys.ENUM_CONST);
        }
      }
      if (definedOnly) {
        if (!EnumValidation.isDefinedOnly(value)) {
          result.add(ValidationKeys.ENUM_DEFINED);
        }
      }
      if (in_3.isNotEmpty) {
        if (!in_3.contains(value.value)) {
          result.add(ValidationKeys.ENUM_IN);
        }
      }
      if (notIn.isNotEmpty) {
        if (notIn.contains(value.value)) {
          result.add(ValidationKeys.ENUM_NOTIN);
        }
      }
    } else {
      result.add(ValidationKeys.ENUM_BADTYPE);
    }
    return result;
  }
}

extension RepeatedRulesValidation on RepeatedRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (ignoreEmpty && value == null) {
      return result;
    }
    if (value is List) {
      if (ignoreEmpty && value.isEmpty) {
        return result;
      }
      if (hasMinItems()) {
        if (value.length < minItems.toInt()) {
          result.add(ValidationKeys.LIST_MINITEMS);
        }
      }
      if (hasMaxItems()) {
        if (value.length > maxItems.toInt()) {
          result.add(ValidationKeys.LIST_MAXITEMS);
        }
      }
      if (unique) {
        if (!RepeatedValidation.isUnique(value)) {
          result.add(ValidationKeys.LIST_UNIQUE);
        }
      }
      if (hasItems()) {
        var i = 0;
        for (final o in value) {
          result.mergeField('${i++}', items.doValidate(o));
        }
      }
    } else {
      result.add(ValidationKeys.LIST_BADTYPE);
    }
    return result;
  }
}

extension MapRulesValidation on MapRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (ignoreEmpty && value == null) {
      return result;
    }
    if (value is Map) {
      if (ignoreEmpty && value.isEmpty) {
        return result;
      }
      if (hasMinPairs()) {
        if (value.length < minPairs.toInt()) {
          result.add(ValidationKeys.MAP_MINITEMS);
        }
      }
      if (hasMaxPairs()) {
        if (value.length > maxPairs.toInt()) {
          result.add(ValidationKeys.MAP_MAXITEMS);
        }
      }
      if (hasKeys()) {
        for (final o in value.keys) {
          result.mergeField(o, keys.doValidate(o));
        }
      }
      if (hasValues()) {
        for (final o in value.entries) {
          result.mergeField(o.key, keys.doValidate(o.value));
        }
      }
    } else {
      result.add(ValidationKeys.MAP_BADTYPE);
    }
    return result;
  }
}

extension DurationValidation on DurationRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (this.required && value == null) {
      result.add(ValidationKeys.DURATION_REQUIRED);
      return result;
    }
    if (value is Duration) {
      if (this.required && value.isFrozen) {
        result.add(ValidationKeys.DURATION_REQUIRED);
        return result;
      }
      if (hasConst_2()) {
        if (value != const_2) {
          result.add(ValidationKeys.DURATION_CONST);
        }
      }
      if (hasLt()) {
        if (Durations.compare(value, lt) >= 0) {
          result.add(ValidationKeys.DURATION_LT);
        }
      }
      if (hasLte()) {
        if (Durations.compare(value, lt) > 0) {
          result.add(ValidationKeys.DURATION_LTE);
        }
      }
      if (hasGt()) {
        if (Durations.compare(value, gt) <= 0) {
          result.add(ValidationKeys.DURATION_GT);
        }
      }
      if (hasGte()) {
        if (Durations.compare(value, gte) < 0) {
          result.add(ValidationKeys.DURATION_GTE);
        }
      }
      if (in_7.isNotEmpty) {
        if (!in_7.contains(value)) {
          result.add(ValidationKeys.DURATION_IN);
        }
      }
      if (notIn.isNotEmpty) {
        if (notIn.contains(value)) {
          result.add(ValidationKeys.DURATION_NOTIN);
        }
      }
    } else {
      result.add(ValidationKeys.DURATION_BADTYPE);
    }
    return result;
  }
}

extension TimestampsValidation on TimestampRules {
  ValidationResult doValidate(final dynamic value) {
    final result = ValidationResult();
    if (this.required && value == null) {
      result.add(ValidationKeys.TIMESTAMP_REQUIRED);
      return result;
    }
    if (value is Timestamp) {
      if (this.required && value.isFrozen) {
        result.add(ValidationKeys.TIMESTAMP_REQUIRED);
        return result;
      }
      if (hasConst_2()) {
        if (value != const_2) {
          result.add(ValidationKeys.TIMESTAMP_CONST);
        }
      }
      if (hasLt()) {
        if (Timestamps.compare(value, lt) >= 0) {
          result.add(ValidationKeys.TIMESTAMP_LT);
        }
      }
      if (hasLte()) {
        if (Timestamps.compare(value, lt) > 0) {
          result.add(ValidationKeys.TIMESTAMP_LTE);
        }
      }
      if (hasGt()) {
        if (Timestamps.compare(value, gt) <= 0) {
          result.add(ValidationKeys.TIMESTAMP_GT);
        }
      }
      if (hasGte()) {
        if (Timestamps.compare(value, gte) < 0) {
          result.add(ValidationKeys.TIMESTAMP_GTE);
        }
      }
      if (hasLtNow()) {
        if (Timestamps.compare(value, TimestampValidation.currentTimestamp()) >= 0) {
          result.add(ValidationKeys.TIMESTAMP_LTNOW);
        }
      }
      if (hasGtNow()) {
        if (Timestamps.compare(value, TimestampValidation.currentTimestamp()) <= 0) {
          result.add(ValidationKeys.TIMESTAMP_GTNOW);
        }
      }
      if (hasWithin()) {
        if (TimestampValidation.isWithin(value, within, TimestampValidation.currentTimestamp())) {
          result.add(ValidationKeys.TIMESTAMP_GTNOW);
        }
      }
    } else {
      result.add(ValidationKeys.TIMESTAMP_BADTYPE);
    }
    return result;
  }
}
