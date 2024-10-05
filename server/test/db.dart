import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_client/db.dart';
import 'package:ahouane_client/auth.dart';
import 'package:test/test.dart';

void db(
  ClientApplication app, {
  ClientApplication clientAdmin,
  String resource,
  JsonObject jsonExample,
  JsonObject update,
  QueryFilterBuilder where,
  JsonObject patch,
}) {
  group('[Db]', () {
    final db = app.db<String>();
    final auth = app.auth();
    String id;
    setUpAll(() async {
      final user = await auth.createUserByEmail('db@test.com', 'password');
      expect(user, isNotNull);
      await clientAdmin.db().resource(resource).delete(db.query());
      final res = clientAdmin.db().resource(resource).fetch(db.query());
      final list = await res.toList();
      expect(list.length, equals(0));
    });
    test('Should create json', () async {
      id = await db.resource(resource).createOne(db.fromJson(jsonExample));
      expect(id.isNotEmpty, isTrue);
      final fetch1 = (await db.resource(resource).fetchOne(id)).value;
      expect(fetch1.getString('id'), isNotNull);
      expect(fetch1.getString('createdAt'), isNotNull);
      expect(fetch1.getString('updatedAt'), isNotNull);
      fetch1
        ..remove('id')
        ..remove('createdAt')
        ..remove('updatedAt')
        ..remove('_creator');
      expect(fetch1.asJsonString(), equals(jsonExample.asJsonString()));
    });
    test('Should fetch multiple json', () async {
      final rr = resource + '_1';
      await db.resource(rr).delete(db.query());
      final fetch0 = (db.resource(rr).fetch(db.query()));
      final fetch0List = await fetch0.toList();
      expect(fetch0List.length, equals(0));
      final ids = await db.resource(rr).createMany(
            db.fromJsonArray(
              JsonArray().addJson(jsonExample).addJson(JsonObject.fromJson(jsonExample)),
            ),
          );
      expect(ids.length, equals(2));
      final fetch1 = (db.resource(rr).fetch(db.query()));
      final fetch1List = await fetch1.toList();
      expect(fetch1List.length, equals(2));
    });
    test('Should update', () async {
      final up1 = await db.resource(resource).update(where, db.fromJson(update));
      expect(up1, equals(1));
      final fetch1 = (await db.resource(resource).fetchOneByQuery(where)).value;
      fetch1
        ..remove('id')
        ..remove('createdAt')
        ..remove('updatedAt');
      expect(fetch1.asJsonString(), equals(update.asJsonString()));
      final up2 = await db.resource(resource).updateOne(id, db.fromJson(update..putBool('fromid', true)));
      expect(up2, equals(1));
      final fetch2 = (await db.resource(resource).fetchOneByQuery(where)).value;
      fetch2
        ..remove('id')
        ..remove('createdAt')
        ..remove('updatedAt');
      expect(fetch2.asJsonString(), equals(update.asJsonString()));
    });
    test('Should patch', () async {
      final pa1 = await db.resource(resource).patch(where, db.fromJson(patch));
      expect(pa1, equals(1));
      final fetch1 = (await db.resource(resource).fetchOneByQuery(where)).value;
      for (final key in patch.keys) {
        expect(fetch1.asMap()[key].toString(), equals(patch.asMap()[key].toString()));
      }
      final pa2 = await db.resource(resource).patchOne(id, db.fromJson(patch));
      expect(pa2, equals(1));
      final fetch2 = (await db.resource(resource).fetchOne(id)).value;
      for (final key in patch.keys) {
        expect(fetch2.asMap()[key].toString(), equals(patch.asMap()[key].toString()));
      }
    });
    test('Should delete', () async {
      final del1 = await db.resource(resource).delete(where);
      expect(del1, equals(1));
      final del2 = await db.resource(resource).deleteOne(id);
      expect(del2, equals(0));
      final up1 = db.resource(resource).fetch(where);
      expect(await up1.length, equals(0));
      final up2 = (await db.resource(resource).fetchOne(id)).orElse(null);
      expect(up2, isNull);
    });
    test('Should not be accessible when logout', () async {
      await auth.logout();
      try {
        db.resource(resource).fetch(db.query());
      } catch (e) {
        expect(app.getError(e), equals(AuthErrors.unauthorized));
      }
    });

    group('[Interceptor]', () {
      final appAuth = ClientApplication(app.config);
      final appNotAuth = ClientApplication(app.config);
      String user2Id;
      String id;
      setUpAll(() async {
        await app.auth().loginInByEmail('db@test.com', 'password');
        final auth2 = appAuth.auth();
        await auth2.createUserByEmail('db2@test.com', 'password');
        final user2 = await auth2.currentUser();
        expect(user2.isPresent, isTrue);
        user2Id = user2.value.id;
        id = await app.db().resource('testprotected').createOne(db.fromJson(jsonExample));
      });
      test('Should share file to everyone', () async {
        await app.db().resource('testprotected').share(id).addPublic(read: true).end();
        final contentAuth = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(contentAuth.isPresent, isTrue);
        final contentNotAuth = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(contentNotAuth.isPresent, isTrue);
        final count = await appAuth.db().resource('testprotected').updateOne(id, db.fromJson(jsonExample));
        expect(count, equals(0));
      });

      test('Should unshare file to everyone', () async {
        await app.db().resource('testprotected').share(id).removePublic().end();
        final res1 = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res2.isEmpty, isTrue);
      });

      test('Should share file to authenticated', () async {
        await app.db().resource('testprotected').share(id).addAuthenticatedUser(read: true).end();
        final contentAuth = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(contentAuth.isPresent, isTrue);
        final res1 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appAuth.db().resource('testprotected').updateOne(id, db.fromJson(jsonExample));
        expect(res2, equals(0));
      });

      test('Should unshare file to authenticated', () async {
        await app.db().resource('testprotected').share(id).removeAuthenticated().end();
        final res1 = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res2.isEmpty, isTrue);
      });

      test('Should share file to role user', () async {
        await app.db().resource('testprotected').share(id).addRole('user', read: true).end();
        final contentAuth = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(contentAuth.isPresent, isTrue);
        final res1 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appAuth.db().resource('testprotected').updateOne(id, db.fromJson(jsonExample));
        expect(res2, equals(0));
      });

      test('Should unshare file to role user', () async {
        await app.db().resource('testprotected').share(id).removeRole('user').end();
        final res1 = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res2.isEmpty, isTrue);
      });

      test('Should share file to user id', () async {
        await app.db().resource('testprotected').share(id).addUser(user2Id, read: true).end();
        final contentAuth = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(contentAuth.isPresent, isTrue);
        final res1 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appAuth.db().resource('testprotected').updateOne(id, db.fromJson(jsonExample));
        expect(res2, equals(0));
      });

      test('Should unshare file to user id', () async {
        await app.db().resource('testprotected').share(id).removeUser(user2Id).end();
        final res1 = await appAuth.db().resource('testprotected').fetchOne(id);
        expect(res1.isEmpty, isTrue);
        final res2 = await appNotAuth.db().resource('testprotected').fetchOne(id);
        expect(res2.isEmpty, isTrue);
      });

      test('Should owner and super user has rights', () async {
        await app.db().resource('testprotected').fetchOne(id);
        await clientAdmin.db().resource('testprotected').fetchOne(id);
      });

      test('Should access public resource', () async {
        await appNotAuth.db().resource('testpublic').fetchOne('test');
      });

      test('Should not access private resource', () async {
        try {
          await appAuth.db().resource('private').createOne(db.fromJson(jsonExample));
          fail('Should not access private resource');
        } catch (e) {
          expect(app.getError(e), equals(DBErrors.forbidden));
        }
      });
    });
  });
}
