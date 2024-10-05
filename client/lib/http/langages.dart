part of 'http.dart';

class Langage {
  final HeaderValue _value;
  final String valueLower;
  Langage._(this._value) : valueLower = _value?.value?.toLowerCase();
  factory Langage.parse(String value) {
    value = value ?? '';
    final _value = HeaderValue.parse(value);
    return Langage._(_value);
  }
  String get value => _value?.value ?? '';
  Map<String, String> get parameters =>
      _value?.parameters ?? <String, String>{};
}

class Langages {
  static Optional<Langage> isAcceptableLangage(
    List<Langage> acceptable,
    Langage lang,
  ) {
    acceptable.sort((c1, c2) {
      final q1 = num.parse(c1.parameters['q'] ?? '1.0');
      final q2 = num.parse(c2.parameters['q'] ?? '1.0');
      final comparison = q1.compareTo(q2);
      if (comparison == 0) {
        if (c1.value == '*' && c2.value != '*') {
          return 1;
        } else if (c1.value != '*' && c2.value == '*') {
          return -1;
        }
      }
      return -comparison;
    });
    final founded = acceptable.firstWhere((test) {
      return Langages.match(test, lang);
    }, orElse: () => null);
    return Optional.ofNullable((founded));
  }

  static Optional<Langage> parse(String headerValue) {
    try {
      return Optional.ofNullable(Langage.parse(headerValue));
    } catch (e) {
      return Optional.empty();
    }
  }

  static bool match(Langage expected, Langage actual) {
    if (expected == null || actual == null) return false;
    //same
    if (expected.valueLower == actual.valueLower) return true;
    // wildcard
    if (expected.valueLower == '*' || actual.valueLower == '*') {
      return true;
    }
    //lang vs iso
    if (expected.valueLower.contains('-${actual.valueLower}') ||
        expected.valueLower.contains('${actual.valueLower}-')) {
      return true;
    }
    if (actual.valueLower.contains('-${expected.valueLower}') ||
        actual.valueLower.contains('${expected.valueLower}-')) {
      return true;
    }
    return false;
  }
}
