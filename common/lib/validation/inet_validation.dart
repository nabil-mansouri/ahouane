part of 'validation.dart';

class InetAddressValidator {
  static final int MAX_BYTE = 128;

  static final int IPV4_MAX_OCTET_VALUE = 255;

  static final int MAX_UNSIGNED_SHORT = 0xffff;

  static final int BASE_16 = 16;

  static final String IPV4_REGEX = '^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\$';

  // Max number of hex groups (separated by :) in an IPV6 address
  static final int IPV6_MAX_HEX_GROUPS = 8;

  // Max hex digits in each IPv6 group
  static final int IPV6_MAX_HEX_DIGITS_PER_GROUP = 4;

  /// Singleton instance of this class.
  static final InetAddressValidator VALIDATOR = InetAddressValidator();

  /// IPv4 RegexValidator */
  final RegexValidator ipv4Validator = RegexValidator.regex(IPV4_REGEX);

  /// Returns the singleton instance of this validator.
  /// @return the singleton instance of this validator
  static InetAddressValidator getInstance() {
    return VALIDATOR;
  }

  /// Checks if the specified string is a valid IP address.
  /// @param inetAddress the string to validate
  /// @return true if the string validates as an IP address
  bool isValid(String inetAddress) {
    return isValidInet4Address(inetAddress) || isValidInet6Address(inetAddress);
  }

  /// Validates an IPv4 address. Returns true if valid.
  /// @param inet4Address the IPv4 address to validate
  /// @return true if the argument contains a valid IPv4 address
  bool isValidInet4Address(String inet4Address) {
    // verify that address conforms to generic IPv4 format
    var groups = ipv4Validator.match(inet4Address);

    if (groups == null) {
      return false;
    }

    // verify that address subgroups are legal
    for (var ipSegment in groups) {
      if (ipSegment == null || ipSegment.isEmpty) {
        return false;
      }

      var iIpSegment = 0;

      try {
        iIpSegment = int.parse(ipSegment);
      } catch (e) {
        return false;
      }

      if (iIpSegment > IPV4_MAX_OCTET_VALUE) {
        return false;
      }

      if (ipSegment.length > 1 && ipSegment.startsWith('0')) {
        return false;
      }
    }

    return true;
  }

  /// Validates an IPv6 address. Returns true if valid.
  /// @param inet6Address the IPv6 address to validate
  /// @return true if the argument contains a valid IPv6 address
  ///
  /// @since 1.4.1
  bool isValidInet6Address(String inet6Address) {
    List<String> parts;
    // remove prefix size. This will appear after the zone id (if any)
    parts = inet6Address.split('/');
    if (parts.length > 2) {
      return false; // can only have one prefix specifier
    }
    if (parts.length == 2) {
      if (parts[1].allMatches('\\d{1,3}').isEmpty) {
        return false; // not a valid number
      }
      var bits = int.parse(parts[1]); // cannot fail because of RE check
      if (bits < 0 || bits > MAX_BYTE) {
        return false; // out of range
      }
    }
    // remove zone-id
    parts = parts[0].split('%');
    if (parts.length > 2) {
      return false;
    }
    // The id syntax is implementation independent, but it presumably cannot allow:
    // whitespace, '/' or '%'
    if ((parts.length == 2) && parts[1].allMatches('[^\\s/%]+').isEmpty) {
      return false; // invalid id
    }
    inet6Address = parts[0];
    var containsCompressedZeroes = inet6Address.contains('::');
    if (containsCompressedZeroes && (inet6Address.indexOf('::') != inet6Address.lastIndexOf('::'))) {
      return false;
    }
    if ((inet6Address.startsWith(':') && !inet6Address.startsWith('::')) || (inet6Address.endsWith(':') && !inet6Address.endsWith('::'))) {
      return false;
    }
    var octets = inet6Address.split(':');
    if (containsCompressedZeroes) {
      final octetList = <String>[];
      if (inet6Address.endsWith('::')) {
        // String.split() drops ending empty segments
        octetList.add('');
      } else if (inet6Address.startsWith('::') && octetList.isNotEmpty) {
        octetList.remove(0);
      }
      octets = [...octetList];
    }
    if (octets.length > IPV6_MAX_HEX_GROUPS) {
      return false;
    }
    var validOctets = 0;
    var emptyOctets = 0; // consecutive empty chunks
    for (var index = 0; index < octets.length; index++) {
      var octet = octets[index];
      if (octet.isEmpty) {
        emptyOctets++;
        if (emptyOctets > 1) {
          return false;
        }
      } else {
        emptyOctets = 0;
        // Is last chunk an IPv4 address?
        if (index == octets.length - 1 && octet.contains('.')) {
          if (!isValidInet4Address(octet)) {
            return false;
          }
          validOctets += 2;
          continue;
        }
        if (octet.length > IPV6_MAX_HEX_DIGITS_PER_GROUP) {
          return false;
        }
        var octetInt = 0;
        try {
          octetInt = int.parse(octet, radix: BASE_16);
        } catch (e) {
          return false;
        }
        if (octetInt < 0 || octetInt > MAX_UNSIGNED_SHORT) {
          return false;
        }
      }
      validOctets++;
    }
    if (validOctets > IPV6_MAX_HEX_GROUPS || (validOctets < IPV6_MAX_HEX_GROUPS && !containsCompressedZeroes)) {
      return false;
    }
    return true;
  }
}
