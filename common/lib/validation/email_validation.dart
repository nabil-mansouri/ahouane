part of 'validation.dart';

class EmailValidator {
  static final SPECIAL_CHARS = "\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]";
  static final VALID_CHARS = '[^\\s' + SPECIAL_CHARS + ']';
  static final QUOTED_USER = '(\"[^\"]*\")';
  static final ATOM = VALID_CHARS + '+';
  static final WORD = '((' + VALID_CHARS + "|')+|" + QUOTED_USER + ')';

// NOT USED   static final Pattern LEGAL_ASCII_PATTERN = Pattern.compile("^\\p{ASCII}+$");
// NOT USED   static final Pattern EMAIL_PATTERN = Pattern.compile("^(.+)@(.+)$");
  static final Pattern IP_DOMAIN_PATTERN = RegExp('^\\[(.*)\\]\$');
  static final Pattern TLD_PATTERN = RegExp('^([a-zA-Z]+)\$');

  static final Pattern USER_PATTERN = RegExp('^\\s*' + WORD + '(\\.' + WORD + ')*\$');
  static final Pattern DOMAIN_PATTERN = RegExp('^' + ATOM + '(\\.' + ATOM + ')*\\s*\$');
  static final Pattern ATOM_PATTERN = RegExp('(' + ATOM + ')');

  /// Singleton instance of this class.
  static final EmailValidator EMAIL_VALIDATOR = EmailValidator();

  /// Returns the Singleton instance of this validator.
  /// @return singleton instance of this validator.
  static EmailValidator getInstance() {
    return EMAIL_VALIDATOR;
  }

  /// Protected constructor for subclasses to use.
  EmailValidator();

  /// <p>Checks if a field has a valid e-mail address.</p>
  ///
  /// @param email The value validation is being performed on.  A <code>null</code>
  /// value is considered invalid.
  /// @return true if the email address is valid.
  bool isValid(String email) {
    return EmailValidator.getInstance().isValid(email);
  }

  /// Returns true if the domain component of an email address is valid.
  /// @param domain being validated.
  /// @return true if the email address's domain is valid.
  bool isValidDomain(String domain) {
    var symbolic = false;

    // see if domain is an IP address in brackets
    final ipDomainMatcher = IP_DOMAIN_PATTERN.allMatches(domain);

    if (ipDomainMatcher.isNotEmpty) {
      var inetAddressValidator = InetAddressValidator.getInstance();
      if (inetAddressValidator.isValid(ipDomainMatcher.first.input)) {
        return true;
      }
    } else {
      // Domain is symbolic name
      symbolic = DOMAIN_PATTERN.allMatches(domain).isNotEmpty;
    }

    if (!symbolic) {
      return false;
    }
    if (!isValidSymbolicDomain(domain)) {
      return false;
    }

    return true;
  }

  /// Returns true if the user component of an email address is valid.
  /// @param user being validated
  /// @return true if the user name is valid.
  bool isValidUser(String user) {
    return USER_PATTERN.allMatches(user).isNotEmpty;
  }

  /// Validates an IP address. Returns true if valid.
  /// @param ipAddress IP address
  /// @return true if the ip address is valid.
  bool isValidIpAddress(String ipAddress) {
    final ipAddressMatcher = [...IP_DOMAIN_PATTERN.allMatches(ipAddress)];
    for (var i = 1; i <= 4; i++) {
      // CHECKSTYLE IGNORE MagicNumber
      final ipSegment = ipAddressMatcher[i].input;
      if (ipSegment == null || ipSegment.isEmpty) {
        return false;
      }

      var iIpSegment = 0;

      try {
        iIpSegment = int.parse(ipSegment);
      } catch (e) {
        return false;
      }

      if (iIpSegment > 255) {
        // CHECKSTYLE IGNORE MagicNumber
        return false;
      }
    }
    return true;
  }

  /// Validates a symbolic domain name.  Returns true if it's valid.
  /// @param domain symbolic domain name
  /// @return true if the symbolic domain name is valid.
  bool isValidSymbolicDomain(String domain) {
    final domainSegment = <String>[]; // CHECKSTYLE IGNORE MagicNumber
    var match = true;
    var i = 0;
    final atomMatcher = [...ATOM_PATTERN.allMatches(domain)];
    while (match) {
      match = atomMatcher.isNotEmpty;
      if (match) {
        domainSegment[i] = atomMatcher[0].input;
        final l = domainSegment[i].length + 1;
        domain = (l >= domain.length) ? '' : domain.substring(l);

        i++;
      }
    }

    var len = i;

    // Make sure there's a host name preceding the domain.
    if (len < 2) {
      return false;
    }

    final tld = domainSegment[len - 1];
    if (tld.length <= 1) {
      return false;
    }
    if (TLD_PATTERN.allMatches(tld).isEmpty) {
      return false;
    }

    return true;
  }

  String stripComments(String emailStr) {
    var result = emailStr;
    var commentPat = '^((?:[^\"\\\\]|\\\\.)*(?:\"(?:[^\"\\\\]|\\\\.)*\"(?:[^\"\\\\]|\111111\\\\.)*)*)\\((?:[^()\\\\]|\\\\.)*\\)/';
    final commentMatcher = RegExp(commentPat);
    while (commentMatcher.allMatches(result).isNotEmpty) {
      result = result.replaceFirst(commentPat, '\1 ');
    }
    return result;
  }
}
