import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_client/db.dart';
import 'package:ahouane_server/clients/token.dart';
import 'package:test/test.dart';

void token(ClientApplication app, {ClientApplication clientAdmin}) {
  group('[Token]', () {
    final token = clientAdmin.token();
    final db = clientAdmin.db();
    const resource = 'tokens';
    const tokenType = 'mytoken';
    setUpAll(() async {
      await db.resource(resource).delete(db.query());
      final res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(0));
    });
    Token currentToken;
    test('Should create token', () async {
      currentToken = await token.createToken(tokenType, Duration(days: 1));
      expect(currentToken.tokenType, equals(tokenType));
      expect(currentToken.value.length, equals(32));
      final date = currentToken.expireAt.asDateTime;
      expect(date.difference(DateTime.now()).inHours, greaterThanOrEqualTo(23));
      final res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(1));
    });
    test('Should create token once', () async {
      final tok = await token.createToken(tokenType, Duration(days: 1));
      expect(tok.tokenType, equals(tokenType));
      expect(tok.value, isNot(equals(currentToken.value)));
      final res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(1));
      currentToken = tok;
    });
    test('Should validate token', () async {
      final tok = await token.validateToken(currentToken.value, tokenType: tokenType);
      expect(tok, isTrue);
      final res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(0));
    });
    test('Should apply ttl token', () async {
      //force monitor ttl to run every seconds
      //db.adminCommand({setParameter:1, ttlMonitorSleepSecs: 1});
      final tok = await token.createToken(tokenType, Duration(seconds: 2));
      expect(tok.tokenType, equals(tokenType));
      var res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(1));
      await Future.delayed(Duration(seconds: 4));
      res = db.resource(resource).fetch(db.query());
      expect(await res.length, equals(0));
    });
  });
}
