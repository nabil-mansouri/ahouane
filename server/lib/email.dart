library ahouane.db.server.email;

import 'package:ahouane_client/auth.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_common/generated/email.pbgrpc.dart';
import 'package:ahouane_client/i18.dart';
import 'package:ahouane_server/i18.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:liquid_engine/liquid_engine.dart';

class EmailService extends EmailServiceBase with GrpcService {
  final I18Module i18;
  final EmailConfig emailConfig;
  final logger = ServerApplication.instance()
      .logger()
      .defaultLoggerFactory()
      .loggerByType(EmailService);

  EmailService(this.emailConfig, ClientApplication app)
      : i18 = app.i18(),
        super();
  @override
  Future<void> start() async {
    logger.i(
      kLogKeys.emailStarting(),
      {'uri': emailConfig.host, 'port': emailConfig.port},
    );
  }

  @override
  Future<void> stop() async {
    logger.i(
      kLogKeys.emailStopping(),
      {'uri': emailConfig.host, 'port': emailConfig.port},
    );
  }

  @override
  Future<EmailStatus> sendMail(ServiceCall call, EmailPayload request) async {
    final client = SmtpClient(emailConfig.clientDomain,
        isLogEnabled: emailConfig.enableLog);
    try {
      await client.connectToServer(emailConfig.host, emailConfig.port,
          isSecure: emailConfig.secure);
      final ehloResponse = await client.ehlo();
      if (!ehloResponse.isOkStatus) {
        logger.e(kLogKeys.unableToSayHello(ehloResponse.message),
            {'message': ehloResponse.message});
        return EmailStatus()
          ..success = false
          ..details = ehloResponse.message;
      }
      if (emailConfig.hasLogin()) {
        final loginResponse =
            await client.login(emailConfig.login, emailConfig.password);
        if (!loginResponse.isOkStatus) {
          return EmailStatus()
            ..success = false
            ..details = loginResponse.message;
        }
      }
      final builder = MessageBuilder.prepareMultipartAlternativeMessage();
      if (request.hasFrom()) {
        builder.from = [MailAddress(request.from.name, request.from.address)];
      } else {
        builder.from = [
          MailAddress(emailConfig.fromName, emailConfig.fromAddress)
        ];
      }
      builder.to =
          request.to.map((e) => MailAddress(e.name, e.address)).toList();
      builder.cc =
          request.cc.map((e) => MailAddress(e.name, e.address)).toList();
      builder.bcc =
          request.cci.map((e) => MailAddress(e.name, e.address)).toList();
      //subject
      if (request.hasI18Subject()) {
        builder.subject = await i18.valueForKey(
          request.i18Subject,
          variables: request.variables.toJsonObject(),
        );
      }
      if (request.hasRawSubject()) {
        final content = request.dynamic
            ? I18Service.renderTamplate(
                call,
                Source.fromString(request.rawSubject),
                variables: request.variables,
              )
            : request.rawSubject;
        builder.subject = content;
      }
      //text
      if (request.hasRawText()) {
        final content = request.dynamic
            ? I18Service.renderTamplate(
                call,
                Source.fromString(request.rawText),
                variables: request.variables,
              )
            : request.rawText;
        builder.addTextPlain(content);
      }
      if (request.hasI18Text()) {
        final content = await i18.templateForKey(
          request.i18Text,
          jsonVariables: request.variables,
        );
        builder.addTextPlain(content);
      }
      //html
      if (request.hasRawHtml()) {
        final content = request.dynamic
            ? I18Service.renderTamplate(
                call,
                Source.fromString(request.rawHtml),
                variables: request.hasVariables() ? request.variables : null,
              )
            : request.rawHtml;
        builder.addTextHtml(content);
      }
      if (request.hasI18Html()) {
        final content = await i18.templateForKey(
          request.i18Html,
          jsonVariables: request.variables,
        );
        builder.addTextHtml(content);
      }
      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);

      return EmailStatus()
        ..success = sendResponse.isOkStatus
        ..details = sendResponse.message;
    } finally {
      await client.closeConnection();
    }
  }
}

extension MailLogKeys on LogKeys {
  LogKey unableToSayHello(String msg) => LogKey('unableToSayHello',
      description: 'SMTP: unable to say helo/ehlo: $msg');
  LogKey emailStarting() =>
      LogKey('emailStarting', description: 'Email starting');
  LogKey emailStopping() =>
      LogKey('emailStopping', description: 'Email stopping');
}

class EmailServerModule extends ServerModule {
  EmailServerModule._(ServerApplication application) : super(application);
  Future<EmailService> create(EmailConfig emailConfig, Channel channel) async {
    final grpc = EmailService(emailConfig, application.client(channel));
    await channel.register(
        grpc.route, GrpcChannelService(grpc, emailConfig?.serviceConfig));
    return grpc;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('email', EmailConfig());
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      for (final config in all) {
        await create(getConfig(config), channel);
      }
    }
  }

  static EmailConfig getConfig(EmailConfig emailCfg) {
    return EmailConfig()
      ..mergeFromMessage(defautConfig())
      ..mergeFromMessage(emailCfg ?? EmailConfig());
  }

  static EmailConfig defautConfig() {
    return EmailConfig()
      ..host = 'localhost'
      ..port = 25
      ..secure = true
      ..enableLog = false
      ..clientDomain = 'localhost'
      ..fromName = 'No Reply'
      ..fromAddress = 'no-reply@ahouane.com';
  }
}

extension ApplicationEmail on ServerApplication {
  EmailServerModule email() =>
      createSingleton(EmailServerModule, () => EmailServerModule._(this));
}
