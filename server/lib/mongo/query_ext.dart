part of 'mongo.dart';

extension QueryFilterExt on QueryFilter {
  SelectorBuilder toMongo(Logger logger) {
    if (hasCompare()) {
      return compare.toMongo(logger);
    } else if (hasLogical()) {
      return logical.toMongo(logger);
    } else if (hasLink()) {
      return link.toMongo(logger);
    } else if (hasSubQuery()) {
      return subQuery.toMongo(logger);
    } else {
      logger.warn(kLogKeys.invalidMongoFilter(), details: [toDebugString()]);
      return null;
    }
  }
}

extension QueryFilterCompareExt on QueryFilterCompare {
  SelectorBuilder toMongo(Logger logger) {
    final unwrapped = value.toNative(
        logger: logger, customNativeTransformer: MongoJsonToNativeTransformer);
    final fieldN = isid ? MongoDBService.ID : fieldName;
    switch (comparator) {
      case QueryFilterComparator.eq:
        return where.eq(fieldN, unwrapped);
      case QueryFilterComparator.neq:
        return where.ne(fieldN, unwrapped);
      case QueryFilterComparator.lt:
        return where.lt(fieldN, unwrapped);
      case QueryFilterComparator.lte:
        return where.lte(fieldN, unwrapped);
      case QueryFilterComparator.gt:
        return where.gt(fieldN, unwrapped);
      case QueryFilterComparator.gte:
        return where.gte(fieldN, unwrapped);
      case QueryFilterComparator.in_:
        return where.oneFrom(fieldN, unwrapped);
      case QueryFilterComparator.nin:
        return where.nin(fieldN, unwrapped);
      case QueryFilterComparator.contains:
        return where.eq(fieldN, BsonRegexp('$unwrapped'));
      case QueryFilterComparator.startsWith:
        return where.eq(fieldN, BsonRegexp('^$unwrapped'));
      case QueryFilterComparator.endsWith:
        return where.eq(fieldN, BsonRegexp('$unwrapped\$'));
      case QueryFilterComparator.exists:
        return unwrapped != false
            ? where.exists(fieldN)
            : where.notExists(fieldN);
    }
    logger.warn(kLogKeys.invalidMongoComparator(), details: [toDebugString()]);
    return null;
  }
}

extension QueryFilterLinkExt on QueryFilterLink {
  SelectorBuilder toMongo(Logger logger) {
    return where.eq('${foreignField.resource}', foreignId);
  }
}

extension SubQueryFilterMatchExt on SubQueryFilterMatch {
  SelectorBuilder toMongo(Logger logger) {
    final tmp = where.elementMatch(fieldName, filter.first.toMongo(logger));
    return tmp;
  }
}

extension QueryFilterLogicalExt on QueryFilterLogical {
  SelectorBuilder toMongo(Logger logger) {
    var current;
    for (final element in groups) {
      if (current == null) {
        current = element.toMongo(logger);
        continue;
      }
      switch (operation) {
        case QueryFilterLogical_Operator.and:
          current.and(element.toMongo(logger));
          break;
        case QueryFilterLogical_Operator.or:
          current.or(element.toMongo(logger));
          break;
        case QueryFilterLogical_Operator.not:
        case QueryFilterLogical_Operator.nor:
        case QueryFilterLogical_Operator.nand:
          logger.warn(kLogKeys.mongoNotOperator(), details: [toDebugString()]);
          break;
        default:
          logger.warn(kLogKeys.mongoLogicalOperatorNotFound(),
              details: [operation, toDebugString()]);
          break;
      }
    }
    if (current == null) {
      return where;
    }
    return current;
  }
}

//values
//Query

extension MongoQueryExt on Query {
  SelectorBuilder toMongo(Logger logger) {
    SelectorBuilder current;
    for (final filter in filters) {
      if (current == null) {
        current = filter.toMongo(logger);
        continue;
      }
      current.and(filter.toMongo(logger));
    }
    current ??= where;
    for (final proj in projections) {
      current.fields(<String>[proj.fieldName]);
    }
    for (final sort in sorts) {
      current.sortBy(sort.fieldName, descending: sort.descending == false);
    }
    if (joins.isNotEmpty) {
      logger.warn(kLogKeys.mongoJoin());
    }
    if (hasSkip()) current.skip(skip);
    if (hasLimit()) current.limit(limit);
    return current;
  }
}
