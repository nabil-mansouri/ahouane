part of 'microservice.dart';

abstract class Codec<T> {
  Future<T> fromBuffer(Stream<Uint8List> stream);
  Stream<Uint8List> toBuffer(T object);
}

class CodecAdapter<T> extends Codec<T> {
  final BodyCodec<T> inner;
  CodecAdapter(this.inner);
  @override
  Future<T> fromBuffer(Stream<Uint8List> stream) {
    return inner.decode(stream);
  }

  @override
  Stream<Uint8List> toBuffer(T data) {
    return inner.encode(data);
  }

  static CodecAdapter<Json> json() {
    return CodecAdapter<Json>(JsonBodyCodec());
  }

  static CodecAdapter<String> string() {
    return CodecAdapter<String>(StringBodyCodec());
  }

  static CodecAdapter<File> file() {
    return CodecAdapter<File>(FileBodyCodec.workOnSysTemp());
  }
}
