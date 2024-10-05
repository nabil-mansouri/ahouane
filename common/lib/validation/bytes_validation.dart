part of 'validation.dart';

class BytesValidation {
  BytesValidation();

  static void length(String field, List<int> value, int expected) {
    if (value.length != expected) {
      throw ValidationException(field, '$value', 'length must be $expected');
    }
  }

  static void minLength(String field, List<int> value, int expected) {
    if (value.length < expected) {
      throw ValidationException(field, '$value', 'length must be at least $expected');
    }
  }

  static void maxLength(String field, List<int> value, int expected) {
    if (value.length > expected) {
      throw ValidationException(field, '$value', 'length must be at most $expected');
    }
  }

  static void prefix(String field, List<int> value, List<int> prefix) {
    if (!Bytes.startsWith(value, prefix)) {
      throw ValidationException(field, '$value', 'should start with $prefix');
    }
  }

  static void contains(String field, List<int> value, List<int> contains) {
    if (Bytes.indexOfList(value, contains) == -1) {
      throw ValidationException(field, '$value', 'should contain $contains');
    }
  }

  static void suffix(String field, List<int> value, List<int> suffix) {
    if (!Bytes.endsWith(value, suffix)) {
      throw ValidationException(field, '$value', 'should end with $suffix');
    }
  }

  static void pattern(String field, List<int> value, RegExp p) {
    final tmp = utf8.decode(value);
    if (!p.hasMatch(tmp)) {
      throw ValidationException(field, '$value', 'must match pattern ${p.toString()}');
    }
  }

  static bool isIp(final List<int> value) {
    try {
      ip('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isContains(final List<int> value, final List<int> con) {
    try {
      contains('', value, con);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isIp4(final List<int> value) {
    try {
      ipv4('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isIp6(final List<int> value) {
    try {
      ipv6('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void ip(String field, List<int> value) {
    if (value.length != 4 && value.length != 16) {
      throw ValidationException(field, '$value', 'should be valid ip address $value');
    }
  }

  static void ipv4(String field, List<int> value) {
    if (value.length != 4) {
      throw ValidationException(field, '$value', 'should be valid ipv4 address $value');
    }
  }

  static void ipv6(String field, List<int> value) {
    if (value.length != 16) {
      throw ValidationException(field, '$value', 'should be valid ipv6 address $value');
    }
  }
}
