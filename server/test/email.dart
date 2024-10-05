import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_client/http/http.dart';
import 'package:ahouane_server/clients/email.dart';
import 'package:test/test.dart';

void email(ClientApplication app,
    {ClientApplication clientAdmin, String host, int port}) {
  group('[Email]', () {
    final http = app.http('http://localhost:1080');
    setUpAll(() async {
      await http.delete('/api/emails').end();
      final emails =
          await http.get('/api/emails').end().then((value) => value.json());
      expect(emails.asArray.length, equals(0));
      print('smtp strated....');
    });
    final html = '''
    <h1>Users</h1>
    <ul>
    {% for user in users %}
        <li>
            {{ user.name }}
            {% if user.isgreat %}
                GREAT
            {% else %}
                DONT KNOW
            {% endif %}
            {% if user.shutup == false or user.shutup == null %}
            SHUT UP
            {% endif %}
        </li>
    {% empty %}
       <li>No users</li>
    {% endfor %}
    </ul>
  ''';
    final variables = JsonObject().putArray(
      'users',
      JsonArray()
          .addJson(
            JsonObject()
              ..putString('name', 'My Name')
              ..putBool('isgreat', true)
              ..putBool('shutup', false),
          )
          .addJson(
            JsonObject()
              ..putString('name', 'My Name')
              ..putBool('isgreat', true)
              ..putBool('shutup', false),
          ),
    );
    test('Should send mail', () async {
      final email = clientAdmin
          .email()
          .create()
          .to('to1@localhost.com', name: 'to1')
          .to('to2@localhost.com')
          .cc('cc1@localhost.com', name: 'cc1')
          .cc('cc2@localhost.com')
          .bcc('bcc1@localhost.com', name: 'bcc1')
          .bcc('bcc2@localhost.com')
          .from('from@localhost.com', name: 'from')
          .rawHtml(html, variables: variables);
      var res = await email.send();
      expect(res, isTrue);
      res = await email.send();
      expect(res, isTrue);
      final emails =
          await http.get('/api/emails').end().then((value) => value.json());
      expect(emails.asArray.length, equals(2));
      final expected =
          '<h1>Users</h1><ul><li>MyNameGREATSHUTUP</li><li>MyNameGREATSHUTUP</li></ul>';
      expect(
          emails.asArray
              .getJson(0)
              .getString('html')
              .replaceAll(RegExp(r'\s+'), ''),
          equals(expected));
    });
  });
}
