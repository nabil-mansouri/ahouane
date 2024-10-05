import 'package:universal_io/io.dart';
import 'package:ahouane_client/auth.dart';
import 'package:ahouane_client/http/http.dart';
import 'package:ahouane_client/storage.dart';
import 'package:test/test.dart';

void storage(
  ClientApplication app, {
  ClientApplication appAdmin,
  String content,
  String newContent,
}) {
  final buffer = () => StringBodyCodec().encode(content).map((event) => Uint8List.fromList(event));
  final newBuffer = () => StringBodyCodec().encode(newContent).map((event) => Uint8List.fromList(event));
  group('[Storage]', () {
    final storage = app.storage();
    final fs = Directory('test/storage');
    if (fs.existsSync()) {
      fs.deleteSync(recursive: true);
    }
    setUpAll(() async {
      final auth = app.auth();
      await auth.createUserByEmail('storage@test.com', 'password');
      final user = await auth.currentUser();
      expect(user.isPresent, isTrue);
    });
    test('Should create or upsert', () async {
      await storage.path('path/subpath/').create(buffer());
      await storage.path('path/subpath/').create(buffer(), upsert: true);
    });
    test('Should fetch', () async {
      final meta = await storage.path('path/subpath/').meta();
      expect(meta.size, isNot(equals(0)));
      final file = storage.path('path/subpath/').fetch();
      expect(content, equals(await StringBodyCodec().decode(file)));
    });
    test('Should fetch from http', () async {
      final url = storage.path('path/subpath/').getUrl();
      final text = await app.http().get(url).end().then((value) => value.text());
      expect(content, equals(text));
    });
    test('Should update', () async {
      await storage.path('path/subpath/').update(newBuffer());
    });
    test('Should fetch after update', () async {
      final meta = await storage.path('path/subpath/').meta();
      expect(meta.size, isNot(equals(0)));
      final file = storage.path('path/subpath/').fetch();
      expect(newContent, equals(await StringBodyCodec().decode(file)));
    });
    test('Should delete', () async {
      await storage.path('path/subpath/').delete();
    });
    test('Should not fetch after delete', () async {
      try {
        await storage.path('path/subpath/').meta();
        fail('Should not fetch meta of deleted file');
      } catch (e) {
        expect(app.getError(e), equals(StorageErrors.notExists));
      }
      try {
        await storage.path('path/subpath/').fetch().toList();
        fail('Should not fetch deleted file');
      } catch (e) {
        expect(app.getError(e), equals(StorageErrors.notExists));
      }
    });
    test('Should not be accessible when logout', () async {
      await app.auth().logout();
      try {
        await storage.path('').meta();
      } catch (e) {
        expect(app.getError(e), equals(AuthErrors.unauthorized));
      }
    });
    group('[Interceptor]', () {
      final appAuth = ClientApplication(app.config);
      final appNotAuth = ClientApplication(app.config);
      String user2Id;
      StorageMeta meta;
      setUpAll(() async {
        await app.auth().loginInByEmail('storage@test.com', 'password');
        final auth2 = appAuth.auth();
        await auth2.createUserByEmail('storage2@test.com', 'password');
        final user2 = await auth2.currentUser();
        expect(user2.isPresent, isTrue);
        user2Id = user2.value.id;
        meta = await app.storage().path('file1/sss').create(buffer());
      });
      test('Should share file to everyone', () async {
        await app.storage().path('file1/sss').share().addPublic(read: true).end();
        final contentAuth = appAuth.storage().id(meta.id).fetch();
        expect(content, equals(await StringBodyCodec().decode(contentAuth)));
        final contentNotAuth = appNotAuth.storage().id(meta.id).fetch();
        expect(content, equals(await StringBodyCodec().decode(contentNotAuth)));
        try {
          await appAuth.storage().id(meta.id).update(buffer());
          fail('Should not update without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should unshare file to everyone', () async {
        await app.storage().path('file1/sss').share().removePublic().end();
        try {
          await appAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should share file to authenticated', () async {
        await app.storage().path('file1/sss').share().addAuthenticatedUser(read: true).end();
        final contentAuth = appAuth.storage().id(meta.id).fetch();
        expect(content, equals(await StringBodyCodec().decode(contentAuth)));
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appAuth.storage().id(meta.id).update(buffer());
          fail('Should not update without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should unshare file to authenticated', () async {
        await app.storage().path('file1/sss').share().removeAuthenticated().end();
        try {
          await appAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should share file to role user', () async {
        await app.storage().path('file1/sss').share().addRole('user', read: true).end();
        final contentAuth = appAuth.storage().id(meta.id).fetch();
        expect(content, equals(await StringBodyCodec().decode(contentAuth)));
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appAuth.storage().id(meta.id).update(buffer());
          fail('Should not update without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should unshare file to role user', () async {
        await app.storage().path('file1/sss').share().removeRole('user').end();
        try {
          await appAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should share file to user id', () async {
        await app.storage().path('file1/sss').share().addUser(user2Id, read: true).end();
        final contentAuth = appAuth.storage().id(meta.id).fetch();
        expect(content, equals(await StringBodyCodec().decode(contentAuth)));
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appAuth.storage().id(meta.id).update(buffer());
          fail('Should not update without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should unshare file to user id', () async {
        await app.storage().path('file1/sss').share().removeUser(user2Id).end();
        try {
          await appAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
        try {
          await appNotAuth.storage().id(meta.id).fetch().toList();
          fail('Should not fetch meta without rights');
        } catch (e) {
          expect(app.getError(e), equals(StorageErrors.forbidden));
        }
      });

      test('Should owner and super user has rights', () async {
        await app.storage().id(meta.id).fetch().toList();
        await appAdmin.storage().id(meta.id).fetch().toList();
      });
    });
  });
}
