library ahouane.db.client;

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/db.pbgrpc.dart';
import 'package:ahouane_common/generated/db.pbenum.dart';
import 'package:ahouane_common/core/core.dart';
import 'package:optional/optional.dart';
import 'package:meta/meta.dart';
export 'package:ahouane_common/generated/db.pbgrpc.dart';
export 'package:ahouane_common/generated/db.pbenum.dart';

class DBErrors {
  static const forbidden = 'db.errors.forbidden';
  static const badRequest = 'db.errors.badRequest';
}

class DBObject {
  final JsonObjectValue _value;
  DBObject(this._value);
  JsonObjectValue get() => _value;
}

class DBObjectStream {
  final Stream<JsonObjectValue> _value;
  DBObjectStream(this._value);
  Stream<JsonObjectValue> get() => _value;
}

abstract class QueryFilterBuilder<ID> {
  QueryFilterBuilder id(ID id);
  QueryFilterBuilder idIn(Iterable<ID> values);
  QueryFilterBuilder idNotIn(Iterable<ID> values);
  QueryFilterBuilder idStartsWith(String text);
  QueryFilterBuilder eq(String fieldName, JsonValue json);
  QueryFilterBuilder neq(String fieldName, JsonValue json);
  QueryFilterBuilder lt(String fieldName, JsonValue json);
  QueryFilterBuilder lte(String fieldName, JsonValue json);
  QueryFilterBuilder gt(String fieldName, JsonValue json);
  QueryFilterBuilder gte(String fieldName, JsonValue json);
  QueryFilterBuilder isIn(String fieldName, Iterable<JsonValue> json);
  QueryFilterBuilder notIn(String fieldName, Iterable<JsonValue> json);
  QueryFilterBuilder contains(String fieldName, String text);
  QueryFilterBuilder startsWith(String fieldName, String text);
  QueryFilterBuilder endsWith(String fieldName, String text);
  QueryFilterBuilder exists(String fieldName);
  QueryFilterBuilder subQueryMatch(String field, QueryBuilder subQuery);
  QueryFilterBuilder isLinkedTo(String foreignResource, {@required String foreignId, String foreignFieldName});
}

class QueryBuilder<ID> implements QueryFilterBuilder<ID> {
  final _query = Query();
  QueryFilterLogical _currentLogical;
  static QueryFilterBuilder<ID> _create<ID>() => QueryBuilder<ID>._forResource('');
  Query build() => _query;
  QueryBuilder._forResource(String resource) {
    _query.resource = resource;
  }
  factory QueryBuilder.fromQuery(Query query) {
    final builder = QueryBuilder._create() as QueryBuilder;
    builder._query.mergeFromMessage(query);
    return builder;
  }
  bool get hasFilters => rootClauses.isNotEmpty;
  List<QueryFilter> get rootClauses => _query.filters;
  QueryBuilder project(String field, [String alias]) {
    _query.projections.add(QueryProjection()
      ..fieldName = field
      ..alias = alias);
    return this;
  }

  DBForeignField foreignField(String resource, {String fieldName}) {
    return DBForeignField()
      ..resource = resource
      ..fieldName = fieldName ?? 'id';
  }

  @override
  QueryBuilder id(ID id) {
    final value = id is int ? (JsonValue()..intValue = Int64(id)) : (JsonValue()..stringValue = '$id');
    final compare = QueryFilterCompare()
      ..comparator = QueryFilterComparator.eq
      ..fieldName = 'id'
      ..isid = true
      ..value = value;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  QueryBuilder sortAsc(String field) => sort(field, false);

  QueryBuilder sortDesc(String field) => sort(field, true);

  QueryBuilder sort(String field, bool descending) {
    _query.sorts.add(QuerySort()
      ..fieldName = field
      ..descending = descending);
    return this;
  }

  QueryBuilder skip(int skip) {
    _query.skip = skip;
    return this;
  }

  QueryBuilder limit(int limit) {
    _query.limit = limit;
    return this;
  }

  QueryBuilder _startLogicalGroupIfNeeded(QueryFilterLogical_Operator op) {
    if (_currentLogical == null || _currentLogical.operation != op) {
      _currentLogical = QueryFilterLogical()..operation = op;
      _query.filters.add(QueryFilter()..logical = _currentLogical);
    }
    return this;
  }

  QueryBuilder where(QueryBuilder clause) {
    return and(clause);
  }

  @override
  QueryBuilder isLinkedTo(String foreignResource, {@required String foreignId, String foreignFieldName}) {
    final link = QueryFilterLink()
      ..foreignId = foreignId
      ..foreignField = foreignField(foreignResource, fieldName: foreignFieldName);
    _query.filters.add(QueryFilter()..link = link);
    return this;
  }

  QueryBuilder and(QueryBuilder clause) {
    final val = _toLogicalFilter(clause);
    if (val.isNotEmpty) {
      _startLogicalGroupIfNeeded(QueryFilterLogical_Operator.and);
      _currentLogical.groups.add(val.value);
    }
    return this;
  }

  QueryBuilder nand(QueryBuilder clause) {
    final val = _toLogicalFilter(clause);
    if (val.isNotEmpty) {
      _startLogicalGroupIfNeeded(QueryFilterLogical_Operator.nand);
      _currentLogical.groups.add(val.value);
    }
    return this;
  }

  QueryBuilder or(QueryBuilder clause) {
    final val = _toLogicalFilter(clause);
    if (val.isNotEmpty) {
      _startLogicalGroupIfNeeded(QueryFilterLogical_Operator.or);
      _currentLogical.groups.add(val.value);
    }
    return this;
  }

  QueryBuilder nor(QueryBuilder clause) {
    final val = _toLogicalFilter(clause);
    if (val.isNotEmpty) {
      _startLogicalGroupIfNeeded(QueryFilterLogical_Operator.nor);
      _currentLogical.groups.add(val.value);
    }
    return this;
  }

  QueryBuilder not(QueryBuilder clause) {
    final val = _toLogicalFilter(clause);
    if (val.isNotEmpty) {
      _startLogicalGroupIfNeeded(QueryFilterLogical_Operator.not);
      _currentLogical.groups.add(val.value);
    }
    return this;
  }

  @override
  QueryBuilder eq(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.eq);
  }

  JsonValue _ids(Iterable<ID> values) {
    final jValues = values.map((e) => (e is String) ? e.asJsonValue() : (e as int).asJsonValue()).toList();
    final value = JsonValue()..array = JsonArrayValue();
    value.array.value.addAll(jValues);
    return value;
  }

  @override
  QueryBuilder idIn(Iterable<ID> values) {
    final compare = QueryFilterCompare()
      ..fieldName = 'id'
      ..isid = true
      ..value = _ids(values)
      ..comparator = QueryFilterComparator.in_;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  @override
  QueryFilterBuilder idNotIn(Iterable<ID> values) {
    final compare = QueryFilterCompare()
      ..fieldName = 'id'
      ..isid = true
      ..value = _ids(values)
      ..comparator = QueryFilterComparator.nin;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  QueryFilterBuilder _filter(String fieldName, JsonValue value, QueryFilterComparator comp, {bool isid}) {
    final compare = QueryFilterCompare()
      ..fieldName = fieldName
      ..value = value
      ..isid = isid
      ..comparator = comp;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  @override
  QueryFilterBuilder contains(String fieldName, String text) {
    return _filter(fieldName, text.asJsonValue(), QueryFilterComparator.contains);
  }

  @override
  QueryFilterBuilder idStartsWith(String text) {
    return _filter('id', text.asJsonValue(), QueryFilterComparator.startsWith, isid: true);
  }

  @override
  QueryFilterBuilder startsWith(String fieldName, String text) {
    return _filter(fieldName, text.asJsonValue(), QueryFilterComparator.startsWith);
  }

  @override
  QueryFilterBuilder endsWith(String fieldName, String text) {
    return _filter(fieldName, text.asJsonValue(), QueryFilterComparator.endsWith);
  }

  @override
  QueryFilterBuilder exists(String fieldName) {
    return _filter(fieldName, null, QueryFilterComparator.exists);
  }

  @override
  QueryFilterBuilder gt(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.gt);
  }

  @override
  QueryFilterBuilder gte(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.gte);
  }

  @override
  QueryFilterBuilder lt(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.lt);
  }

  @override
  QueryFilterBuilder lte(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.lte);
  }

  @override
  QueryFilterBuilder neq(String fieldName, JsonValue value) {
    return _filter(fieldName, value, QueryFilterComparator.neq);
  }

  @override
  QueryFilterBuilder notIn(String fieldName, Iterable<JsonValue> values) {
    final compare = QueryFilterCompare()
      ..fieldName = fieldName
      ..value = _values(values)
      ..comparator = QueryFilterComparator.nin;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  Optional<QueryFilter> _toLogicalFilter(QueryBuilder query) {
    final subFilters = query.build().filters;
    if (subFilters.isEmpty) {
      return Optional.empty();
    } else if (subFilters.length == 1) {
      return Optional.of(subFilters.first);
    }
    final logical = QueryFilterLogical()
      ..groups.addAll(subFilters)
      ..operation = QueryFilterLogical_Operator.and;
    return Optional.of(QueryFilter()..logical = logical);
  }

  @override
  QueryFilterBuilder subQueryMatch(String field, QueryBuilder subQuery) {
    final subRoot = _toLogicalFilter(subQuery);
    if (subRoot.isNotEmpty) {
      final sub = SubQueryFilterMatch()
        ..fieldName = field
        ..filter.add(subRoot.value);
      _query.filters.add(QueryFilter()..subQuery = sub);
    }
    return this;
  }

  @override
  QueryFilterBuilder isIn(String fieldName, Iterable<JsonValue> values) {
    if (values.length == 1) {
      return eq(fieldName, values.first);
    }
    final compare = QueryFilterCompare()
      ..fieldName = fieldName
      ..value = _values(values)
      ..comparator = QueryFilterComparator.in_;
    _query.filters.add(QueryFilter()..compare = compare);
    return this;
  }

  JsonValue _values(Iterable<JsonValue> values) {
    final jValues = values.toList();
    final value = JsonValue()..array = JsonArrayValue();
    value.array.value.addAll(jValues);
    return value;
  }
}

class _ResourceQuery<ID> {
  final DBModule module;
  final String resource;
  _ResourceQuery(this.module, this.resource);
  DBServiceClient get _service => module._service;
  DBAdminServiceClient get _serviceAdmin => module._serviceAdmin;
  Future<List<String>> createMany(DBObjectStream objects) {
    final stream = objects.get().map(
          (e) => CreatePayload()
            ..resource = resource
            ..value = e,
        );
    return _service.create(stream).map((event) => event.id).toList();
  }

  _DBShare share(String id) => _DBShare(module, module.query().id(id).build()..resource = resource);

  _DBShare shareAll(List<String> id) => _DBShare(module, module.query().idIn(id).build()..resource = resource);

  Future<String> createOne(DBObject object) {
    final stream = Stream.value(CreatePayload()
      ..resource = resource
      ..value = object.get());
    return _service.create(stream).map((event) => event.id).first;
  }

  Future<int> createIndex(
    List<QuerySort> fields, {
    String name,
    bool unique,
    int expireAfterSeconds,
  }) {
    return _serviceAdmin
        .createIndex(CreateIndexPayload()
          ..resource = resource
          ..fields.addAll(fields)
          ..name = name
          ..unique = unique
          ..expireAfterSeconds = expireAfterSeconds)
        .then((e) => e.nbIndex);
  }

  Future<int> delete(QueryBuilder where) async {
    final res = await _service.delete(DeletePayload()..query = QueryBuilder._forResource(resource).and(where).build());
    return res.nbDeleted;
  }

  Future<int> count(QueryBuilder builder) async {
    final query = builder.build();
    query.resource = resource;
    final res = await _service.count(FetchPayload()..query = query);
    return res.count;
  }

  Stream<JsonObject> fetch(QueryBuilder builder) async* {
    final query = builder.build();
    query.resource = resource;
    final res = _service.fetch(FetchPayload()..query = query);
    await for (final r in res) {
      yield r.toJsonObject();
    }
  }

  Future<Optional<JsonObject>> fetchOne(ID id) async {
    final query = module.query().id(id).limit(1).build();
    query.resource = resource;
    final res = await _service.fetchOne(FetchPayload()..query = query);
    return res.hasObject() ? Optional.of(res.object.toJsonObject()) : Optional.empty();
  }

  Future<Optional<JsonObject>> fetchOneByQuery(QueryBuilder builder) async {
    final query = builder.limit(1).build();
    query.resource = resource;
    final res = await _service.fetchOne(FetchPayload()..query = query);
    return res.hasObject() ? Optional.of(res.object.toJsonObject()) : Optional.empty();
  }

  Future<int> patch(QueryBuilder query, DBObject json, {bool multiple = false, bool upsert = false}) {
    return patchBuilder(query, multiple: multiple, upsert: upsert).merge(json).end();
  }

  _DBPatchBuilder patchBuilder(QueryBuilder query, {bool multiple = false, bool upsert = false}) {
    return _DBPatchBuilder.create(module, resource, query, multiple: multiple, upsert: upsert);
  }

  _DBPatchBuilder patchOneBuilder(ID id, {bool upsert = false}) {
    return patchBuilder(module.query().id(id), multiple: false, upsert: upsert);
  }

  Future<int> update(QueryBuilder query, DBObject json, {bool upsert = false, bool multiple = false}) async {
    final res = await _service.update(UpdatePayload()
      ..upsert = upsert
      ..multiple = multiple
      ..query = QueryBuilder._forResource(resource).where(query).build()
      ..value = json.get());
    return res.nbModified;
  }

  Future<int> linkToOne(
    QueryBuilder query, {
    @required String foreignResource,
    @required String foreignId,
  }) {
    return patchBuilder(query).linkToOne(foreignResource: foreignResource, foreignId: foreignId).end();
  }

  Future<int> unlinkToOne(
    QueryBuilder query, {
    @required String foreignResource,
    @required String foreignId,
  }) {
    return patchBuilder(query).unlinkToOne(foreignResource: foreignResource, foreignId: foreignId).end();
  }

  Future<int> updateOne(ID id, DBObject json, {bool upsert = false}) async {
    return update(module.query().id(id), json, upsert: upsert);
  }

  Future<int> patchOne(ID id, DBObject json) async {
    return patch(module.query().id(id), json, multiple: false);
  }

  Future<int> deleteOne(ID id) async {
    return delete(module.query().id(id));
  }

  Future<int> linkOneToOne(
    ID sourceId, {
    @required String foreignResource,
    @required String foreignId,
  }) {
    return patchOneBuilder(sourceId).linkToOne(foreignResource: foreignResource, foreignId: foreignId).end();
  }

  Future<int> unlinkOneToOne(
    ID sourceId, {
    @required String foreignResource,
    @required String foreignId,
  }) {
    return patchOneBuilder(sourceId).unlinkToOne(foreignResource: foreignResource, foreignId: foreignId).end();
  }

  Future<int> linkOneToMany(
    ID sourceId, {
    @required String foreignResource,
    @required List<String> foreignId,
  }) {
    return patchOneBuilder(sourceId).linkToMany(foreignResource: foreignResource, foreignId: foreignId).end();
  }

  Future<int> unlinkOneToMany(
    ID sourceId, {
    @required String foreignResource,
    @required List<String> foreignId,
  }) {
    return patchOneBuilder(sourceId).unlinkToMany(foreignResource: foreignResource, foreignId: foreignId).end();
  }
}

class DBModule<ID> extends ClientModule {
  final DBServiceClient _service;
  final DBAdminServiceClient _serviceAdmin;
  DBModule(ClientApplication app)
      : _service = DBServiceClient(app.createChannel()),
        _serviceAdmin = DBAdminServiceClient(app.createChannel()),
        super(app);

  DBForeignField foreignField(String resource, {String fieldName}) {
    return QueryBuilder._forResource('').foreignField(resource, fieldName: fieldName);
  }

  _ResourceQuery resource(String resource) => _ResourceQuery(this, resource);

  QueryBuilder<ID> query() => QueryBuilder._create<ID>();

  T toProto<T extends GeneratedMessage>(JsonObject object, T example, [TypeRegistry registry]) {
    return example.createEmptyInstance()
      ..mergeFromProto3JsonSafe(object.asRecursiveMap(), ignoreUnknownFields: true, typeRegistry: registry);
  }

  DBObject fromJson(JsonObject json) {
    final proto = json.toProto();
    return DBObject(proto.object);
  }

  DBObject fromProto(GeneratedMessage message) {
    final map = message.toJsonValue(
        override: (info, value, registry) {
          if (value is Timestamp) {
            return JsonValue()..custom = Any.pack(DBValue()..dateValue = value);
          }
          return null;
        },
        skipEmptyFields: true);
    return DBObject(map.object);
  }

  DBObjectStream fromJsonArray(JsonArray json) {
    final stream = Stream.fromIterable(
      json.asList().whereType<JsonObject>().cast<JsonObject>().map((e) => fromJson(e)._value),
    );
    return DBObjectStream(stream);
  }

  DBObjectStream fromProtoList(List<GeneratedMessage> json) {
    final stream = Stream.fromIterable(json.map((e) => fromProto(e)._value));
    return DBObjectStream(stream);
  }

  DBObjectStream fromProtoStream(Stream<GeneratedMessage> json) {
    final stream = json.map((e) => fromProto(e)._value);
    return DBObjectStream(stream);
  }
}

extension ClientApplicationDB on ClientApplication {
  DBModule<ID> db<ID>() => DBModule<ID>(this);
}

class _DBShare {
  final DBModule module;
  final _payload = DBSharePayload();
  _DBShare(this.module, Query query) {
    _payload.query = query;
  }
  _DBShare addUser(String id, {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(DBShareRow()
      ..user = id
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _DBShare addRole(String id, {bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(DBShareRow()
      ..role = id
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _DBShare addAuthenticatedUser({bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(DBShareRow()
      ..authenticated = true
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _DBShare addPublic({bool read = false, bool write = false, bool manage = false}) {
    _payload.toAdd.add(DBShareRow()
      ..public = true
      ..read = read
      ..write = write
      ..manage = manage);
    return this;
  }

  _DBShare removeUser(String id) {
    _payload.toRemove.add(DBShareRow()..user = id);
    return this;
  }

  _DBShare removeRole(String id) {
    _payload.toRemove.add(DBShareRow()..role = id);
    return this;
  }

  _DBShare removePublic() {
    _payload.toRemove.add(DBShareRow()..public = true);
    return this;
  }

  _DBShare removeAuthenticated() {
    _payload.toRemove.add(DBShareRow()..authenticated = true);
    return this;
  }

  Future<void> end() async {
    await module._service.share(_payload);
  }
}

class _DBPatchBuilder {
  final _payload = PatchPayload();
  final DBModule module;
  _DBPatchBuilder.create(this.module, String resource, QueryBuilder query, {bool upsert = false, bool multiple}) {
    _payload
      ..upsert = upsert
      ..multiple = multiple
      ..query = QueryBuilder._forResource(resource).where(query).build();
  }
  _DBPatchBuilder _addToSet(
    String field,
    List<DBObject> json,
    bool add,
  ) {
    final listOpe = DBPatchListOperation()
      ..fieldName = field
      ..add = add
      ..values.addAll(json.map((e) => e._value).toList());
    _payload.operation.add(DBPatchOperation()..listOpe = listOpe);
    return this;
  }

  _DBPatchBuilder addToSet(String field, List<DBObject> json) {
    return _addToSet(field, json, true);
  }

  _DBPatchBuilder removeFromSet(String field, List<DBObject> json) {
    return _addToSet(field, json, false);
  }

  _DBPatchBuilder linkToOne({
    @required String foreignResource,
    @required String foreignId,
    String foreignFieldName,
  }) {
    return _link(
      foreignResource: foreignResource,
      foreignId: [foreignId],
      foreignFieldName: foreignFieldName,
      link: true,
    );
  }

  _DBPatchBuilder linkToMany({
    @required String foreignResource,
    @required List<String> foreignId,
    String foreignFieldName,
  }) {
    return _link(
      foreignResource: foreignResource,
      foreignId: [...foreignId],
      foreignFieldName: foreignFieldName,
      link: true,
    );
  }

  _DBPatchBuilder unlinkToMany({
    @required String foreignResource,
    @required List<String> foreignId,
    String foreignFieldName,
  }) {
    return _link(
      foreignResource: foreignResource,
      foreignId: [...foreignId],
      foreignFieldName: foreignFieldName,
      link: false,
    );
  }

  _DBPatchBuilder unlinkToOne({
    @required String foreignResource,
    @required String foreignId,
    String foreignFieldName,
  }) {
    return _link(
      foreignResource: foreignResource,
      foreignId: [foreignId],
      foreignFieldName: foreignFieldName,
      link: false,
    );
  }

  _DBPatchBuilder _link({
    @required String foreignResource,
    @required List<String> foreignId,
    @required bool link,
    String foreignFieldName,
  }) {
    final linkOpe = DBLinkOperation()
      ..foreignId.addAll(foreignId)
      ..foreignField = module.foreignField(foreignResource, fieldName: foreignFieldName)
      ..link = link;
    _payload.operation.add(DBPatchOperation()..link = linkOpe);
    return this;
  }

  _DBPatchBuilder merge(DBObject json) {
    final ope = (DBPatchUpdateOperation()..data.addAll(json.get().value));
    _payload.operation.add(DBPatchOperation()..updateOp = ope);
    return this;
  }

  Future<int> end() async {
    final res = module._service.patch(Stream.value(_payload));
    return res.first.then((value) => value.nbModified);
  }
}
