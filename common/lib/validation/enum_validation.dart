part of 'validation.dart';

class EnumValidation {
  static bool isDefinedOnly(ProtobufEnum value) {
    try {
      definedOnly('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void definedOnly(String field, ProtobufEnum value) {
    if (value.toString() == ('UNRECOGNIZED')) {
      throw ValidationException(field, '$value', 'value is not a defined Enum value $value');
    }
  }
}
