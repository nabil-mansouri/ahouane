part of 'validation.dart';

class StringValidation {
  static final UUID_DASH_1 = 8;
  static final UUID_DASH_2 = 13;
  static final UUID_DASH_3 = 18;
  static final UUID_DASH_4 = 23;
  static final UUID_LEN = 36;
  static final EmailValidator EMAIL_VALIDATOR = EmailValidator.getInstance();

  static void length(final String field, final String value, final expected) {
    final actual = value.codeUnits.length;
    if (actual != expected) {
      throw ValidationException(field, enquote(value), 'length must be $expected but got: $actual ');
    }
  }

  static void minLength(final String field, final String value, final expected) {
    final actual = value.codeUnits.length;
    if (actual < expected) {
      throw ValidationException(field, enquote(value), 'length must be at least $expected but got: $actual ');
    }
  }

  static void maxLength(final String field, final String value, final expected) {
    final actual = value.codeUnits.length;
    if (actual > expected) {
      throw ValidationException(field, enquote(value), 'length must be at most $expected  but got: $actual ');
    }
  }

  static void lenBytes(String field, String value, int expected) {
    if (utf8.encode(value).length != expected) {
      throw ValidationException(field, enquote(value), 'bytes length must be $expected');
    }
  }

  static void minBytes(String field, String value, int expected) {
    if (utf8.encode(value).length < expected) {
      throw ValidationException(field, enquote(value), 'bytes length must be at least $expected');
    }
  }

  static void maxBytes(String field, String value, int expected) {
    if (utf8.encode(value).length > expected) {
      throw ValidationException(field, enquote(value), 'bytes length must be at most $expected');
    }
  }

  static void pattern(String field, String value, Pattern p) {
    if (p.allMatches(value).isEmpty) {
      throw ValidationException(field, enquote(value), 'must match pattern ' + p.toString());
    }
  }

  static void prefix(String field, String value, String prefix) {
    if (!value.startsWith(prefix)) {
      throw ValidationException(field, enquote(value), 'should start with ' + prefix);
    }
  }

  static void contains(String field, String value, String contains) {
    if (!value.contains(contains)) {
      throw ValidationException(field, enquote(value), 'should contain ' + contains);
    }
  }

  static void notContains(String field, String value, String contains) {
    if (value.contains(contains)) {
      throw ValidationException(field, enquote(value), 'should not contain ' + contains);
    }
  }

  static void suffix(String field, String value, String suffix) {
    if (!value.endsWith(suffix)) {
      throw ValidationException(field, enquote(value), 'should end with ' + suffix);
    }
  }

  static bool isIp(final String value) {
    try {
      StringValidation.ip('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isIp4(final String value) {
    try {
      StringValidation.ipv4('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isIp6(final String value) {
    try {
      StringValidation.ipv6('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isUri(final String value) {
    try {
      StringValidation.uri('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isUriRef(final String value) {
    try {
      StringValidation.uriRef('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isAddress(final String value) {
    try {
      StringValidation.address('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isUUid(final String value) {
    try {
      StringValidation.uuid('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isHostname(final String value) {
    try {
      StringValidation.hostName('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isEmail(final String value) {
    try {
      StringValidation.email('', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static void email(final String field, String value) {
    if (value.isNotEmpty && value.codeUnitAt(value.length - 1) == '>'.codeUnitAt(0)) {
      final chars = value.codeUnits;
      var sb = '';
      var insideQuotes = false;
      for (var i = chars.length - 2; i >= 0; i--) {
        final c = chars[i];
        if (c == '<'.codeUnitAt(0)) {
          if (!insideQuotes) break;
        } else if (c == '"'.codeUnitAt(0)) {
          insideQuotes = !insideQuotes;
        }
        sb += String.fromCharCode(c);
      }
      value = String.fromCharCodes(sb.codeUnits.reversed);
    }

    if (!EMAIL_VALIDATOR.isValid(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid email');
    }
  }

  static void address(String field, String value) {
    var validHost = isAscii(value) && DomainValidator.getInstanceWithAllow(true).isValid(value);
    var validIp = InetAddressValidator.getInstance().isValid(value);

    if (!validHost && !validIp) {
      throw ValidationException(field, enquote(value), 'should be a valid host, or an ip address.');
    }
  }

  static void hostName(String field, String value) {
    if (!isAscii(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid host containing only ascii characters');
    }

    var domainValidator = DomainValidator.getInstanceWithAllow(true);
    if (!domainValidator.isValid(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid host');
    }
  }

  static void ip(String field, String value) {
    var ipValidator = InetAddressValidator.getInstance();
    if (!ipValidator.isValid(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid ip address');
    }
  }

  static void ipv4(String field, String value) {
    var ipValidator = InetAddressValidator.getInstance();
    if (!ipValidator.isValidInet4Address(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid ipv4 address');
    }
  }

  static void ipv6(String field, String value) {
    var ipValidator = InetAddressValidator.getInstance();
    if (!ipValidator.isValidInet6Address(value)) {
      throw ValidationException(field, enquote(value), 'should be a valid ipv6 address');
    }
  }

  static void uri(String field, String value) {
    try {
      final uri = Uri.parse(value);
      if (!uri.isAbsolute) {
        throw ValidationException(field, enquote(value), 'should be a valid absolute uri');
      }
    } catch (ex) {
      throw ValidationException(field, enquote(value), 'should be a valid absolute uri');
    }
  }

  static void uriRef(String field, String value) {
    try {
      Uri.parse(value);
    } catch (ex) {
      throw ValidationException(field, enquote(value), 'should be a valid absolute uri');
    }
  }

  /// Validates if the given value is a UUID or GUID in RFC 4122 hyphenated
  /// ({@code 00000000-0000-0000-0000-000000000000}) form; both lower and upper
  /// hex digits are accepted.
  static void uuid(final String field, final String value) {
    final chars = value.codeUnits;

    err:
    if (chars.length == UUID_LEN) {
      for (var i = 0; i < chars.length; i++) {
        final c = chars[i];
        if (i == UUID_DASH_1 || i == UUID_DASH_2 || i == UUID_DASH_3 || i == UUID_DASH_4) {
          if (c != '-'.codeUnitAt(0)) {
            break err;
          }
        } else if ((c < '0'.codeUnitAt(0) || c > '9'.codeUnitAt(0)) &&
            (c < 'a'.codeUnitAt(0) || c > 'f'.codeUnitAt(0)) &&
            (c < 'A'.codeUnitAt(0) || c > 'F'.codeUnitAt(0))) {
          break err;
        }
      }
      return;
    }

    throw ValidationException(field, enquote(value), 'invalid UUID string');
  }

  static String enquote(String value) {
    return '\"' + value + '\"';
  }

  static bool isAscii(final String value) {
    for (final c in value.codeUnits) {
      if (c > 127) {
        return false;
      }
    }
    return true;
  }
}
