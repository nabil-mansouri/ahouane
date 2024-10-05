part of 'validation.dart';

class RegexValidator {
  final List<Pattern> patterns;

  /// Construct a <i>case sensitive</i> validator for a single
  /// regular expression.
  ///
  /// @param regex The regular expression this validator will
  /// validate against
  static RegexValidator regex(String regex) => RegexValidator.regCase(regex, true);

  /// Construct a validator for a single regular expression
  /// with the specified case sensitivity.
  ///
  /// @param regex The regular expression this validator will
  /// validate against
  /// @param caseSensitive when <code>true</code> matching is <i>case
  /// sensitive</i>, otherwise matching is <i>case in-sensitive</i>
  static RegexValidator regCase(String regex, bool caseSensitive) => RegexValidator.create([regex], caseSensitive);

  /// Construct a <i>case sensitive</i> validator that matches any one
  /// of the set of regular expressions.
  ///
  /// @param regexs The set of regular expressions this validator will
  /// validate against
  static RegexValidator list(List<String> regexs) => RegexValidator.create(regexs, true);

  /// Construct a validator that matches any one of the set of regular
  /// expressions with the specified case sensitivity.
  ///
  /// @param regexs The set of regular expressions this validator will
  /// validate against
  /// @param caseSensitive when <code>true</code> matching is <i>case
  /// sensitive</i>, otherwise matching is <i>case in-sensitive</i>
  factory RegexValidator.create(List<String> regexs, bool caseSensitive) {
    if (regexs == null || regexs.isEmpty) {
      throw 'Regular expressions are missing';
    }
    final patterns = <Pattern>[];
    for (var i = 0; i < regexs.length; i++) {
      if (regexs[i] == null || regexs[i].isEmpty) {
        throw 'Regular expression[$i] is missing';
      }
      patterns[i] = RegExp(regexs[i], caseSensitive: caseSensitive);
    }
    return RegexValidator(patterns);
  }

  RegexValidator(this.patterns);

  /// Validate a value against the set of regular expressions.
  ///
  /// @param value The value to validate.
  /// @return <code>true</code> if the value is valid
  /// otherwise <code>false</code>.
  bool isValid(String value) {
    if (value == null) {
      return false;
    }
    for (var i = 0; i < patterns.length; i++) {
      if (patterns[i].allMatches(value).isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  /// Validate a value against the set of regular expressions
  /// returning the array of matched groups.
  ///
  /// @param value The value to validate.
  /// @return String array of the <i>groups</i> matched if
  /// valid or <code>null</code> if invalid
  List<String> match(String value) {
    if (value == null) {
      return null;
    }
    for (var i = 0; i < patterns.length; i++) {
      final matcher = [...patterns[i].allMatches(value)];
      if (matcher.isNotEmpty) {
        var count = matcher.length;
        final groups = <String>[];
        for (var j = 0; j < count; j++) {
          groups[j] = matcher[j].input;
        }
        return groups;
      }
    }
    return null;
  }

  /// Validate a value against the set of regular expressions
  /// returning a String value of the aggregated groups.
  ///
  /// @param value The value to validate.
  /// @return Aggregated String value comprised of the
  /// <i>groups</i> matched if valid or <code>null</code> if invalid
  String validate(String value) {
    if (value == null) {
      return null;
    }
    for (var i = 0; i < patterns.length; i++) {
      final matcher = [...patterns[i].allMatches(value)];
      if (matcher.isNotEmpty) {
        var count = matcher.length;
        if (count == 1) {
          return matcher[0].input;
        }
        var buffer = StringBuffer();
        for (var j = 0; j < count; j++) {
          final component = matcher[j].input;
          if (component != null) {
            buffer.write(component);
          }
        }
        return buffer.toString();
      }
    }
    return null;
  }

  /// Provide a String representation of this validator.
  /// @return A String representation of this validator
  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.write('RegexValidator{');
    for (var i = 0; i < patterns.length; i++) {
      if (i > 0) {
        buffer.write(',');
      }
      buffer.write(patterns[i].toString());
    }
    buffer.write('}');
    return buffer.toString();
  }
}
