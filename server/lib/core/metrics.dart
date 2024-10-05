part of 'core.dart';

abstract class MetricWriter {
  Future<void> write(Metric metric);
  Future<void> start();
  Future<void> close();
}

class CsvMetricsWritter implements MetricWriter {
  final File file;
  IOSink _sink;
  CsvMetricsWritter(this.file);
  factory CsvMetricsWritter.defaut() => CsvMetricsWritter(File('metrics.csv'));
  @override
  Future<void> write(Metric metric) async {
    await start();
    final values = metric.values.entries.map((e) => '${e.key}=${e.value}').toList();
    metric.dimensions.sort();
    final dimensions = metric.dimensions.reduce((e1, e2) => '$e1/$e2');
    final row = [dimensions, ...values];
    final csv = const ListToCsvConverter().convert([row], fieldDelimiter: ';');
    _sink.writeln(csv);
  }

  @override
  Future<void> close() async {
    if (_sink != null) await _sink.close();
    _sink = null;
  }

  @override
  Future<void> start() async {
    _sink ??= file.openWrite();
  }
}

class MetricWriterDispatcher implements MetricWriter {
  final writters = <MetricWriter>[];
  @override
  Future<void> close() async {
    final future = writters.map((element) => element.close()).toList();
    await Future.wait(future);
  }

  @override
  Future<void> start() async {
    final future = writters.map((element) => element.start()).toList();
    await Future.wait(future);
  }

  @override
  Future<void> write(Metric metric) async {
    final future = writters.map((element) => element.write(metric)).toList();
    await Future.wait(future);
  }
}

//=== Extensions and module
class MetricModule extends ServerModule {
  MetricModule._(ServerApplication application) : super(application);

  MetricWriterDispatcher defaultMetricOutput() =>
      application.context().getOrSet<MetricWriterDispatcher>(kApplicationContextKeys.defaultMetricWriter(), () => MetricWriterDispatcher());

  CsvMetricsWritter csvMetricsOutput(File file) {
    final writter = file != null ? CsvMetricsWritter(file) : CsvMetricsWritter.defaut();
    return writter;
  }

  MetricModule addMetricOutput(MetricWriter writter) {
    defaultMetricOutput().writters.add(writter);
    return this;
  }

  @override
  Future<void> onStart(bool reloading, List<TenantConfig> tenants) async {
    //TODO dynamic writter
    await defaultMetricOutput().start();
  }

  @override
  Future<void> onStop(bool reloading, List<TenantConfig> tenants) async {
    await defaultMetricOutput().close();
  }
}
