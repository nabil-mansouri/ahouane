library ahouane.email.client;

import 'package:ahouane_client/core/core.dart';
import 'package:ahouane_common/generated/email.pbgrpc.dart';
export 'package:ahouane_common/generated/email.pbgrpc.dart';

class _Email {
  final EmailModule module;
  final _email = EmailPayload()..variables = JsonObjectValue();
  _Email(this.module);
  EmailServiceClient get _service => module._service;
  _Email to(String to, {String name}) {
    return this
      .._email.to.add(EmailAddress()
        ..name = name ?? ''
        ..address = to);
  }

  _Email cc(String to, {String name}) {
    return this
      .._email.cc.add(EmailAddress()
        ..name = name ?? ''
        ..address = to);
  }

  _Email bcc(String to, {String name}) {
    return this
      .._email.cci.add(EmailAddress()
        ..name = name ?? ''
        ..address = to);
  }

  _Email from(String to, {String name}) {
    return this
      .._email.from = (EmailAddress()
        ..name = name ?? ''
        ..address = to);
  }

  _Email rawSubject(String subject, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    _email.rawSubject = subject;
    return this;
  }

  _Email i18Subject(String subject, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    _email.i18Subject = subject;
    return this;
  }

  _Email rawHtml(String html, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    if (isDynamic != null) {
      _email.dynamic = isDynamic;
    }
    return this.._email.rawHtml = html;
  }

  _Email i18Html(String html, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    if (isDynamic != null) {
      _email.dynamic = isDynamic;
    }
    return this.._email.i18Html = html;
  }

  _Email rawText(String text, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    if (isDynamic != null) {
      _email.dynamic = isDynamic;
    }
    return this.._email.rawText = text;
  }

  _Email i18Text(String text, {JsonObject variables, bool isDynamic}) {
    if (variables != null) {
      _email.dynamic = true;
      _email.variables.value.addAll(variables.toProto().object.value);
    }
    if (isDynamic != null) {
      _email.dynamic = isDynamic;
    }
    return this.._email.i18Text = text;
  }

  Future<bool> send() async {
    final res = await _service.sendMail(_email);
    return res.success;
  }
}

class EmailModule extends ClientModule {
  final EmailServiceClient _service;
  EmailModule(ClientApplication app)
      : _service = EmailServiceClient(app.createChannel()),
        super(app);
  _Email create() => _Email(this);
}

extension ClientApplicationEmail on ClientApplication {
  EmailModule email() => EmailModule(this);
}
