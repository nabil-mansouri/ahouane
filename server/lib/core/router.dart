part of 'core.dart';

class RouterContext {
  final String route;
  final List<String> segments;
  final _params = <String, String>{};
  final _endpoints = <Endpoint>[];
  var _succeed = false;
  RouterContext(this.route, this.segments);
  factory RouterContext.empty(String route, List<String> segments) {
    return RouterContext(route, segments);
  }
  Map<String, String> get params => _params;
  List<Endpoint> get endpoints => _endpoints;
  bool get succeed => _succeed;
  bool get failed => !_succeed;
  RouterContext finish(bool result) {
    if (result) {
      _succeed = true;
    }
    return this;
  }

  RouterContext addAll(Set<Endpoint> endpoints) {
    _endpoints.addAll(endpoints);
    return this;
  }

  RouterContext addParam(String name, String value) {
    _params[name] = value;
    return this;
  }

  RouterContext clear() {
    _params.clear();
    _endpoints.clear();
    return this;
  }
}

class RouteSegment {
  final bool isParam;
  final String value;
  final int valueLen;
  final bool isWildcard;
  final String paramName;
  RouteSegment._(this.value)
      : valueLen = value?.length ?? 0,
        isWildcard = value == '*',
        isParam = StringUtils.startsAndEndsWith(value, '{', '}'),
        paramName = StringUtils.removeStartAndEnd(value, '{', '}');
  factory RouteSegment.fromValue(String value) => RouteSegment._(value?.trim());

  bool get isRoot => false;

  bool isSame(RouteSegment segment) =>
      segment is RouteSegment && value == segment?.value;

  bool canMatch(String value) {
    return isWildcard || isParam || match(value);
  }

  bool match(String segment) {
    return value == segment;
  }
}

class RouteSegmentIterator {
  int _current = 0;
  final List<String> _segments;
  RouteSegmentIterator._(this._segments);
  factory RouteSegmentIterator.parse(String route, String separator) {
    final pathSafe = StringUtils.removeStartAndEnd(route ?? '', separator);
    final segments = pathSafe.split(separator);
    return RouteSegmentIterator.fromSegments(segments);
  }

  factory RouteSegmentIterator.fromSegments(List<String> segments) {
    if (segments.isEmpty) {
      return RouteSegmentIterator._(['']);
    } else {
      return RouteSegmentIterator._(segments);
    }
  }
  List<String> get all => _segments;
  bool get isEmpty => _segments.isEmpty;
  String get current => _segments[_current];
  bool get hasCurrent => _current < _segments.length;
  bool get hasNext => _current < (_segments.length - 1);
  RouteSegmentIterator get next {
    _current++;
    return this;
  }
}

enum RouterTreeAction { Add, Remove }

class RouterTree {
  final children = <RouterTreeNode>{};
  RouterTree();

  @nonVirtual
  RouterTree updateTree(RouterTreeAction action, RouteSegmentIterator iterator,
      List<Endpoint> endpoints) {
    if (!iterator.hasCurrent) return this;
    final segment = RouteSegment.fromValue(iterator.current);
    var temp = children.firstWhere((test) => test.match(segment.value),
        orElse: () => RouterTreeNode(segment));
    // if not found add to children set
    children.add(temp);
    // update recursively
    if (iterator.hasNext) {
      temp.updateTree(action, iterator.next, endpoints);
    } else {
      if (action == RouterTreeAction.Add) {
        temp.endpoints.addAll(endpoints);
      } else {
        temp.endpoints.removeAll(endpoints);
      }
    }
    //clean children
    temp.children
        .removeWhere((test) => test.endpoints.isEmpty && test.children.isEmpty);
    return this;
  }

  @nonVirtual
  RouterContext find(RouteSegmentIterator iterator, RouterContext context) {
    if (!iterator.hasCurrent) return context;
    final currentValue = iterator.current;
    final wildcard = <RouterTreeNode>[],
        exact = <RouterTreeNode>[],
        param = <RouterTreeNode>[];
    for (final child in children) {
      if (child.isWildcard) {
        wildcard.add(child);
      } else if (child.isParam) {
        param.add(child);
      } else if (child.match(iterator.current)) {
        exact.add(child);
      } else {
        //Do nothing
      }
    }
    //add all wildcard matching
    wildcard.forEach((w) {
      context.addAll(w.endpoints);
    });
    //
    var founded = exact.isNotEmpty ? exact : param;
    if (iterator.hasNext) {
      founded.forEach((f) => f.find(iterator.next, context));
    } else {
      context.finish(founded.isNotEmpty);
      for (final found in founded) {
        context.addAll(found.endpoints);
      }
    }
    //if route founded=> save params
    if (context.succeed && exact.isEmpty) {
      for (final found in param) {
        context.addParam(found.segment.value, currentValue);
      }
    }
    return context;
  }

  @override
  String toString() {
    return '(' + children.map((f) => '(${f.toString()})').join('|') + ')';
  }
}

class RouterTreeNode extends RouterTree {
  final RouteSegment segment;
  final endpoints = <Endpoint>{};
  RouterTreeNode(this.segment);
  bool get isWildcard => segment.isWildcard;
  bool get isParam => segment.isParam;
  bool match(String value) => segment.match(value);
  @override
  String toString() {
    return '(' +
        segment.value +
        '->' +
        children.map((f) => '(${f.toString()})').join('|') +
        ')';
  }
}

class Router {
  final Storage<String> _trees;
  Router(this._trees);
  factory Router.inMemory() {
    return Router(Storage.inMemory());
  }
  Router register(String route, Endpoint endpoint) {
    final type = endpoint.type;
    final iterator = RouteSegmentIterator.parse(route, type.routeSeparator);
    if (iterator.isEmpty) return this;
    _trees.putIfAbsent(type.name, () => RouterTree());
    final tree = _trees.getByKey<RouterTree>(type.name);
    tree.updateTree(RouterTreeAction.Add, iterator, [endpoint]);
    return this;
  }

  Router unregister(String route, Endpoint endpoint) {
    final type = endpoint.type;
    final iterator = RouteSegmentIterator.parse(route, type.routeSeparator);
    if (iterator.isEmpty) return this;
    _trees.putIfAbsent(type.name, () => RouterTree());
    final tree = _trees.getByKey<RouterTree>(type.name);
    tree.updateTree(RouterTreeAction.Remove, iterator, [endpoint]);
    return this;
  }

  RouterContext find(EndpointType type, String route,
      {bool emptyIfNotMatch = true}) {
    final iterator = RouteSegmentIterator.parse(route, type.routeSeparator);
    if (_trees.containsKey(type.name)) {
      final result = _trees
          .getByKey<RouterTree>(type.name)
          .find(iterator, RouterContext(route, iterator.all));
      if (result.failed && emptyIfNotMatch) result.clear();
      return result;
    }
    return RouterContext.empty(route, iterator.all);
  }
}

//=== Module and extensions

final _kRouterApplicationContextKey = ApplicationContextKey<Router>('router');

class RouterModule extends ServerModule {
  RouterModule._(ServerApplication application) : super(application);
  RouterModule usingStorage(Storage storage) {
    application
        .context()
        .put<Router>(_kRouterApplicationContextKey, create(storage));
    return this;
  }

  Router defaultRouter() {
    return application
        .context()
        .getOrSet(_kRouterApplicationContextKey, () => create());
  }

  Router create([Storage storage]) {
    return Router(storage ?? Storage.inMemory());
  }
}
