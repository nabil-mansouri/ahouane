part of 'mongo.dart';

extension DbExt on Db {
  Future<Map<String, dynamic>> createIndexExt(String collectionName,
      {String key,
      Map<String, dynamic> keys,
      bool unique,
      bool sparse,
      bool background,
      bool dropDups,
      int expireAfterSeconds,
      Map<String, dynamic> partialFilterExpression,
      String name}) {
    return Future.sync(() async {
      var selector = <String, dynamic>{};
      selector['ns'] = '$databaseName.$collectionName';
      keys = _setKeys(key, keys);
      selector['key'] = keys;

      if (unique == true) {
        selector['unique'] = true;
      } else {
        selector['unique'] = false;
      }
      if (sparse == true) {
        selector['sparse'] = true;
      }
      if (background == true) {
        selector['background'] = true;
      }
      if (dropDups == true) {
        selector['dropDups'] = true;
      }
      if (partialFilterExpression != null) {
        selector['partialFilterExpression'] = partialFilterExpression;
      }
      if (expireAfterSeconds != null) {
        selector['expireAfterSeconds'] = expireAfterSeconds;
      }
      name ??= _createIndexName(keys);
      selector['name'] = name;
      final insertMessage = MongoInsertMessage('$databaseName.${DbCommand.SYSTEM_INDEX_COLLECTION}', [selector]);
      executeMessage(insertMessage, WriteConcern.ACKNOWLEDGED);
      return getLastError();
    });
  }

  Map<String, dynamic> _setKeys(String key, Map<String, dynamic> keys) {
    if (key != null && keys != null) {
      throw ArgumentError('Only one parameter must be set: key or keys');
    }

    if (key != null) {
      keys = {};
      keys['$key'] = 1;
    }

    if (keys == null) {
      throw ArgumentError('key or keys parameter must be set');
    }

    return keys;
  }

  String _createIndexName(Map<String, dynamic> keys) {
    var name = '';

    keys.forEach((key, value) {
      name = '${name}_${key}_$value';
    });

    return name;
  }
}

extension ModifierBuilderExt on mongo.ModifierBuilder {
  void _updateOperation(String operator, String fieldName, value) {
    var opMap = map[operator] as Map<String, dynamic>;
    if (opMap == null) {
      opMap = <String, dynamic>{};
      map[operator] = opMap;
    }
    opMap[fieldName] = value;
  }

  ModifierBuilder addToSetAll(String fieldName, List values) {
    _updateOperation('\$addToSet', fieldName, {'\$each': values});
    return this;
  }
}

extension SelectorBuilderExt on mongo.SelectorBuilder {
  Map<String, dynamic> get _querys {
    if (!map.containsKey('\$query')) {
      map['\$query'] = <String, dynamic>{};
    }
    return map['\$query'] as Map<String, dynamic>;
  }

  void _addExpression(String fieldName, value) {
    final exprMap = {};
    exprMap[fieldName] = value;
    if (_querys.isEmpty) {
      _querys[fieldName] = value;
    } else {
      _addExpressionMap(exprMap);
    }
  }

  void _addExpressionMap(Map<String, dynamic> expr) {
    if (_querys.containsKey('\$and')) {
      final expressions = _querys['\$and'] as List;
      expressions.add(expr);
    } else {
      var expressions = [_querys];
      expressions.add(expr);
      map['\$query'] = {'\$and': expressions};
    }
  }

  SelectorBuilder elementMatch(String fieldName, mongo.SelectorBuilder selector) {
    comment(''); //init query field (QuerySet bool)
    _querys.remove('\$comment');
    final sub = {'\$elemMatch': selector.map['\$query']};
    _addExpression(fieldName, sub);
    return this;
  }
}
