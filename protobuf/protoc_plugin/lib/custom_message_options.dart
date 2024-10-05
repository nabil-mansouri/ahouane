part of protoc;

String generateMessageOptionFile({
  final OutputConfiguration config = const DefaultOutputConfiguration(),
  final bool linked = false,
  final IndentingWriter Function() makeWriter,
  final void Function(IndentingWriter out) writeHeading,
  final void Function(IndentingWriter out, OutputConfiguration config, FileGenerator target, String extension) writeImport,
  final Uri protoFileUri,
  final FileGenerator fileGenerator,
  final List<DescriptorProto> messages,
  final FileOptions options,
  final GenerationContext context,
}) {
  if (!linked) throw StateError("not linked");
  var out = makeWriter();
  writeHeading(out);
  var resolvedImport = config.resolveImport(protoFileUri, protoFileUri, ".pb.dart");

  out.println(_asyncImport);
  out.println();
  out.println(_coreImport);
  out.println("""import 'validate.pb.dart';""");
  out.println("""import '${resolvedImport}';""");
  out.println("""export '${resolvedImport}';""");
  // Import .pb.dart files needed for requests and responses.
  for (final message in messages) {
    final validations = <String>[];
    for (final field in message.field) {
      if (!field.options.rules.isFrozen) {
        validations.add("""'${field.name}': ${field.options.rules.toDartString(skipUnknown: true).replaceAll('\n', '')}""");
      }
    }
    out.println("""
extension ${message.name}Valiation on ${message.name} {
  \$core.Map<\$core.String, FieldRules> \$getValidationRules(){
    return { ${validations.join(',')} };
  }
}
    """);
  }

  return _formatter.format(out.toString());
}
