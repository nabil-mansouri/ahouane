part of 'core.dart';

class LogKey {
  final String key;
  final String description;
  final List<String> tags;
  const LogKey(this.key, {this.description, this.tags = const <String>[]});
}

class LogKeys {
  const LogKeys();
  LogKey invalidJsonListElement() => const LogKey('invalidJsonListElement', description: 'invalid element in list');
  LogKey invalidJsonString() => const LogKey('invalidJsonString', description: 'invalid json string');
  LogKey invalidJsonObject() => const LogKey('invalidJsonObject', description: 'object is neither a list or a map');
  LogKey invalidJsonMapEntry(String key) => LogKey('invalidJsonMapEntry', description: 'invalid entry for key=$key');
  LogKey missingUnwrapper() => LogKey('missingUnwrapper', description: 'Could not found any unwrapper for custom property');
  LogKey invalidUnwrapType() => LogKey('invalidUnwrapType', description: 'Cannot determine the type for current attribute');
  LogKey invalidWrapValue() => LogKey('invalidWrapValue', description: 'Cannot wrap value using wrapper');
  LogKey invalidJsonValue() => LogKey('invalidJsonValue', description: 'Cannot determine type of value');
}

const kLogKeys = LogKeys();
