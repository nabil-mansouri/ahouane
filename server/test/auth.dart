import 'package:ahouane_client/auth.dart';
import 'package:ahouane_client/db.dart';

import 'package:test/test.dart';
import 'package:ahouane_client/http/http.dart';

void auth(
  ClientApplication app, {
  ClientApplication clientAdmin,
  String email,
  String password,
}) {
  final auth = app.auth();
  final newPassword = password;
  final oldPassword = 'old' + password;
  group('[Authentication]', () {
    final http = app.http('http://localhost:1080');
    setUpAll(() async {
      await http.delete('/api/emails').end();
      final emails = await http.get('/api/emails').end().then((value) => value.json());
      expect(emails.asArray.length, equals(0));
      await clientAdmin.db().resource('users').delete(clientAdmin.db().query());
      final res = await clientAdmin.db().resource('users').fetch(clientAdmin.db().query()).toList();
      expect(res.length, equals(0));
    });
    test('Should create user', () async {
      final user = await auth.createUserByEmail(email, oldPassword);
      expect(user.email, equals(email));
      expect(user.id?.isNotEmpty, isTrue);
      expect(user.verifiedEmail, isFalse);
      expect(user.verifiedPhone, isFalse);
      final current = (await auth.currentUser()).value;
      expect(current.id, equals(user.id));
      expect(current.email, equals(user.email));
    });
    test('Should not create user duplicate', () async {
      try {
        await auth.createUserByEmail(email, oldPassword);
      } catch (e) {
        expect(clientAdmin.getError(e), equals('db.errors.DuplicateKey'));
      }
    });
    test('Should send and verify email', () async {
      await auth.sendMailVerification(email);
      final emails = await http.get('/api/emails').end().then((value) => value.json());
      final expected = '<h1>Vous avez créé un compte: </h1>\n<h2>Cliquez ici</h2>\n<a href=\"http://test.com/verifyEmail?token=';
      expect(emails.asArray.length, equals(1));
      final subject = emails.asArray.getJson(0).getString('subject');
      final html = emails.asArray.getJson(0).getString('html');
      expect(html.startsWith(expected), isTrue, reason: html);
      expect(html.length, equals(expected.length + 41));
      expect(subject, equals('Vérification email'));
      final token = html.substring(expected.length, expected.length + 32);
      await auth.verifyMail(token, email);
      final user = await auth.currentUser();
      expect(user.value.verifiedEmail, isTrue);
    });
    test('Should update user', () async {
      final userOpt = await auth.currentUser();
      var user = userOpt.value;
      user.details.lastName = '$email';
      user.details.birthDate = DateTime.parse('1989-10-13').asTimestamp;
      final details = JsonObject()
        ..putArray('list', JsonArray().addDouble(2.0))
        ..putBool('bool', true)
        ..putJson('json', JsonObject().putString('string', 'string'));
      user.setDetails(details);
      user = await auth.updateUser(user);
      expect(user.details.lastName, equals('$email'));
      expect(user.getDetails().asJsonString(), equals(details.asJsonString()));
      final copy = JsonObject.fromJson(user.getDetails().putBool('shouldUpdate2', true));
      user = await auth.updateUser(user);
      expect(user.getDetails().asJsonString(), equals(copy.asJsonString()));
      expect(user.details.birthDate.asDateTime.toIso8601String(), equals('1989-10-13T00:00:00.000'));
    });
    test('Should logout user', () async {
      await auth.logout();
      final userOpt = await auth.currentUser();
      expect(userOpt.isPresent, isFalse);
    });
    test('Should send and reset pwd', () async {
      await auth.sendResetPasswordByMail(email);
      final emails = await http.get('/api/emails').end().then((value) => value.json());
      final expected =
          '<h1>Vous avez demandé à réinitialiser votre mot de passe: </h1>\n<h2>Cliquez ici</h2>\n<a href=\"http://test.com/resetPwd?token=';
      expect(emails.asArray.length, equals(2));
      final subject = emails.asArray.getJson(0).getString('subject');
      final html = emails.asArray.getJson(0).getString('html');
      expect(html.startsWith(expected), isTrue, reason: html);
      expect(html.length, equals(expected.length + 41));
      expect(subject, equals('Réinitialisation mot de passe'));
      final token = html.substring(expected.length, expected.length + 32);
      await auth.resetPasswordByMail(email, password: newPassword, token: token);
      final user = await auth.currentUser();
      expect(user.value.verifiedEmail, isTrue);
    });
    test('Should login user', () async {
      final user = await auth.loginInByEmail(email, newPassword);
      expect(user.email, equals(email));
      expect(user.id?.isNotEmpty, isTrue);
      expect(user.verifiedEmail, isTrue);
    });
    test('Should get current user', () async {
      final user = await auth.currentUser();
      expect(user.isPresent, isTrue);
      expect(user.value.email, equals(email));
      expect(user.value.id?.isNotEmpty, isTrue);
    });
    test('Should delete user', () async {
      var user = await auth.currentUser();
      await auth.deleteUser(user.value);
      user = await auth.currentUser();
      expect(user.isPresent, isFalse);
      try {
        await auth.loginInByEmail(email, newPassword);
        fail('Should not login deleted user');
        // ignore: empty_catches
      } catch (e) {}
    });
    group('[Scope]', () {
      final adminAuth = clientAdmin.authAdmin();
      final adminDb = clientAdmin.db();
      final email = 'scope@test.com';
      final pwd = 'test';
      final role = 'user';
      User user;
      setUpAll(() async {
        await adminDb.resource('users').delete(adminDb.query());
        user = await auth.createUserByEmail(email, pwd);
        expect(user, isNotNull);
      });
      test('Should get scopes', () async {
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(3));
        expect(scopes.contains('StorageService.'), isTrue);
      });
      test('Should detach role', () async {
        await auth.logout();
        await adminAuth.detachRole(role, userId: user.id);
        user = await auth.loginInByEmail(email, pwd);
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(0));
      });
      test('Should not access to storage or db', () async {
        try {
          await app.db().resource('test').fetch(app.db().query()).toList();
          fail('Should failed to fetch db');
        } catch (e) {
          expect(app.getError(e), equals(AuthErrors.unauthorized));
        }
      });
      test('Should attach role', () async {
        await auth.logout();
        await adminAuth.attachRole(role, userId: user.id);
        user = await auth.loginInByEmail(email, pwd);
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(3));
      });
      test('Should access to storage or db', () async {
        await app.db().resource('test').fetch(app.db().query()).toList();
      });
      test('Should detach scope', () async {
        await auth.logout();
        await adminAuth.detachScope('DBService', roleId: role);
        user = await auth.loginInByEmail(email, pwd);
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(1));
      });
      test('Should not access to DBservice', () async {
        try {
          await app.db().resource('test').fetch(app.db().query()).toList();
          fail('Should failed to fetch db');
        } catch (e) {
          expect(app.getError(e), equals(AuthErrors.unauthorized));
        }
      });
      test('Should attach scope', () async {
        await auth.logout();
        await adminAuth.attachScope('DBService.fetch', roleId: role);
        user = await auth.loginInByEmail(email, pwd);
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(2));
        expect(scopes.contains('DBService.fetch'), isTrue);
      });
      test('Should access storage anew but only read', () async {
        await app.db().resource('test').fetch(app.db().query()).toList();
        try {
          await app.db().resource('test').createOne(app.db().fromJson(JsonObject()));
          fail('Should failed to create db');
        } catch (e) {
          expect(app.getError(e), equals(AuthErrors.unauthorized));
        }
      });
      test('Should attach scope', () async {
        await auth.logout();
        await adminAuth.attachScope('DBService.', roleId: role);
        user = await auth.loginInByEmail(email, pwd);
        final scopes = await adminAuth.getScopesForUser(user);
        expect(scopes.length, equals(3));
        expect(scopes.contains('DBService.'), isTrue);
      });
    });
    group('[Admin]', () {
      final admin = clientAdmin.authAdmin();
      final email = 'test2@test2.com';
      test('Should create user', () async {
        final res = await admin.createUser(User()
          ..email = email
          ..password = password);
        final user = res.user;
        expect(user.email, equals(email));
        expect(user.id?.isNotEmpty, isTrue);
        expect(user.verifiedEmail, isFalse);
        expect(user.verifiedPhone, isFalse);
        final current = (await auth.loginInByEmail(email, password));
        expect(current.id, equals(user.id));
        expect(current.email, equals(user.email));
        expect(res.roles.length, greaterThan(0));
        expect(res.scopes.length, greaterThan(0));
        await auth.logout();
      });
      test('Should update user', () async {
        var user = User()..unfreeze();
        user.details.lastName = '$email';
        user.details.birthDate = DateTime.parse('1989-10-13').asTimestamp;
        final details = JsonObject()
          ..putArray('list', JsonArray().addDouble(2.0))
          ..putBool('bool', true)
          ..putJson('json', JsonObject().putString('string', 'string'));
        user.setDetails(details);
        user = await admin.updateUser(user);
        user.unfreeze();
        expect(user.details.lastName, equals('$email'));
        expect(user.getDetails().asJsonString(), equals(details.asJsonString()));
        final copy = JsonObject.fromJson(user.getDetails().putBool('shouldUpdate2', true));
        user = await admin.updateUser(user);
        user.unfreeze();
        expect(user.getDetails().asJsonString(), equals(copy.asJsonString()));
        expect(user.details.birthDate.asDateTime.toIso8601String(), equals('1989-10-13T00:00:00.000'));
      });
      test('Should list and delete user', () async {
        final users = await admin.listUsers().toList();
        expect(users.length, greaterThan(0));
        final user = users.firstWhere((element) => element.email == email);
        await admin.deleteUser(user);
        final users2 = await admin.listUsers().toList();
        expect(users2.length, equals(users.length - 1));
      });
    });
  });
}
