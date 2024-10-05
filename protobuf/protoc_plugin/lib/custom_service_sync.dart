part of protoc;

final syncGenerators = <ServiceSyncGenerator>[];
String generateServiceSyncFile({
  final OutputConfiguration config = const DefaultOutputConfiguration(),
  final bool linked = false,
  final IndentingWriter Function() makeWriter,
  final void Function(IndentingWriter out) writeHeading,
  final void Function(IndentingWriter out, OutputConfiguration config, FileGenerator target, String extension) writeImport,
  final Uri protoFileUri,
  final FileGenerator fileGenerator,
  final List<ServiceDescriptorProto> services,
  final GenerationContext context,
}) {
  for (final service in services) {
    syncGenerators.add(ServiceSyncGenerator(service, fileGenerator)..resolve(context));
  }
  if (!linked) throw StateError("not linked");
  var out = makeWriter();
  writeHeading(out);

  out.println(_asyncImport);
  out.println();
  out.println(_coreImport);
  out.println();
  out.println(_grpcImport);

  // Import .pb.dart files needed for requests and responses.
  var imports = <FileGenerator>{};
  for (var generator in syncGenerators) {
    generator.addImportsTo(imports);
  }
  for (var target in imports) {
    writeImport(out, config, target, ".pb.dart");
  }

  var resolvedImport = config.resolveImport(protoFileUri, protoFileUri, ".pb.dart");
  out.println("export '$resolvedImport';");
  out.println();

  for (var generator in syncGenerators) {
    generator.generate(out);
  }

  return _formatter.format(out.toString());
}

class ServiceSyncGenerator {
  final ServiceDescriptorProto _descriptor;

  /// The generator of the .pb.dart file that will contain this service.
  final FileGenerator fileGen;

  /// The message types needed directly by this service.
  ///
  /// The key is the fully qualified name.
  /// Populated by [resolve].
  final _deps = <String, MessageGenerator>{};

  /// Maps each undefined type to a string describing its location.
  ///
  /// Populated by [resolve].
  final _undefinedDeps = <String, String>{};

  /// Fully-qualified gRPC service name.
  String _fullServiceName;

  /// Dart class name for server stub.
  String _serviceClassname;

  /// List of gRPC methods.
  final _methods = <_SyncMethod>[];

  ServiceSyncGenerator(this._descriptor, this.fileGen) {
    final name = _descriptor.name;
    final package = fileGen.package;

    if (package != null && package.isNotEmpty) {
      _fullServiceName = '$package.$name';
    } else {
      _fullServiceName = name;
    }

    // avoid: ServiceServiceBase
    _serviceClassname = name.endsWith('Service') ? name + 'Sync' : name + 'ServiceSync';
  }

  /// Finds all message types used by this service.
  ///
  /// Puts the types found in [_deps]. If a type name can't be resolved, puts it
  /// in [_undefinedDeps].
  /// Precondition: messages have been registered and resolved.
  void resolve(GenerationContext ctx) {
    for (var method in _descriptor.method) {
      _methods.add(_SyncMethod(this, ctx, method));
    }
  }

  /// Adds a dependency on the given message type.
  ///
  /// If the type name can't be resolved, adds it to [_undefinedDeps].
  void _addDependency(GenerationContext ctx, String fqname, String location) {
    if (_deps.containsKey(fqname)) return; // Already added.

    final mg = ctx.getFieldType(fqname) as MessageGenerator;
    if (mg == null) {
      _undefinedDeps[fqname] = location;
      return;
    }
    mg.checkResolved();
    _deps[mg.dottedName] = mg;
  }

  /// Adds dependencies of [generate] to [imports].
  ///
  /// For each .pb.dart file that the generated code needs to import,
  /// add its generator.
  void addImportsTo(Set<FileGenerator> imports) {
    for (var mg in _deps.values) {
      imports.add(mg.fileGen);
    }
  }

  /// Returns the Dart class name to use for a message type.
  ///
  /// Throws an exception if it can't be resolved.
  String _getDartClassName(String fqname) {
    var mg = _deps[fqname];
    if (mg == null) {
      var location = _undefinedDeps[fqname];
      // TODO(nichite): Throw more actionable error.
      throw 'FAILURE: Unknown type reference (${fqname}) for ${location}';
    }
    return mg.fileImportPrefix + '.' + mg.classname;
  }

  void generate(IndentingWriter out) {
    out.println();
    _generateService(out);
  }

  void _generateService(IndentingWriter out) {
    out.addBlock('abstract class $_serviceClassname extends $_service {', '}', () {
      out.println('$_coreImportPrefix.String get \$name => \'$_fullServiceName\';');
      out.println('$_coreImportPrefix.bool get \$isAsync => false;');
      out.println();
      out.addBlock('$_serviceClassname() {', '}', () {
        for (final method in _methods) {
          method.generateServiceMethodRegistration(out);
        }
      });
      out.println();
      for (final method in _methods) {
        method.generateServiceMethodPreamble(out);
      }
      for (final method in _methods) {
        method.generateServiceMethodStub(out);
      }
    });
  }

  static final String _service = '$_grpcImportPrefix.Service';
}

class _SyncMethod {
  final String _grpcName;
  final String _dartName;
  final String _serviceName;

  final bool _clientStreaming;
  final bool _serverStreaming;

  final String _requestType;
  final String _responseType;

  final String _argumentType;
  final String _serverReturnType;

  _SyncMethod._(this._grpcName, this._dartName, this._serviceName, this._clientStreaming, this._serverStreaming, this._requestType,
      this._responseType, this._argumentType, this._serverReturnType);

  factory _SyncMethod(ServiceSyncGenerator service, GenerationContext ctx, MethodDescriptorProto method) {
    final grpcName = method.name;
    final dartName = lowerCaseFirstLetter(grpcName);

    final clientStreaming = method.clientStreaming;
    final serverStreaming = method.serverStreaming;

    service._addDependency(ctx, method.inputType, 'input type of $grpcName');
    service._addDependency(ctx, method.outputType, 'output type of $grpcName');

    final requestType = service._getDartClassName(method.inputType);
    final responseType = service._getDartClassName(method.outputType);

    final argumentType = clientStreaming ? '$_coreImportPrefix.List<$requestType>' : requestType;
    final serverReturnType = serverStreaming ? '$_coreImportPrefix.List<$responseType>' : '$responseType';

    return _SyncMethod._(
      grpcName,
      dartName,
      service._fullServiceName,
      clientStreaming,
      serverStreaming,
      requestType,
      responseType,
      argumentType,
      serverReturnType,
    );
  }

  void generateServiceMethodRegistration(IndentingWriter out) {
    out.println('\$addMethod($_serviceMethod<$_requestType, $_responseType>(');
    out.println('    \'$_grpcName\',');
    out.println('    $_dartName${_clientStreaming ? '' : '_Pre'},');
    out.println('    $_clientStreaming,');
    out.println('    $_serverStreaming,');
    out.println('    ($_coreImportPrefix.List<$_coreImportPrefix.int> value) => $_requestType.fromBuffer(value),');
    out.println('    ($_responseType value) => value.writeToBuffer()));');
  }

  void generateServiceMethodPreamble(IndentingWriter out) {
    if (_clientStreaming) return;

    out.addBlock(
        "${_serverStreaming ? '$_coreImportPrefix.List<$_serverReturnType>' : _serverReturnType}  ${_dartName}_Pre($_serviceCall call, $_requestType request) {",
        '}', () {
      out.println('return $_dartName(request);');
    });
    out.println();
  }

  void generateServiceMethodStub(IndentingWriter out) {
    out.println('$_serverReturnType $_dartName($_argumentType request);');
  }

  static final String _serviceCall = '$_grpcImportPrefix.ServiceCall';
  static final String _serviceMethod = '$_grpcImportPrefix.ServiceMethod';
}
