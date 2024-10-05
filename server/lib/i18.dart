library ahouane.db.server.i18;

import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';
import 'package:ahouane_server/core/core.dart';
import 'package:ahouane_common/generated/i18.pbgrpc.dart';
import 'package:path/path.dart' as p;
import 'package:liquid_engine/liquid_engine.dart';

class _I18SourceValue {
  final Source source;
  final String lang;
  _I18SourceValue(this.lang, this.source);
}

class _Lang {
  final templates = <String, File>{};
  final keys = <String, String>{};
  final templatesParsed = <String, Source>{};
  void addKey(String key, String value) {
    keys[key] = value;
  }

  void addTemplate(String key, File value) {
    templates[key] = value;
  }

  Optional<String> getKey(String key) {
    if (keys.containsKey(key)) {
      return Optional.of(keys[key]);
    } else {
      return Optional.empty();
    }
  }

  Map<String, String> getKeys() {
    return keys;
  }

  Future<Optional<Source>> getTemplate(String key) async {
    if (templates.containsKey(key)) {
      if (templatesParsed.containsKey(key)) {
        return Optional.of(templatesParsed[key]);
      } else {
        final template = await templates[key].readAsString();
        templatesParsed[key] = Source.fromString(template);
        return Optional.of(templatesParsed[key]);
      }
    } else {
      return Optional.empty();
    }
  }
}

class I18Service extends I18ServiceBase with GrpcService {
  final I18Config i18Config;
  final logger = ServerApplication.instance().logger().defaultLoggerFactory().loggerByType(I18Service);

  final langs = <String, _Lang>{};

  I18Service(this.i18Config) : super();
  @override
  Future<void> start() async {
    logger.i(
      kLogKeys.i18Starting(),
      {'directory': i18Config.baseDirectory, 'default': i18Config.defaultLang},
    );
    final directory = Directory(i18Config.baseDirectory).absolute;
    await for (final langDir in directory.list()) {
      if (langDir is Directory) {
        final lang = p.basename(langDir.path);
        langs.putIfAbsent(lang, () => _Lang());
        final langObject = langs[lang];
        await for (final element in (langDir).list()) {
          if (element is File) {
            final baseName = p.basename(element.path);
            if (baseName.endsWith('i18n.yaml')) {
              final content = await (element).readAsString();
              final map = loadYaml(content) as Map;
              for (final entry in map.entries) {
                langObject.addKey(entry.key, entry.value.toString());
              }
            } else {
              langObject.addTemplate(baseName, element);
            }
          }
        }
      }
    }
  }

  @override
  Future<void> stop() async {
    logger.i(
      kLogKeys.i18Stopping(),
      {'directory': i18Config.baseDirectory, 'default': i18Config.defaultLang},
    );
  }

  Future<_I18SourceValue> _getTemplate(ServiceCall call, String key, [String forceLang]) async {
    Future<_I18SourceValue> tryGet(String lang) async {
      if (langs.containsKey(lang)) {
        final res = await langs[lang].getTemplate(key);
        if (res.isPresent) {
          return _I18SourceValue(lang, res.value);
        }
      }
      return null;
    }

    if (forceLang != null) {
      final res = await tryGet(forceLang);
      if (res != null) return res;
    }
    if (call.getSession().hasLang()) {
      final res = await tryGet(call.getSession().lang);
      if (res != null) return res;
    }
    if (i18Config.hasDefaultLang()) {
      final res = await tryGet(i18Config.defaultLang);
      if (res != null) return res;
    }
    for (final entry in langs.entries) {
      final res = await tryGet(entry.key);
      if (res != null) return res;
    }
    return null;
  }

  @override
  Future<I18Value> getRawTemplate(ServiceCall call, I18Key request) async {
    final res = await _getTemplate(call, request.key, request.hasForceLang() ? request.forceLang : null);
    if (res != null) {
      return I18Value()
        ..lang = res.lang
        ..value = res.source.content;
    }
    return I18Value()..value = request.key;
  }

  @override
  Future<I18Value> getRawValue(ServiceCall call, I18Key request) async {
    I18Value tryGet(String lang) {
      if (langs.containsKey(lang)) {
        final res = langs[lang].getKey(request.key);
        if (res.isPresent) {
          return I18Value()
            ..lang = lang
            ..value = res.value;
        }
      }
      return null;
    }

    if (request.forceLang != null) {
      final res = tryGet(request.forceLang);
      if (res != null) return res;
    }
    if (call.getSession().hasLang()) {
      final res = tryGet(call.getSession().lang);
      if (res != null) return res;
    }
    if (i18Config.hasDefaultLang()) {
      final res = tryGet(i18Config.defaultLang);
      if (res != null) return res;
    }
    for (final entry in langs.entries) {
      final res = tryGet(entry.key);
      if (res != null) return res;
    }
    return null;
  }

  static String renderTamplate(ServiceCall call, Source source, {JsonObjectValue variables}) {
    final context = Context.create();
    context.variables['_session'] = call.getSession().toProto3JsonSafe();
    if (variables != null) {
      context.variables.addAll(variables.toNative());
    }
    final template = Template.parse(context, source);
    return template.render(context);
  }

  @override
  Future<I18Value> getTemplate(ServiceCall call, I18Key request) async {
    final res = await _getTemplate(call, request.key, request.hasForceLang() ? request.forceLang : null);
    if (res != null) {
      final result = renderTamplate(
        call,
        res.source,
        variables: request.variables,
      );
      return I18Value()
        ..lang = res.lang
        ..value = result;
    }
    return I18Value()..value = request.key;
  }

  @override
  Future<I18Value> getValue(ServiceCall call, I18Key request) async {
    final res = await getRawValue(call, request);
    if (res != null) {
      final context = Context.create();
      context.variables['_session'] = call.getSession().toProto3JsonSafe();
      if (request.hasVariables()) {
        context.variables.addAll(request.variables.toNative());
      }
      final template = Template.parse(context, Source.fromString(res.value));
      final result = template.render(context);
      return I18Value()
        ..lang = res.lang
        ..value = result;
    }
    return I18Value()..value = request.key;
  }

  @override
  Future<I18Values> getKeys(ServiceCall call, request) async {
    I18Values tryGet(String lang) {
      if (lang != null && langs.containsKey(lang)) {
        return I18Values()
          ..lang = lang
          ..values.addAll(langs[lang].keys);
      }
      return null;
    }

    //force
    var values = tryGet(request.forceLang);
    if (values != null) return values;
    //session
    values = tryGet(call.getSession().hasLang() ? call.getSession().lang : null);
    if (values != null) return values;
    //defaut lang
    values = tryGet(i18Config.hasDefaultLang() ? i18Config.defaultLang : null);
    if (values != null) return values;
    //others
    for (final entry in langs.entries) {
      values = tryGet(entry.key);
      if (values != null) return values;
    }
    return I18Values();
  }
}

extension I18LogKeys on LogKeys {
  LogKey i18Stopping() => LogKey('i18Stopping', description: 'I18 stopping');
  LogKey i18Starting() => LogKey('i18Starting', description: 'I18 starting');
}

class I18ServerModule extends ServerModule {
  I18ServerModule._(ServerApplication application) : super(application);
  Future<I18Service> create(Channel channel, [I18Config i18Config]) async {
    final grpc = I18Service(i18Config);
    await channel.register(grpc.route, GrpcChannelService(grpc, i18Config?.serviceConfig));
    return grpc;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    final all = application.configForKey('i18n', I18Config());
    for (final tenant in tenants) {
      final channel = application.channel().defaultChannel(tenant);
      for (final configOriginal in all) {
        final config = getConfig(configOriginal.deepCopy());
        config.baseDirectory = tenant.defaut ? config.baseDirectory : p.join(config.baseDirectory, tenant.id);
        await create(channel, config);
      }
    }
  }

  static I18Config getConfig(I18Config i18Cfg) {
    return I18Config()
      ..mergeFromMessage(defautConfig())
      ..mergeFromMessage(i18Cfg ?? I18Config());
  }

  static I18Config defautConfig() {
    return I18Config()
      ..baseDirectory = 'i18n'
      ..defaultLang = 'en';
  }
}

extension ApplicationI18 on ServerApplication {
  I18ServerModule i18() => createSingleton(I18ServerModule, () => I18ServerModule._(this));
}
