part of 'core.dart';

var _loggerFactory = LoggerFactory('unknown');
LoggerFactory getLoggerFactory() => _loggerFactory;
void initLogFactory(String serviceId, {LogWritter writter}) {
  _loggerFactory = LoggerFactory(serviceId, writter);
}

class _PrinterPerLevel extends loglib.LogPrinter {
  final Map<loglib.Level, loglib.LogPrinter> printers;
  final loglib.LogPrinter defaultPrinter;
  _PrinterPerLevel(this.printers, this.defaultPrinter);
  @override
  List<String> log(loglib.LogEvent event) {
    if (printers.containsKey(event.level)) {
      return printers[event.level].log(event);
    }
    return defaultPrinter.log(event);
  }
}

abstract class LogWritter {
  void write(LogMessage event);
  void push(AHLogMessage event);
}

class _LogFilter extends loglib.LogFilter {
  _LogFilter(loglib.Level level) {
    this.level = level;
  }
  @override
  bool shouldLog(loglib.LogEvent event) {
    if (event.level.index >= level.index) {
      return true;
    }
    return true;
  }
}

class _SimplePrinter extends loglib.SimplePrinter {
  _SimplePrinter({bool printTime = false}) : super(printTime: printTime);
  @override
  List<String> log(loglib.LogEvent event) {
    return super.log(event).map((e) => e.replaceAll('TIME: ', '')).toList();
  }
}

class ConsoleLogWritter implements LogWritter {
  final loglib.Logger logger;
  ConsoleLogWritter(this.logger);
  static loglib.Level _convertLevel(LogMessage_Level level) {
    switch (level) {
      case LogMessage_Level.Debug:
        return loglib.Level.debug;
      case LogMessage_Level.Error:
        return loglib.Level.error;
      case LogMessage_Level.Info:
        return loglib.Level.info;
      case LogMessage_Level.Verbose:
        return loglib.Level.verbose;
      case LogMessage_Level.Warn:
        return loglib.Level.warning;
    }
    return loglib.Level.verbose;
  }

  factory ConsoleLogWritter.defaut() => ConsoleLogWritter.create(ConsoleLogWritterConfig());
  factory ConsoleLogWritter.create(ConsoleLogWritterConfig config) {
    final simple = _SimplePrinter(printTime: config.printTime);
    final pretty = loglib.PrettyPrinter(
        methodCount: config.methodCount, // number of method calls to be displayed
        errorMethodCount: config.errorMethodCount, // number of method calls if stacktrace is provided
        lineLength: config.lineLength, // width of the output
        colors: config.colors, // Colorful log messages
        printEmojis: config.printEmojis, // Print an emoji for each log message
        printTime: config.printTime // Should each log print contain a timestamp
        );
    final printer = _PrinterPerLevel(
      {
        loglib.Level.error: config.prettyError == true ? pretty : simple,
        loglib.Level.warning: config.prettyWarn == true ? pretty : simple,
      },
      simple,
    );
    final logger =
        loglib.Logger(level: _convertLevel(config.minLevel), printer: printer, filter: _LogFilter(_convertLevel(config.minLevel)));
    return ConsoleLogWritter(logger);
  }

  @override
  void push(AHLogMessage event) {
    final parts = [' ${event.id}'];
    final other = event.variables.entries.map((e) => '${e.key}=${e.value}').toList();
    other.sort();
    final all = [...parts, ...other];
    final message = all.join('  ');
    final stack = event.stacktrace.isNotEmpty ? StackTrace.fromString(event.stacktrace) : null;
    final error = event.error.isNotEmpty ? Exception(event.error) : null;
    switch (event.level) {
      case LogMessage_Level.Debug:
        logger.d(message, error, stack);
        break;
      case LogMessage_Level.Error:
        logger.e(message, error, stack);
        break;
      case LogMessage_Level.Info:
        logger.i(message, error, stack);
        break;
      case LogMessage_Level.Verbose:
        logger.v(message, error, stack);
        break;
      case LogMessage_Level.Warn:
        logger.w(message, error, stack);
        break;
    }
  }

  @override
  void write(LogMessage event) {
    final stack = event.stacktrace != null ? StackTrace.fromString(event.stacktrace) : null;
    final message = '[${event.serviceid}][${event.where}][${event.who}] ${event.what} - ${event.description}. Details: ${event.details}';
    final error = event.error != null ? Exception(event.error) : null;
    switch (event.level) {
      case LogMessage_Level.Debug:
        logger.d(message, error, stack);
        break;
      case LogMessage_Level.Error:
        logger.e(message, error, stack);
        break;
      case LogMessage_Level.Info:
        logger.i(message, error, stack);
        break;
      case LogMessage_Level.Verbose:
        logger.v(message, error, stack);
        break;
      case LogMessage_Level.Warn:
        logger.w(message, error, stack);
        break;
    }
  }
}

class LoggerFactory {
  final String serviceid;
  final loggers = <String, Logger>{};
  final LogWritter writter;
  LoggerFactory(this.serviceid, [LogWritter writter]) : writter = writter ?? ConsoleLogWritter.defaut();

  Logger loggerByTag(String type) {
    if (loggers.containsKey(type)) {
      return loggers[type];
    }
    final logger = Logger(writter, type, serviceid);
    loggers[type] = logger;
    return logger;
  }

  Logger loggerByType(Type type) {
    return loggerByTag(type.toString());
  }
}

class Logger {
  final String tag;
  final String serviceid;
  final LogWritter writter;
  Logger(this.writter, this.tag, this.serviceid);
  void send(LogMessage event) {
    writter.write(event);
  }

  static Map<String, String> _fixVariables(Map<String, dynamic> variables) {
    final map = <String, String>{};
    for (final entry in variables.entries) {
      final tmp = '${entry.value}';
      map[entry.key] = tmp.substring(0, min(tmp.length, 50));
    }
    return map;
  }

  void d(LogKey key, Map<String, dynamic> variables) {
    final event = AHLogMessage()
      ..level = LogMessage_Level.Debug
      ..id = key.key
      ..when = timestamppb.Timestamp.create()
      ..variables.addAll(_fixVariables(variables));
    writter.push(event);
  }

  void debug(LogKey key, {String who, dynamic details}) {
    final event = LogMessage()
      ..description = key.description
      ..details = details?.toString()
      ..level = LogMessage_Level.Debug
      ..serviceid = serviceid
      ..stacktrace = StackTrace.current.toString()
      ..what = key.key
      ..when = timestamppb.Timestamp.create()
      ..where = tag
      ..who = who;
    writter.write(event);
  }

  void v(LogKey key, Map<String, dynamic> variables) {
    final event = AHLogMessage()
      ..level = LogMessage_Level.Verbose
      ..id = key.key
      ..when = timestamppb.Timestamp.create()
      ..variables.addAll(_fixVariables(variables));
    writter.push(event);
  }

  void verbose(LogKey key, {String who, dynamic details}) {
    final event = LogMessage()
      ..description = key.description
      ..details = details?.toString()
      ..level = LogMessage_Level.Verbose
      ..serviceid = serviceid
      //..stacktrace = null
      ..what = key.key
      ..when = timestamppb.Timestamp.create()
      ..where = tag
      ..who = who;
    writter.write(event);
  }

  void i(LogKey key, Map<String, dynamic> variables) {
    final event = AHLogMessage()
      ..level = LogMessage_Level.Info
      ..id = key.key
      ..when = timestamppb.Timestamp.create()
      ..variables.addAll(_fixVariables(variables));
    writter.push(event);
  }

  void info(LogKey key, {String who, dynamic details}) {
    final event = LogMessage()
      ..description = key.description
      ..details = details?.toString()
      ..level = LogMessage_Level.Info
      ..serviceid = serviceid
      //..stacktrace = null
      ..what = key.key
      ..when = timestamppb.Timestamp.create()
      ..where = tag
      ..who = who;
    writter.write(event);
  }

  void w(LogKey key, Map<String, dynamic> variables, {dynamic error, StackTrace stacktrace, bool hideStacktrace = false}) {
    final event = AHLogMessage()
      ..level = LogMessage_Level.Warn
      ..id = key.key
      ..when = timestamppb.Timestamp.create()
      ..variables.addAll(_fixVariables(variables))
      ..error = '$error'
      ..stacktrace = stacktrace?.toString() ?? StackTrace.current.toString();
    if (hideStacktrace) {
      event.stacktrace = '';
    }
    writter.push(event);
  }

  void warn(LogKey key, {String who, dynamic details, dynamic error, StackTrace stacktrace, bool hideStacktrace = false}) {
    final event = LogMessage()
      ..description = key.description
      ..details = details?.toString()
      ..error = '$error'
      ..level = LogMessage_Level.Warn
      ..serviceid = serviceid
      ..stacktrace = stacktrace?.toString() ?? StackTrace.current.toString()
      ..what = key.key
      ..when = timestamppb.Timestamp.create()
      ..where = tag
      ..who = who;
    if (hideStacktrace) {
      event.stacktrace = '';
    }
    writter.write(event);
  }

  void e(LogKey key, Map<String, dynamic> variables, {dynamic error, StackTrace stacktrace, bool hideStacktrace = false}) {
    final event = AHLogMessage()
      ..level = LogMessage_Level.Error
      ..id = key.key
      ..when = timestamppb.Timestamp.create()
      ..variables.addAll(_fixVariables(variables))
      ..error = '$error'
      ..stacktrace = stacktrace?.toString() ?? StackTrace.current.toString();
    if (hideStacktrace) {
      event.stacktrace = '';
    }
    writter.push(event);
  }

  void error(LogKey key, {String who, dynamic details, dynamic error, StackTrace stacktrace, bool hideStacktrace = false}) {
    final event = LogMessage()
      ..description = key.description
      ..details = details?.toString()
      ..error = '$error'
      ..level = LogMessage_Level.Error
      ..serviceid = serviceid
      ..stacktrace = stacktrace?.toString() ?? StackTrace.current.toString()
      ..what = key.key
      ..when = timestamppb.Timestamp.create()
      ..where = tag
      ..who = who;
    if (hideStacktrace) {
      event.stacktrace = '';
    }
    writter.write(event);
  }
}
