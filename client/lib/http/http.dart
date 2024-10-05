library ahoune_http_client;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:ahouane_common/generated/http.pb.dart';
import 'package:ahouane_common/http/http.dart';

import 'package:ahouane_client/auth.dart';
import 'package:ahouane_common/utils/utils.dart';
import 'package:optional/optional.dart';
import 'package:protobuf/protobuf.dart';
import 'package:universal_io/io.dart';
export 'package:ahouane_common/http/http.dart';

part 'headers.dart';
part 'langages.dart';
part 'mimetypes.dart';
part 'range.dart';

class HttpClientRequestWrapper {
  final ClientApplication app;
  final Future<HttpClientRequest> request;
  HttpClientRequestWrapper(this.app, this.request) {
    header('Cookie', app.session[ClientApplication.SESSION_KEY]);
  }
  HttpClientRequestWrapper chunked(bool chunked) {
    request.then((value) => value.headers.chunkedTransferEncoding = chunked);
    return this;
  }

  HttpClientRequestWrapper contentType(ContentType type) {
    request.then((value) => value.headers.contentType = type);
    return this;
  }

  HttpClientRequestWrapper header(String name, String hValue) {
    request.then((value) {
      value.headers.add(name, hValue);
    });
    return this;
  }

  HttpClientRequestWrapper buffer(Uint8List json) {
    contentType(ContentTypes.Application.octetStream);
    request.then((value) => value.addStream(BufferBodyCodec().encode(json)));
    return this;
  }

  HttpClientRequestWrapper formParam(FormParamBody json) {
    contentType(ContentTypes.Application.wwwFormUrlEnconded);
    request.then((value) => value.addStream(FormParamBodyCodec().encode(json)));
    return this;
  }

  HttpClientRequestWrapper json(Json json) {
    contentType(ContentTypes.Application.json);
    request.then((value) => value.addStream(JsonBodyCodec().encode(json)));
    return this;
  }

  HttpClientRequestWrapper text(String text) {
    contentType(ContentTypes.Text.plain);
    request.then((value) => value.addStream(StringBodyCodec().encode(text)));
    return this;
  }

  HttpClientRequestWrapper object(GeneratedMessage object) {
    contentType(ContentTypes.Application.protobuff);
    request.then((value) => value.add(object.writeToBuffer()));
    return this;
  }

  HttpClientRequestWrapper write<T>(BodyCodec<T> codec, T object) {
    contentType(codec.encodeContentType);
    request.then((value) => value.addStream(codec.encode(object)));
    return this;
  }

  HttpClientRequestWrapper flush() {
    request.then((value) => value.flush());
    return this;
  }

  Future<HttpClientResponseWrapper> end() async {
    final req = await request;
    final res = await req.close();
    return HttpClientResponseWrapper(res);
  }
}

class HttpClientResponseWrapper {
  static final _prefix = 'http';
  final HttpClientResponse response;
  HttpClientResponseWrapper(this.response);
  HttpClientResponseWrapper checkStatus([int expectedStatus]) {
    if (response == null) return this;
    if (expectedStatus != null) {
      if (response.statusCode != expectedStatus) {
        return throw '$_prefix.${response.statusCode}';
      }
    } else {
      if (200 <= response.statusCode && response.statusCode <= 299) {
        return throw '$_prefix.${response.statusCode}';
      }
    }
    return this;
  }

  Encoding get charset => Encoding.getByName(contentType.charset);
  ContentType get contentType => response.headers.contentType;
  bool get chunked => response.headers.chunkedTransferEncoding;
  int get status => response.statusCode;
  int get contentLength => response.contentLength;

  String header(String name) {
    return response.headers.value(name);
  }

  List<String> headerList(String name) {
    return response.headers[name];
  }

  Future<void> noContent() {
    return Future.value();
  }

  Future<Uint8List> buffer() {
    return BufferBodyCodec().decode(response.asBroadcastStream());
  }

  Future<FormParamBody> formParam() {
    return FormParamBodyCodec().decode(response.asBroadcastStream());
  }

  Future<Json> json() {
    return JsonBodyCodec().decode(response.asBroadcastStream());
  }

  Future<String> text() {
    return StringBodyCodec().decode(response.asBroadcastStream());
  }

  Future<T> object<T extends GeneratedMessage>(T example) {
    return buffer().then((value) => example..mergeFromBuffer(value));
  }

  Future<T> write<T>(BodyCodec<T> codec) {
    return codec.decode(response.asBroadcastStream());
  }
}

class HttpClientModule {
  final String baseUri;
  final httpClient = HttpClient();
  final ClientApplication application;
  static final defaultConfig = HttpClientConfig()
    ..baseUri = '/'
    ..emulateMethods = true;
  HttpClientModule(this.application, {this.baseUri});
  Uri _uri(String path) {
    return Uri.parse(
        UriUtils.joinOrAbs(baseUri ?? application.baseUri.toString(), path));
  }

  HttpClientRequestWrapper get(String path) {
    final req = httpClient.getUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper post(String path) {
    final req = httpClient.postUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper patch(String path) {
    final req = httpClient.patchUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper put(String path) {
    final req = httpClient.putUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper delete(String path) {
    final req = httpClient.deleteUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper head(String path) {
    final req = httpClient.headUrl(_uri(path));
    return HttpClientRequestWrapper(application, req);
  }

  HttpClientRequestWrapper options(String path) {
    final req = httpClient.openUrl(HttpMethod.Options.name, _uri(path));
    return HttpClientRequestWrapper(application, req);
  }
}

extension ClientApplicationHttp on ClientApplication {
  HttpClientModule http([String baseUri]) =>
      HttpClientModule(this, baseUri: baseUri);
}
