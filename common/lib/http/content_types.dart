part of 'http.dart';

class ContentTypes {
  static final Multipart = ContentType('multipart', 'form-data');
  static final MultipartRanges = ContentType('multipart', 'byteranges');
  static final Audio = ContentTypeAudio();
  static final Application = ContentTypeApplication();
  static final Image = ContentTypeImage();
  static final Text = ContentTypeText();
  static final Video = ContentTypeVideo();
  static Optional<ContentType> isAcceptableContentType(
    List<ContentType> acceptable,
    ContentType contentType,
  ) {
    acceptable.sort((c1, c2) {
      final q1 = num.parse(c1.parameters['q'] ?? '1.0');
      final q2 = num.parse(c2.parameters['q'] ?? '1.0');
      final comparison = q1.compareTo(q2);
      if (comparison == 0) {
        if (c1.primaryType == '*' && c2.primaryType != '*') {
          return 1;
        } else if (c1.primaryType != '*' && c2.primaryType == '*') {
          return -1;
        }
        if (c1.subType == '*' && c2.subType != '*') {
          return 1;
        } else if (c1.subType != '*' && c2.subType == '*') {
          return -1;
        }
      }
      return -comparison;
    });
    final founded = acceptable.firstWhere((test) {
      return ContentTypes.matchMimetype(test, contentType);
    }, orElse: () => null);
    return Optional.ofNullable((founded));
  }

  static Optional<ContentType> parse(String str) {
    try {
      return Optional.ofNullable(ContentType.parse(str));
    } catch (e) {
      return Optional.empty();
    }
  }

  static bool matchMimetype(ContentType expected, ContentType actual) {
    if (expected == null || actual == null) return false;
    //same
    if (expected.mimeType == actual.mimeType) return true;
    // validate type
    if (expected.primaryType != '*' &&
        expected.primaryType != actual.primaryType) {
      return false;
    }
    if (expected.subType.startsWith('*+')) {
      final expectSubTypeClean = StringUtils.removeStart(expected.subType, '*');
      return actual.subType.endsWith(expectSubTypeClean);
    }
    // validate subtype
    if (expected.subType != '*' && expected.subType != actual.subType) {
      return false;
    }
    return true;
  }

  static bool isJson(ContentType type) {
    return matchMimetype(Application.json, type) ||
        matchMimetype(Text.textJson, type);
  }

  static bool isGrpc(ContentType type) {
    return matchMimetype(Application.grpc, type) ||
        matchMimetype(Application.grpcWebProto, type);
  }
}

class ContentTypeApplication {
  final atomXml = ContentType('application', 'atom+xml');
  final atomcatXml = ContentType('application', 'atomcat+xml');
  final ecmascript = ContentType('application', 'ecmascript');
  final javaArchive = ContentType('application', 'java-archive');
  final javascript = ContentType('application', 'javascript');
  final json = ContentType('application', 'json');
  final mp4 = ContentType('application', 'mp4');
  final octetStream = ContentType('application', 'octet-stream');
  final grpc = ContentType('application', 'grpc');
  final grpcWebProto = ContentType('application', 'grpc-web+proto');
  final paquet = ContentType('application', 'paquets');
  final pdf = ContentType('application', 'pdf');
  final pkcs10 = ContentType('application', 'pkcs10');
  final pkcs7Mime = ContentType('application', 'pkcs7-mime');
  final pkcs7Signature = ContentType('application', 'pkcs7-signature');
  final pkcs8 = ContentType('application', 'pkcs8');
  final postscript = ContentType('application', 'postscript');
  final protobuff = ContentType('application', 'protobuff');
  final rdfXml = ContentType('application', 'rdf+xml');
  final rssXml = ContentType('application', 'rss+xml');
  final rtf = ContentType('application', 'rtf');
  final smilXml = ContentType('application', 'smil+xml');
  final xFontOtf = ContentType('application', 'x-font-otf');
  final xFontTtf = ContentType('application', 'x-font-ttf');
  final xFontWoff = ContentType('application', 'x-font-woff');
  final xPkcs12 = ContentType('application', 'x-pkcs12');
  final xShockwaveFlash = ContentType('application', 'x-shockwave-flash');
  final xSilverlightApp = ContentType('application', 'x-silverlight-app');
  final xhtmlXml = ContentType('application', 'xhtml+xml');
  final xml = ContentType('application', 'xml');
  final xmlDtd = ContentType('application', 'xml-dtd');
  final xsltXml = ContentType('application', 'xslt+xml');
  final zip = ContentType('application', 'zip');
  final wwwFormUrlEnconded =
      ContentType('application', 'x-www-form-urlencoded');
}

class ContentTypeAudio {
  final Midi = ContentType('audio', 'midi');
  final Mp4 = ContentType('audio', 'mp4');
  final Mpeg = ContentType('audio', 'mpeg');
  final Ogg = ContentType('audio', 'ogg');
  final Webm = ContentType('audio', 'webm');
  final XAac = ContentType('audio', 'x-aac');
  final XAiff = ContentType('audio', 'x-aiff');
  final XMpegurl = ContentType('audio', 'x-mpegurl');
  final XMsWma = ContentType('audio', 'x-ms-wma');
  final XWav = ContentType('audio', 'x-wav');
}

class ContentTypeImage {
  final bmp = ContentType('image', 'bmp');
  final gif = ContentType('image', 'gif');
  final jpeg = ContentType('image', 'jpeg');
  final png = ContentType('image', 'png');
  final svgXml = ContentType('image', 'svg+xml');
  final tiff = ContentType('image', 'tiff');
  final webp = ContentType('image', 'webp');
}

class ContentTypeText {
  final all = ContentType('text', '*');
  final css = ContentType('text', 'css');
  final csv = ContentType('text', 'csv');
  final textJson = ContentType('text', 'json');
  final html = ContentType('text', 'html');
  final plain = ContentType('text', 'plain');
  final richText = ContentType('text', 'richtext');
  final sgml = ContentType('text', 'sgml');
  final xml = ContentType('text', 'xml');
  final yaml = ContentType('text', 'yaml');
}

class ContentTypeVideo {
  final threegpp = ContentType('video', '3gpp');
  final h264 = ContentType('video', 'h264');
  final mp4 = ContentType('video', 'mp4');
  final mpeg = ContentType('video', 'mpeg');
  final ogg = ContentType('video', 'ogg');
  final quicktime = ContentType('video', 'quicktime');
  final webm = ContentType('video', 'webm');
}
