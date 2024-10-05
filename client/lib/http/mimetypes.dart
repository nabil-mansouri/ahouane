part of 'http.dart';

class MimeType {
  final List<String> extensions;
  final bool compressible;
  final String charset;
  const MimeType({
    this.extensions = const <String>[],
    this.compressible = false,
    this.charset,
  });
  static Optional<ContentType> findContentTypeForExtension(String ext) {
    if (ext == null || ext.trim().isEmpty) return Optional.empty();
    ext = ext.trim();
    ext = StringUtils.removeStart(ext, '.');
    if (kContentTypeByExtension.containsKey(ext)) {
      final contentTypeName = kContentTypeByExtension[ext];
      return ContentTypes.parse(contentTypeName);
    }
    return Optional.empty();
  }

  static bool isCompressible(ContentType type) {
    return kMimeTypes.containsKey(type.mimeType) &&
        kMimeTypes[type.mimeType].compressible;
  }

  static Optional<Encoding> defaultCharset(ContentType type) {
    if (kMimeTypes.containsKey(type.mimeType)) {
      final res = kMimeTypes[type.mimeType];
      if (res.charset != null) {
        return Optional.ofNullable(Encoding.getByName(res.charset));
      }
    }
    return Optional.empty();
  }
}

final kMimeTypes = {
  'application/3gpdash-qoe-report+xml': MimeType(
    compressible: true,
  ),
  'application/3gpp-ims+xml': MimeType(
    compressible: true,
  ),
  'application/activity+json': MimeType(
    compressible: true,
  ),
  'application/alto-costmap+json': MimeType(
    compressible: true,
  ),
  'application/alto-costmapfilter+json': MimeType(
    compressible: true,
  ),
  'application/alto-directory+json': MimeType(
    compressible: true,
  ),
  'application/alto-endpointcost+json': MimeType(
    compressible: true,
  ),
  'application/alto-endpointcostparams+json': MimeType(
    compressible: true,
  ),
  'application/alto-endpointprop+json': MimeType(
    compressible: true,
  ),
  'application/alto-endpointpropparams+json': MimeType(
    compressible: true,
  ),
  'application/alto-error+json': MimeType(
    compressible: true,
  ),
  'application/alto-networkmap+json': MimeType(
    compressible: true,
  ),
  'application/alto-networkmapfilter+json': MimeType(
    compressible: true,
  ),
  'application/andrew-inset': MimeType(
    extensions: ['ez'],
  ),
  'application/applixware': MimeType(
    extensions: ['aw'],
  ),
  'application/atom+xml': MimeType(
    compressible: true,
    extensions: ['atom'],
  ),
  'application/atomcat+xml': MimeType(
    compressible: true,
    extensions: ['atomcat'],
  ),
  'application/atomdeleted+xml': MimeType(
    compressible: true,
    extensions: ['atomdeleted'],
  ),
  'application/atomsvc+xml': MimeType(
    compressible: true,
    extensions: ['atomsvc'],
  ),
  'application/atsc-dwd+xml': MimeType(
    compressible: true,
    extensions: ['dwd'],
  ),
  'application/atsc-held+xml': MimeType(
    compressible: true,
    extensions: ['held'],
  ),
  'application/atsc-rdt+json': MimeType(
    compressible: true,
  ),
  'application/atsc-rsat+xml': MimeType(
    compressible: true,
    extensions: ['rsat'],
  ),
  'application/auth-policy+xml': MimeType(
    compressible: true,
  ),
  'application/bacnet-xdd+zip': MimeType(
    compressible: false,
  ),
  'application/bdoc': MimeType(
    compressible: false,
    extensions: ['bdoc'],
  ),
  'application/beep+xml': MimeType(
    compressible: true,
  ),
  'application/calendar+json': MimeType(
    compressible: true,
  ),
  'application/calendar+xml': MimeType(
    compressible: true,
    extensions: ['xcs'],
  ),
  'application/ccmp+xml': MimeType(
    compressible: true,
  ),
  'application/ccxml+xml': MimeType(
    compressible: true,
    extensions: ['ccxml'],
  ),
  'application/cdfx+xml': MimeType(
    compressible: true,
    extensions: ['cdfx'],
  ),
  'application/cdmi-capability': MimeType(
    extensions: ['cdmia'],
  ),
  'application/cdmi-container': MimeType(
    extensions: ['cdmic'],
  ),
  'application/cdmi-domain': MimeType(
    extensions: ['cdmid'],
  ),
  'application/cdmi-object': MimeType(
    extensions: ['cdmio'],
  ),
  'application/cdmi-queue': MimeType(
    extensions: ['cdmiq'],
  ),
  'application/cea-2018+xml': MimeType(
    compressible: true,
  ),
  'application/cellml+xml': MimeType(
    compressible: true,
  ),
  'application/clue+xml': MimeType(
    compressible: true,
  ),
  'application/clue_info+xml': MimeType(
    compressible: true,
  ),
  'application/cnrp+xml': MimeType(
    compressible: true,
  ),
  'application/coap-group+json': MimeType(
    compressible: true,
  ),
  'application/conference-info+xml': MimeType(
    compressible: true,
  ),
  'application/cpl+xml': MimeType(
    compressible: true,
  ),
  'application/csta+xml': MimeType(
    compressible: true,
  ),
  'application/cstadata+xml': MimeType(
    compressible: true,
  ),
  'application/csvm+json': MimeType(
    compressible: true,
  ),
  'application/cu-seeme': MimeType(
    extensions: ['cu'],
  ),
  'application/dart': MimeType(
    compressible: true,
  ),
  'application/dash+xml': MimeType(
    compressible: true,
    extensions: ['mpd'],
  ),
  'application/davmount+xml': MimeType(
    compressible: true,
    extensions: ['davmount'],
  ),
  'application/dialog-info+xml': MimeType(
    compressible: true,
  ),
  'application/dicom+json': MimeType(
    compressible: true,
  ),
  'application/dicom+xml': MimeType(
    compressible: true,
  ),
  'application/dns+json': MimeType(
    compressible: true,
  ),
  'application/docbook+xml': MimeType(
    compressible: true,
    extensions: ['dbk'],
  ),
  'application/dskpp+xml': MimeType(
    compressible: true,
  ),
  'application/dssc+der': MimeType(
    extensions: ['dssc'],
  ),
  'application/dssc+xml': MimeType(
    compressible: true,
    extensions: ['xdssc'],
  ),
  'application/ecmascript': MimeType(
    compressible: true,
    extensions: ['ecma', 'es'],
  ),
  'application/edi-x12': MimeType(
    compressible: false,
  ),
  'application/edifact': MimeType(
    compressible: false,
  ),
  'application/emergencycalldata.comment+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.control+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.deviceinfo+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.providerinfo+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.serviceinfo+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.subscriberinfo+xml': MimeType(
    compressible: true,
  ),
  'application/emergencycalldata.veds+xml': MimeType(
    compressible: true,
  ),
  'application/emma+xml': MimeType(
    compressible: true,
    extensions: ['emma'],
  ),
  'application/emotionml+xml': MimeType(
    compressible: true,
    extensions: ['emotionml'],
  ),
  'application/epp+xml': MimeType(
    compressible: true,
  ),
  'application/epub+zip': MimeType(
    compressible: false,
    extensions: ['epub'],
  ),
  'application/exi': MimeType(
    extensions: ['exi'],
  ),
  'application/expect-ct-report+json': MimeType(
    compressible: true,
  ),
  'application/fdt+xml': MimeType(
    compressible: true,
    extensions: ['fdt'],
  ),
  'application/fhir+json': MimeType(
    compressible: true,
  ),
  'application/fhir+xml': MimeType(
    compressible: true,
  ),
  'application/fido.trusted-apps+json': MimeType(
    compressible: true,
  ),
  'application/font-tdpfr': MimeType(
    extensions: ['pfr'],
  ),
  'application/font-woff': MimeType(
    compressible: false,
  ),
  'application/framework-attributes+xml': MimeType(
    compressible: true,
  ),
  'application/geo+json': MimeType(
    compressible: true,
    extensions: ['geojson'],
  ),
  'application/geoxacml+xml': MimeType(
    compressible: true,
  ),
  'application/gml+xml': MimeType(
    compressible: true,
    extensions: ['gml'],
  ),
  'application/gpx+xml': MimeType(
    compressible: true,
    extensions: ['gpx'],
  ),
  'application/gxf': MimeType(
    extensions: ['gxf'],
  ),
  'application/gzip': MimeType(
    compressible: false,
    extensions: ['gz'],
  ),
  'application/held+xml': MimeType(
    compressible: true,
  ),
  'application/hjson': MimeType(
    extensions: ['hjson'],
  ),
  'application/hyperstudio': MimeType(
    extensions: ['stk'],
  ),
  'application/ibe-key-request+xml': MimeType(
    compressible: true,
  ),
  'application/ibe-pkg-reply+xml': MimeType(
    compressible: true,
  ),
  'application/im-iscomposing+xml': MimeType(
    compressible: true,
  ),
  'application/inkml+xml': MimeType(
    compressible: true,
    extensions: ['ink', 'inkml'],
  ),
  'application/ipfix': MimeType(
    extensions: ['ipfix'],
  ),
  'application/its+xml': MimeType(
    compressible: true,
    extensions: ['its'],
  ),
  'application/java-archive': MimeType(
    compressible: false,
    extensions: ['jar', 'war', 'ear'],
  ),
  'application/java-serialized-object': MimeType(
    compressible: false,
    extensions: ['ser'],
  ),
  'application/java-vm': MimeType(
    compressible: false,
    extensions: ['class'],
  ),
  'application/javascript': MimeType(
    charset: 'UTF-8',
    compressible: true,
    extensions: ['js', 'mjs'],
  ),
  'application/jf2feed+json': MimeType(
    compressible: true,
  ),
  'application/jose+json': MimeType(
    compressible: true,
  ),
  'application/jrd+json': MimeType(
    compressible: true,
  ),
  'application/json': MimeType(
    charset: 'UTF-8',
    compressible: true,
    extensions: ['json', 'map'],
  ),
  'application/json-patch+json': MimeType(
    compressible: true,
  ),
  'application/json5': MimeType(
    extensions: ['json5'],
  ),
  'application/jsonml+json': MimeType(
    compressible: true,
    extensions: ['jsonml'],
  ),
  'application/jwk+json': MimeType(
    compressible: true,
  ),
  'application/jwk-set+json': MimeType(
    compressible: true,
  ),
  'application/kpml-request+xml': MimeType(
    compressible: true,
  ),
  'application/kpml-response+xml': MimeType(
    compressible: true,
  ),
  'application/ld+json': MimeType(
    compressible: true,
    extensions: ['jsonld'],
  ),
  'application/lgr+xml': MimeType(
    compressible: true,
    extensions: ['lgr'],
  ),
  'application/load-control+xml': MimeType(
    compressible: true,
  ),
  'application/lost+xml': MimeType(
    compressible: true,
    extensions: ['lostxml'],
  ),
  'application/lostsync+xml': MimeType(
    compressible: true,
  ),
  'application/mac-binhex40': MimeType(
    extensions: ['hqx'],
  ),
  'application/mac-compactpro': MimeType(
    extensions: ['cpt'],
  ),
  'application/mads+xml': MimeType(
    compressible: true,
    extensions: ['mads'],
  ),
  'application/manifest+json': MimeType(
    charset: 'UTF-8',
    compressible: true,
    extensions: ['webmanifest'],
  ),
  'application/marc': MimeType(
    extensions: ['mrc'],
  ),
  'application/marcxml+xml': MimeType(
    compressible: true,
    extensions: ['mrcx'],
  ),
  'application/mathematica': MimeType(
    extensions: ['ma', 'nb', 'mb'],
  ),
  'application/mathml+xml': MimeType(
    compressible: true,
    extensions: ['mathml'],
  ),
  'application/mathml-content+xml': MimeType(
    compressible: true,
  ),
  'application/mathml-presentation+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-associated-procedure-description+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-deregister+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-envelope+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-msk+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-msk-response+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-protection-description+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-reception-report+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-register+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-register-response+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-schedule+xml': MimeType(
    compressible: true,
  ),
  'application/mbms-user-service-description+xml': MimeType(
    compressible: true,
  ),
  'application/mbox': MimeType(
    extensions: ['mbox'],
  ),
  'application/media-policy-dataset+xml': MimeType(
    compressible: true,
  ),
  'application/media_control+xml': MimeType(
    compressible: true,
  ),
  'application/mediaservercontrol+xml': MimeType(
    compressible: true,
    extensions: ['mscml'],
  ),
  'application/merge-patch+json': MimeType(
    compressible: true,
  ),
  'application/metalink+xml': MimeType(
    compressible: true,
    extensions: ['metalink'],
  ),
  'application/metalink4+xml': MimeType(
    compressible: true,
    extensions: ['meta4'],
  ),
  'application/mets+xml': MimeType(
    compressible: true,
    extensions: ['mets'],
  ),
  'application/mmt-aei+xml': MimeType(
    compressible: true,
    extensions: ['maei'],
  ),
  'application/mmt-usd+xml': MimeType(
    compressible: true,
    extensions: ['musd'],
  ),
  'application/mods+xml': MimeType(
    compressible: true,
    extensions: ['mods'],
  ),
  'application/mp21': MimeType(
    extensions: ['m21', 'mp21'],
  ),
  'application/mp4': MimeType(
    extensions: ['mp4s', 'm4p'],
  ),
  'application/mrb-consumer+xml': MimeType(
    compressible: true,
    extensions: ['xdf'],
  ),
  'application/mrb-publish+xml': MimeType(
    compressible: true,
    extensions: ['xdf'],
  ),
  'application/msc-ivr+xml': MimeType(
    compressible: true,
  ),
  'application/msc-mixer+xml': MimeType(
    compressible: true,
  ),
  'application/msword': MimeType(
    compressible: false,
    extensions: ['doc', 'dot'],
  ),
  'application/mud+json': MimeType(
    compressible: true,
  ),
  'application/mxf': MimeType(
    extensions: ['mxf'],
  ),
  'application/n-quads': MimeType(
    extensions: ['nq'],
  ),
  'application/n-triples': MimeType(
    extensions: ['nt'],
  ),
  'application/nlsml+xml': MimeType(
    compressible: true,
  ),
  'application/octet-stream': MimeType(
    compressible: false,
    extensions: [
      'bin',
      'dms',
      'lrf',
      'mar',
      'so',
      'dist',
      'distz',
      'pkg',
      'bpk',
      'dump',
      'elc',
      'deploy',
      'exe',
      'dll',
      'deb',
      'dmg',
      'iso',
      'img',
      'msi',
      'msp',
      'msm',
      'buffer'
    ],
  ),
  'application/oda': MimeType(
    extensions: ['oda'],
  ),
  'application/odm+xml': MimeType(
    compressible: true,
  ),
  'application/oebps-package+xml': MimeType(
    compressible: true,
    extensions: ['opf'],
  ),
  'application/ogg': MimeType(
    compressible: false,
    extensions: ['ogx'],
  ),
  'application/omdoc+xml': MimeType(
    compressible: true,
    extensions: ['omdoc'],
  ),
  'application/onenote': MimeType(
    extensions: ['onetoc', 'onetoc2', 'onetmp', 'onepkg'],
  ),
  'application/oxps': MimeType(
    extensions: ['oxps'],
  ),
  'application/p2p-overlay+xml': MimeType(
    compressible: true,
    extensions: ['relo'],
  ),
  'application/patch-ops-error+xml': MimeType(
    compressible: true,
    extensions: ['xer'],
  ),
  'application/pdf': MimeType(
    compressible: false,
    extensions: ['pdf'],
  ),
  'application/pgp-encrypted': MimeType(
    compressible: false,
    extensions: ['pgp'],
  ),
  'application/pgp-signature': MimeType(
    extensions: ['asc', 'sig'],
  ),
  'application/pics-rules': MimeType(
    extensions: ['prf'],
  ),
  'application/pidf+xml': MimeType(
    compressible: true,
  ),
  'application/pidf-diff+xml': MimeType(
    compressible: true,
  ),
  'application/pkcs10': MimeType(
    extensions: ['p10'],
  ),
  'application/pkcs7-mime': MimeType(
    extensions: ['p7m', 'p7c'],
  ),
  'application/pkcs7-signature': MimeType(
    extensions: ['p7s'],
  ),
  'application/pkcs8': MimeType(
    extensions: ['p8'],
  ),
  'application/pkix-attr-cert': MimeType(
    extensions: ['ac'],
  ),
  'application/pkix-cert': MimeType(
    extensions: ['cer'],
  ),
  'application/pkix-crl': MimeType(
    extensions: ['crl'],
  ),
  'application/pkix-pkipath': MimeType(
    extensions: ['pkipath'],
  ),
  'application/pkixcmp': MimeType(
    extensions: ['pki'],
  ),
  'application/pls+xml': MimeType(
    compressible: true,
    extensions: ['pls'],
  ),
  'application/poc-settings+xml': MimeType(
    compressible: true,
  ),
  'application/postscript': MimeType(
    compressible: true,
    extensions: ['ai', 'eps', 'ps'],
  ),
  'application/ppsp-tracker+json': MimeType(
    compressible: true,
  ),
  'application/problem+json': MimeType(
    compressible: true,
  ),
  'application/problem+xml': MimeType(
    compressible: true,
  ),
  'application/provenance+xml': MimeType(
    compressible: true,
    extensions: ['provx'],
  ),
  'application/prs.cww': MimeType(
    extensions: ['cww'],
  ),
  'application/prs.hpub+zip': MimeType(
    compressible: false,
  ),
  'application/prs.xsf+xml': MimeType(
    compressible: true,
  ),
  'application/pskc+xml': MimeType(
    compressible: true,
    extensions: ['pskcxml'],
  ),
  'application/raml+yaml': MimeType(
    compressible: true,
    extensions: ['raml'],
  ),
  'application/rdap+json': MimeType(
    compressible: true,
  ),
  'application/rdf+xml': MimeType(
    compressible: true,
    extensions: ['rdf', 'owl'],
  ),
  'application/reginfo+xml': MimeType(
    compressible: true,
    extensions: ['rif'],
  ),
  'application/relax-ng-compact-syntax': MimeType(
    extensions: ['rnc'],
  ),
  'application/reputon+json': MimeType(
    compressible: true,
  ),
  'application/resource-lists+xml': MimeType(
    compressible: true,
    extensions: ['rl'],
  ),
  'application/resource-lists-diff+xml': MimeType(
    compressible: true,
    extensions: ['rld'],
  ),
  'application/rfc+xml': MimeType(
    compressible: true,
  ),
  'application/rlmi+xml': MimeType(
    compressible: true,
  ),
  'application/rls-services+xml': MimeType(
    compressible: true,
    extensions: ['rs'],
  ),
  'application/route-apd+xml': MimeType(
    compressible: true,
    extensions: ['rapd'],
  ),
  'application/route-s-tsid+xml': MimeType(
    compressible: true,
    extensions: ['sls'],
  ),
  'application/route-usd+xml': MimeType(
    compressible: true,
    extensions: ['rusd'],
  ),
  'application/rpki-ghostbusters': MimeType(
    extensions: ['gbr'],
  ),
  'application/rpki-manifest': MimeType(
    extensions: ['mft'],
  ),
  'application/rpki-roa': MimeType(
    extensions: ['roa'],
  ),
  'application/rsd+xml': MimeType(
    compressible: true,
    extensions: ['rsd'],
  ),
  'application/rss+xml': MimeType(
    compressible: true,
    extensions: ['rss'],
  ),
  'application/rtf': MimeType(
    compressible: true,
    extensions: ['rtf'],
  ),
  'application/samlassertion+xml': MimeType(
    compressible: true,
  ),
  'application/samlmetadata+xml': MimeType(
    compressible: true,
  ),
  'application/sbml+xml': MimeType(
    compressible: true,
    extensions: ['sbml'],
  ),
  'application/scaip+xml': MimeType(
    compressible: true,
  ),
  'application/scim+json': MimeType(
    compressible: true,
  ),
  'application/scvp-cv-request': MimeType(
    extensions: ['scq'],
  ),
  'application/scvp-cv-response': MimeType(
    extensions: ['scs'],
  ),
  'application/scvp-vp-request': MimeType(
    extensions: ['spq'],
  ),
  'application/scvp-vp-response': MimeType(
    extensions: ['spp'],
  ),
  'application/sdp': MimeType(
    extensions: ['sdp'],
  ),
  'application/senml+json': MimeType(
    compressible: true,
  ),
  'application/senml+xml': MimeType(
    compressible: true,
    extensions: ['senmlx'],
  ),
  'application/sensml+json': MimeType(
    compressible: true,
  ),
  'application/sensml+xml': MimeType(
    compressible: true,
    extensions: ['sensmlx'],
  ),
  'application/sep+xml': MimeType(
    compressible: true,
  ),
  'application/set-payment-initiation': MimeType(
    extensions: ['setpay'],
  ),
  'application/set-registration-initiation': MimeType(
    extensions: ['setreg'],
  ),
  'application/shf+xml': MimeType(
    compressible: true,
    extensions: ['shf'],
  ),
  'application/sieve': MimeType(
    extensions: ['siv', 'sieve'],
  ),
  'application/simple-filter+xml': MimeType(
    compressible: true,
  ),
  'application/smil+xml': MimeType(
    compressible: true,
    extensions: ['smi', 'smil'],
  ),
  'application/soap+xml': MimeType(
    compressible: true,
  ),
  'application/sparql-query': MimeType(
    extensions: ['rq'],
  ),
  'application/sparql-results+xml': MimeType(
    compressible: true,
    extensions: ['srx'],
  ),
  'application/spirits-event+xml': MimeType(
    compressible: true,
  ),
  'application/srgs': MimeType(
    extensions: ['gram'],
  ),
  'application/srgs+xml': MimeType(
    compressible: true,
    extensions: ['grxml'],
  ),
  'application/sru+xml': MimeType(
    compressible: true,
    extensions: ['sru'],
  ),
  'application/ssdl+xml': MimeType(
    compressible: true,
    extensions: ['ssdl'],
  ),
  'application/ssml+xml': MimeType(
    compressible: true,
    extensions: ['ssml'],
  ),
  'application/stix+json': MimeType(
    compressible: true,
  ),
  'application/swid+xml': MimeType(
    compressible: true,
    extensions: ['swidtag'],
  ),
  'application/tar': MimeType(
    compressible: true,
  ),
  'application/taxii+json': MimeType(
    compressible: true,
  ),
  'application/td+json': MimeType(
    compressible: true,
  ),
  'application/tei+xml': MimeType(
    compressible: true,
    extensions: ['tei', 'teicorpus'],
  ),
  'application/thraud+xml': MimeType(
    compressible: true,
    extensions: ['tfi'],
  ),
  'application/timestamped-data': MimeType(
    extensions: ['tsd'],
  ),
  'application/tlsrpt+json': MimeType(
    compressible: true,
  ),
  'application/toml': MimeType(
    compressible: true,
    extensions: ['toml'],
  ),
  'application/ttml+xml': MimeType(
    compressible: true,
    extensions: ['ttml'],
  ),
  'application/urc-grpsheet+xml': MimeType(
    compressible: true,
  ),
  'application/urc-ressheet+xml': MimeType(
    compressible: true,
    extensions: ['rsheet'],
  ),
  'application/urc-targetdesc+xml': MimeType(
    compressible: true,
  ),
  'application/urc-uisocketdesc+xml': MimeType(
    compressible: true,
  ),
  'application/vcard+json': MimeType(
    compressible: true,
  ),
  'application/vcard+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.1000minds.decision-model+xml': MimeType(
    compressible: true,
    extensions: ['1km'],
  ),
  'application/vnd.3gpp-prose+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp-prose-pc3ch+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.access-transfer-events+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.bsf+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.gmop+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcdata-affiliation-command+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcdata-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcdata-service-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcdata-ue-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcdata-user-profile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-affiliation-command+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-floor-request+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-location-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-mbms-usage-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-service-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-signed+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-ue-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-ue-init-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcptt-user-profile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-affiliation-command+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-affiliation-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-location-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-mbms-usage-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-service-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-transmission-request+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-ue-config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mcvideo-user-profile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.mid-call+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.pic-bw-large': MimeType(
    extensions: ['plb'],
  ),
  'application/vnd.3gpp.pic-bw-small': MimeType(
    extensions: ['psb'],
  ),
  'application/vnd.3gpp.pic-bw-var': MimeType(
    extensions: ['pvb'],
  ),
  'application/vnd.3gpp.sms+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.srvcc-ext+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.srvcc-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.state-and-event-info+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp.ussd+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp2.bcmcsinfo+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.3gpp2.tcap': MimeType(
    extensions: ['tcap'],
  ),
  'application/vnd.3m.post-it-notes': MimeType(
    extensions: ['pwn'],
  ),
  'application/vnd.accpac.simply.aso': MimeType(
    extensions: ['aso'],
  ),
  'application/vnd.accpac.simply.imp': MimeType(
    extensions: ['imp'],
  ),
  'application/vnd.acucobol': MimeType(
    extensions: ['acu'],
  ),
  'application/vnd.acucorp': MimeType(
    extensions: ['atc', 'acutc'],
  ),
  'application/vnd.adobe.air-application-installer-package+zip': MimeType(
    compressible: false,
    extensions: ['air'],
  ),
  'application/vnd.adobe.formscentral.fcdt': MimeType(
    extensions: ['fcdt'],
  ),
  'application/vnd.adobe.fxp': MimeType(
    extensions: ['fxp', 'fxpl'],
  ),
  'application/vnd.adobe.xdp+xml': MimeType(
    compressible: true,
    extensions: ['xdp'],
  ),
  'application/vnd.adobe.xfdf': MimeType(
    extensions: ['xfdf'],
  ),
  'application/vnd.ahead.space': MimeType(
    extensions: ['ahead'],
  ),
  'application/vnd.airzip.filesecure.azf': MimeType(
    extensions: ['azf'],
  ),
  'application/vnd.airzip.filesecure.azs': MimeType(
    extensions: ['azs'],
  ),
  'application/vnd.amadeus+json': MimeType(
    compressible: true,
  ),
  'application/vnd.amazon.ebook': MimeType(
    extensions: ['azw'],
  ),
  'application/vnd.americandynamics.acc': MimeType(
    extensions: ['acc'],
  ),
  'application/vnd.amiga.ami': MimeType(
    extensions: ['ami'],
  ),
  'application/vnd.amundsen.maze+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.android.package-archive': MimeType(
    compressible: false,
    extensions: ['apk'],
  ),
  'application/vnd.anser-web-certificate-issue-initiation': MimeType(
    extensions: ['cii'],
  ),
  'application/vnd.anser-web-funds-transfer-initiation': MimeType(
    extensions: ['fti'],
  ),
  'application/vnd.antix.game-component': MimeType(
    extensions: ['atx'],
  ),
  'application/vnd.api+json': MimeType(
    compressible: true,
  ),
  'application/vnd.aplextor.warrp+json': MimeType(
    compressible: true,
  ),
  'application/vnd.apothekende.reservation+json': MimeType(
    compressible: true,
  ),
  'application/vnd.apple.installer+xml': MimeType(
    compressible: true,
    extensions: ['mpkg'],
  ),
  'application/vnd.apple.keynote': MimeType(
    extensions: ['keynote'],
  ),
  'application/vnd.apple.mpegurl': MimeType(
    extensions: ['m3u8'],
  ),
  'application/vnd.apple.numbers': MimeType(
    extensions: ['numbers'],
  ),
  'application/vnd.apple.pages': MimeType(
    extensions: ['pages'],
  ),
  'application/vnd.apple.pkpass': MimeType(
    compressible: false,
    extensions: ['pkpass'],
  ),
  'application/vnd.aristanetworks.swi': MimeType(
    extensions: ['swi'],
  ),
  'application/vnd.artisan+json': MimeType(
    compressible: true,
  ),
  'application/vnd.astraea-software.iota': MimeType(
    extensions: ['iota'],
  ),
  'application/vnd.audiograph': MimeType(
    extensions: ['aep'],
  ),
  'application/vnd.avalon+json': MimeType(
    compressible: true,
  ),
  'application/vnd.avistar+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.balsamiq.bmml+xml': MimeType(
    compressible: true,
    extensions: ['bmml'],
  ),
  'application/vnd.bbf.usp.msg+json': MimeType(
    compressible: true,
  ),
  'application/vnd.bekitzur-stech+json': MimeType(
    compressible: true,
  ),
  'application/vnd.biopax.rdf+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.blueice.multipass': MimeType(
    extensions: ['mpm'],
  ),
  'application/vnd.bmi': MimeType(
    extensions: ['bmi'],
  ),
  'application/vnd.businessobjects': MimeType(
    extensions: ['rep'],
  ),
  'application/vnd.byu.uapi+json': MimeType(
    compressible: true,
  ),
  'application/vnd.capasystems-pg+json': MimeType(
    compressible: true,
  ),
  'application/vnd.chemdraw+xml': MimeType(
    compressible: true,
    extensions: ['cdxml'],
  ),
  'application/vnd.chipnuts.karaoke-mmd': MimeType(
    extensions: ['mmd'],
  ),
  'application/vnd.cinderella': MimeType(
    extensions: ['cdy'],
  ),
  'application/vnd.citationstyles.style+xml': MimeType(
    compressible: true,
    extensions: ['csl'],
  ),
  'application/vnd.claymore': MimeType(
    extensions: ['cla'],
  ),
  'application/vnd.cloanto.rp9': MimeType(
    extensions: ['rp9'],
  ),
  'application/vnd.clonk.c4group': MimeType(
    extensions: ['c4g', 'c4d', 'c4f', 'c4p', 'c4u'],
  ),
  'application/vnd.cluetrust.cartomobile-config': MimeType(
    extensions: ['c11amc'],
  ),
  'application/vnd.cluetrust.cartomobile-config-pkg': MimeType(
    extensions: ['c11amz'],
  ),
  'application/vnd.collection+json': MimeType(
    compressible: true,
  ),
  'application/vnd.collection.doc+json': MimeType(
    compressible: true,
  ),
  'application/vnd.collection.next+json': MimeType(
    compressible: true,
  ),
  'application/vnd.comicbook+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.commonspace': MimeType(
    extensions: ['csp'],
  ),
  'application/vnd.contact.cmsg': MimeType(
    extensions: ['cdbcmsg'],
  ),
  'application/vnd.coreos.ignition+json': MimeType(
    compressible: true,
  ),
  'application/vnd.cosmocaller': MimeType(
    extensions: ['cmc'],
  ),
  'application/vnd.crick.clicker': MimeType(
    extensions: ['clkx'],
  ),
  'application/vnd.crick.clicker.keyboard': MimeType(
    extensions: ['clkk'],
  ),
  'application/vnd.crick.clicker.palette': MimeType(
    extensions: ['clkp'],
  ),
  'application/vnd.crick.clicker.template': MimeType(
    extensions: ['clkt'],
  ),
  'application/vnd.crick.clicker.wordbank': MimeType(
    extensions: ['clkw'],
  ),
  'application/vnd.criticaltools.wbs+xml': MimeType(
    compressible: true,
    extensions: ['wbs'],
  ),
  'application/vnd.cryptii.pipe+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ctc-posml': MimeType(
    extensions: ['pml'],
  ),
  'application/vnd.ctct.ws+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.cups-ppd': MimeType(
    extensions: ['ppd'],
  ),
  'application/vnd.curl.car': MimeType(
    extensions: ['car'],
  ),
  'application/vnd.curl.pcurl': MimeType(
    extensions: ['pcurl'],
  ),
  'application/vnd.cyan.dean.root+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.d2l.coursepackage1p0+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.dart': MimeType(
    compressible: true,
    extensions: ['dart'],
  ),
  'application/vnd.data-vision.rdz': MimeType(
    extensions: ['rdz'],
  ),
  'application/vnd.datapackage+json': MimeType(
    compressible: true,
  ),
  'application/vnd.dataresource+json': MimeType(
    compressible: true,
  ),
  'application/vnd.dece.data': MimeType(
    extensions: ['uvf', 'uvvf', 'uvd', 'uvvd'],
  ),
  'application/vnd.dece.ttml+xml': MimeType(
    compressible: true,
    extensions: ['uvt', 'uvvt'],
  ),
  'application/vnd.dece.unspecified': MimeType(
    extensions: ['uvx', 'uvvx'],
  ),
  'application/vnd.dece.zip': MimeType(
    extensions: ['uvz', 'uvvz'],
  ),
  'application/vnd.denovo.fcselayout-link': MimeType(
    extensions: ['fe_launch'],
  ),
  'application/vnd.dm.delegation+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dna': MimeType(
    extensions: ['dna'],
  ),
  'application/vnd.document+json': MimeType(
    compressible: true,
  ),
  'application/vnd.dolby.mlp': MimeType(
    extensions: ['mlp'],
  ),
  'application/vnd.dpgraph': MimeType(
    extensions: ['dpg'],
  ),
  'application/vnd.dreamfactory': MimeType(
    extensions: ['dfac'],
  ),
  'application/vnd.drive+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ds-keypoint': MimeType(
    extensions: ['kpxx'],
  ),
  'application/vnd.dvb.ait': MimeType(
    extensions: ['ait'],
  ),
  'application/vnd.dvb.dvbisl+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-aggregate-root+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-container+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-generic+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-ia-msglist+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-ia-registration-request+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-ia-registration-response+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.notif-init+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.dvb.service': MimeType(
    extensions: ['svc'],
  ),
  'application/vnd.dynageo': MimeType(
    extensions: ['geo'],
  ),
  'application/vnd.ecowin.chart': MimeType(
    extensions: ['mag'],
  ),
  'application/vnd.emclient.accessrequest+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.enliven': MimeType(
    extensions: ['nml'],
  ),
  'application/vnd.eprints.data+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.epson.esf': MimeType(
    extensions: ['esf'],
  ),
  'application/vnd.epson.msf': MimeType(
    extensions: ['msf'],
  ),
  'application/vnd.epson.quickanime': MimeType(
    extensions: ['qam'],
  ),
  'application/vnd.epson.salt': MimeType(
    extensions: ['slt'],
  ),
  'application/vnd.epson.ssf': MimeType(
    extensions: ['ssf'],
  ),
  'application/vnd.espass-espass+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.eszigno3+xml': MimeType(
    compressible: true,
    extensions: ['es3', 'et3'],
  ),
  'application/vnd.etsi.aoc+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.asic-e+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.etsi.asic-s+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.etsi.cug+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvcommand+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvdiscovery+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvprofile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvsad-bc+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvsad-cod+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvsad-npvr+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvservice+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvsync+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.iptvueprofile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.mcid+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.overload-control-policy-dataset+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.pstn+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.sci+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.simservs+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.etsi.tsl+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.exstream-empower+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.ezpix-album': MimeType(
    extensions: ['ez2'],
  ),
  'application/vnd.ezpix-package': MimeType(
    extensions: ['ez3'],
  ),
  'application/vnd.fdf': MimeType(
    extensions: ['fdf'],
  ),
  'application/vnd.fdsn.mseed': MimeType(
    extensions: ['mseed'],
  ),
  'application/vnd.fdsn.seed': MimeType(
    extensions: ['seed', 'dataless'],
  ),
  'application/vnd.ficlab.flb+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.flographit': MimeType(
    extensions: ['gph'],
  ),
  'application/vnd.fluxtime.clip': MimeType(
    extensions: ['ftc'],
  ),
  'application/vnd.framemaker': MimeType(
    extensions: ['fm', 'frame', 'maker', 'book'],
  ),
  'application/vnd.frogans.fnc': MimeType(
    extensions: ['fnc'],
  ),
  'application/vnd.frogans.ltf': MimeType(
    extensions: ['ltf'],
  ),
  'application/vnd.fsc.weblaunch': MimeType(
    extensions: ['fsc'],
  ),
  'application/vnd.fujitsu.oasys': MimeType(
    extensions: ['oas'],
  ),
  'application/vnd.fujitsu.oasys2': MimeType(
    extensions: ['oa2'],
  ),
  'application/vnd.fujitsu.oasys3': MimeType(
    extensions: ['oa3'],
  ),
  'application/vnd.fujitsu.oasysgp': MimeType(
    extensions: ['fg5'],
  ),
  'application/vnd.fujitsu.oasysprs': MimeType(
    extensions: ['bh2'],
  ),
  'application/vnd.fujixerox.ddd': MimeType(
    extensions: ['ddd'],
  ),
  'application/vnd.fujixerox.docuworks': MimeType(
    extensions: ['xdw'],
  ),
  'application/vnd.fujixerox.docuworks.binder': MimeType(
    extensions: ['xbd'],
  ),
  'application/vnd.futoin+json': MimeType(
    compressible: true,
  ),
  'application/vnd.fuzzysheet': MimeType(
    extensions: ['fzs'],
  ),
  'application/vnd.genomatix.tuxedo': MimeType(
    extensions: ['txd'],
  ),
  'application/vnd.gentics.grd+json': MimeType(
    compressible: true,
  ),
  'application/vnd.geo+json': MimeType(
    compressible: true,
  ),
  'application/vnd.geocube+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.geogebra.file': MimeType(
    extensions: ['ggb'],
  ),
  'application/vnd.geogebra.tool': MimeType(
    extensions: ['ggt'],
  ),
  'application/vnd.geometry-explorer': MimeType(
    extensions: ['gex', 'gre'],
  ),
  'application/vnd.geonext': MimeType(
    extensions: ['gxt'],
  ),
  'application/vnd.geoplan': MimeType(
    extensions: ['g2w'],
  ),
  'application/vnd.geospace': MimeType(
    extensions: ['g3w'],
  ),
  'application/vnd.gmx': MimeType(
    extensions: ['gmx'],
  ),
  'application/vnd.google-apps.document': MimeType(
    compressible: false,
    extensions: ['gdoc'],
  ),
  'application/vnd.google-apps.presentation': MimeType(
    compressible: false,
    extensions: ['gslides'],
  ),
  'application/vnd.google-apps.spreadsheet': MimeType(
    compressible: false,
    extensions: ['gsheet'],
  ),
  'application/vnd.google-earth.kml+xml': MimeType(
    compressible: true,
    extensions: ['kml'],
  ),
  'application/vnd.google-earth.kmz': MimeType(
    compressible: false,
    extensions: ['kmz'],
  ),
  'application/vnd.gov.sk.e-form+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.gov.sk.e-form+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.gov.sk.xmldatacontainer+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.grafeq': MimeType(
    extensions: ['gqf', 'gqs'],
  ),
  'application/vnd.groove-account': MimeType(
    extensions: ['gac'],
  ),
  'application/vnd.groove-help': MimeType(
    extensions: ['ghf'],
  ),
  'application/vnd.groove-identity-message': MimeType(
    extensions: ['gim'],
  ),
  'application/vnd.groove-injector': MimeType(
    extensions: ['grv'],
  ),
  'application/vnd.groove-tool-message': MimeType(
    extensions: ['gtm'],
  ),
  'application/vnd.groove-tool-template': MimeType(
    extensions: ['tpl'],
  ),
  'application/vnd.groove-vcard': MimeType(
    extensions: ['vcg'],
  ),
  'application/vnd.hal+json': MimeType(
    compressible: true,
  ),
  'application/vnd.hal+xml': MimeType(
    compressible: true,
    extensions: ['hal'],
  ),
  'application/vnd.handheld-entertainment+xml': MimeType(
    compressible: true,
    extensions: ['zmm'],
  ),
  'application/vnd.hbci': MimeType(
    extensions: ['hbci'],
  ),
  'application/vnd.hc+json': MimeType(
    compressible: true,
  ),
  'application/vnd.heroku+json': MimeType(
    compressible: true,
  ),
  'application/vnd.hhe.lesson-player': MimeType(
    extensions: ['les'],
  ),
  'application/vnd.hp-hpgl': MimeType(
    extensions: ['hpgl'],
  ),
  'application/vnd.hp-hpid': MimeType(
    extensions: ['hpid'],
  ),
  'application/vnd.hp-hps': MimeType(
    extensions: ['hps'],
  ),
  'application/vnd.hp-jlyt': MimeType(
    extensions: ['jlt'],
  ),
  'application/vnd.hp-pcl': MimeType(
    extensions: ['pcl'],
  ),
  'application/vnd.hp-pclxl': MimeType(
    extensions: ['pclxl'],
  ),
  'application/vnd.hydrostatix.sof-data': MimeType(
    extensions: ['sfd-hdstx'],
  ),
  'application/vnd.hyper+json': MimeType(
    compressible: true,
  ),
  'application/vnd.hyper-item+json': MimeType(
    compressible: true,
  ),
  'application/vnd.hyperdrive+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ibm.minipay': MimeType(
    extensions: ['mpy'],
  ),
  'application/vnd.ibm.modcap': MimeType(
    extensions: ['afp', 'listafp', 'list3820'],
  ),
  'application/vnd.ibm.rights-management': MimeType(
    extensions: ['irm'],
  ),
  'application/vnd.ibm.secure-container': MimeType(
    extensions: ['sc'],
  ),
  'application/vnd.iccprofile': MimeType(
    extensions: ['icc', 'icm'],
  ),
  'application/vnd.igloader': MimeType(
    extensions: ['igl'],
  ),
  'application/vnd.imagemeter.folder+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.imagemeter.image+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.immervision-ivp': MimeType(
    extensions: ['ivp'],
  ),
  'application/vnd.immervision-ivu': MimeType(
    extensions: ['ivu'],
  ),
  'application/vnd.ims.lis.v2.result+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ims.lti.v2.toolconsumerprofile+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ims.lti.v2.toolproxy+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ims.lti.v2.toolproxy.id+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ims.lti.v2.toolsettings+json': MimeType(
    compressible: true,
  ),
  'application/vnd.ims.lti.v2.toolsettings.simple+json': MimeType(
    compressible: true,
  ),
  'application/vnd.informedcontrol.rms+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.infotech.project+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.insors.igm': MimeType(
    extensions: ['igm'],
  ),
  'application/vnd.intercon.formnet': MimeType(
    extensions: ['xpw', 'xpx'],
  ),
  'application/vnd.intergeo': MimeType(
    extensions: ['i2g'],
  ),
  'application/vnd.intu.qbo': MimeType(
    extensions: ['qbo'],
  ),
  'application/vnd.intu.qfx': MimeType(
    extensions: ['qfx'],
  ),
  'application/vnd.iptc.g2.catalogitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.conceptitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.knowledgeitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.newsitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.newsmessage+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.packageitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.iptc.g2.planningitem+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ipunplugged.rcprofile': MimeType(
    extensions: ['rcprofile'],
  ),
  'application/vnd.irepository.package+xml': MimeType(
    compressible: true,
    extensions: ['irp'],
  ),
  'application/vnd.is-xpr': MimeType(
    extensions: ['xpr'],
  ),
  'application/vnd.isac.fcs': MimeType(
    extensions: ['fcs'],
  ),
  'application/vnd.iso11783-10+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.jam': MimeType(
    extensions: ['jam'],
  ),
  'application/vnd.jcp.javame.midlet-rms': MimeType(
    extensions: ['rms'],
  ),
  'application/vnd.jisp': MimeType(
    extensions: ['jisp'],
  ),
  'application/vnd.joost.joda-archive': MimeType(
    extensions: ['joda'],
  ),
  'application/vnd.kahootz': MimeType(
    extensions: ['ktz', 'ktr'],
  ),
  'application/vnd.kde.karbon': MimeType(
    extensions: ['karbon'],
  ),
  'application/vnd.kde.kchart': MimeType(
    extensions: ['chrt'],
  ),
  'application/vnd.kde.kformula': MimeType(
    extensions: ['kfo'],
  ),
  'application/vnd.kde.kivio': MimeType(
    extensions: ['flw'],
  ),
  'application/vnd.kde.kontour': MimeType(
    extensions: ['kon'],
  ),
  'application/vnd.kde.kpresenter': MimeType(
    extensions: ['kpr', 'kpt'],
  ),
  'application/vnd.kde.kspread': MimeType(
    extensions: ['ksp'],
  ),
  'application/vnd.kde.kword': MimeType(
    extensions: ['kwd', 'kwt'],
  ),
  'application/vnd.kenameaapp': MimeType(
    extensions: ['htke'],
  ),
  'application/vnd.kidspiration': MimeType(
    extensions: ['kia'],
  ),
  'application/vnd.kinar': MimeType(
    extensions: ['kne', 'knp'],
  ),
  'application/vnd.koan': MimeType(
    extensions: ['skp', 'skd', 'skt', 'skm'],
  ),
  'application/vnd.kodak-descriptor': MimeType(
    extensions: ['sse'],
  ),
  'application/vnd.las.las+json': MimeType(
    compressible: true,
  ),
  'application/vnd.las.las+xml': MimeType(
    compressible: true,
    extensions: ['lasxml'],
  ),
  'application/vnd.leap+json': MimeType(
    compressible: true,
  ),
  'application/vnd.liberty-request+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.llamagraphics.life-balance.desktop': MimeType(
    extensions: ['lbd'],
  ),
  'application/vnd.llamagraphics.life-balance.exchange+xml': MimeType(
    compressible: true,
    extensions: ['lbe'],
  ),
  'application/vnd.logipipe.circuit+zip': MimeType(
    compressible: false,
  ),
  'application/vnd.lotus-1-2-3': MimeType(
    extensions: ['123'],
  ),
  'application/vnd.lotus-approach': MimeType(
    extensions: ['apr'],
  ),
  'application/vnd.lotus-freelance': MimeType(
    extensions: ['pre'],
  ),
  'application/vnd.lotus-notes': MimeType(
    extensions: ['nsf'],
  ),
  'application/vnd.lotus-organizer': MimeType(
    extensions: ['org'],
  ),
  'application/vnd.lotus-screencam': MimeType(
    extensions: ['scm'],
  ),
  'application/vnd.lotus-wordpro': MimeType(
    extensions: ['lwp'],
  ),
  'application/vnd.macports.portpkg': MimeType(
    extensions: ['portpkg'],
  ),
  'application/vnd.marlin.drm.actiontoken+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.marlin.drm.conftoken+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.marlin.drm.license+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.mason+json': MimeType(
    compressible: true,
  ),
  'application/vnd.mcd': MimeType(
    extensions: ['mcd'],
  ),
  'application/vnd.medcalcdata': MimeType(
    extensions: ['mc1'],
  ),
  'application/vnd.mediastation.cdkey': MimeType(
    extensions: ['cdkey'],
  ),
  'application/vnd.mfer': MimeType(
    extensions: ['mwf'],
  ),
  'application/vnd.mfmp': MimeType(
    extensions: ['mfm'],
  ),
  'application/vnd.micro+json': MimeType(
    compressible: true,
  ),
  'application/vnd.micrografx.flo': MimeType(
    extensions: ['flo'],
  ),
  'application/vnd.micrografx.igx': MimeType(
    extensions: ['igx'],
  ),
  'application/vnd.miele+json': MimeType(
    compressible: true,
  ),
  'application/vnd.mif': MimeType(
    extensions: ['mif'],
  ),
  'application/vnd.mobius.daf': MimeType(
    extensions: ['daf'],
  ),
  'application/vnd.mobius.dis': MimeType(
    extensions: ['dis'],
  ),
  'application/vnd.mobius.mbk': MimeType(
    extensions: ['mbk'],
  ),
  'application/vnd.mobius.mqy': MimeType(
    extensions: ['mqy'],
  ),
  'application/vnd.mobius.msl': MimeType(
    extensions: ['msl'],
  ),
  'application/vnd.mobius.plc': MimeType(
    extensions: ['plc'],
  ),
  'application/vnd.mobius.txf': MimeType(
    extensions: ['txf'],
  ),
  'application/vnd.mophun.application': MimeType(
    extensions: ['mpn'],
  ),
  'application/vnd.mophun.certificate': MimeType(
    extensions: ['mpc'],
  ),
  'application/vnd.mozilla.xul+xml': MimeType(
    compressible: true,
    extensions: ['xul'],
  ),
  'application/vnd.ms-artgalry': MimeType(
    extensions: ['cil'],
  ),
  'application/vnd.ms-cab-compressed': MimeType(
    extensions: ['cab'],
  ),
  'application/vnd.ms-excel': MimeType(
    compressible: false,
    extensions: ['xls', 'xlm', 'xla', 'xlc', 'xlt', 'xlw'],
  ),
  'application/vnd.ms-excel.addin.macroenabled.12': MimeType(
    extensions: ['xlam'],
  ),
  'application/vnd.ms-excel.sheet.binary.macroenabled.12': MimeType(
    extensions: ['xlsb'],
  ),
  'application/vnd.ms-excel.sheet.macroenabled.12': MimeType(
    extensions: ['xlsm'],
  ),
  'application/vnd.ms-excel.template.macroenabled.12': MimeType(
    extensions: ['xltm'],
  ),
  'application/vnd.ms-fontobject': MimeType(
    compressible: true,
    extensions: ['eot'],
  ),
  'application/vnd.ms-htmlhelp': MimeType(
    extensions: ['chm'],
  ),
  'application/vnd.ms-ims': MimeType(
    extensions: ['ims'],
  ),
  'application/vnd.ms-lrm': MimeType(
    extensions: ['lrm'],
  ),
  'application/vnd.ms-office.activex+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-officetheme': MimeType(
    extensions: ['thmx'],
  ),
  'application/vnd.ms-opentype': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-outlook': MimeType(
    compressible: false,
    extensions: ['msg'],
  ),
  'application/vnd.ms-pki.seccat': MimeType(
    extensions: ['cat'],
  ),
  'application/vnd.ms-pki.stl': MimeType(
    extensions: ['stl'],
  ),
  'application/vnd.ms-playready.initiator+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-powerpoint': MimeType(
    compressible: false,
    extensions: ['ppt', 'pps', 'pot'],
  ),
  'application/vnd.ms-powerpoint.addin.macroenabled.12': MimeType(
    extensions: ['ppam'],
  ),
  'application/vnd.ms-powerpoint.presentation.macroenabled.12': MimeType(
    extensions: ['pptm'],
  ),
  'application/vnd.ms-powerpoint.slide.macroenabled.12': MimeType(
    extensions: ['sldm'],
  ),
  'application/vnd.ms-powerpoint.slideshow.macroenabled.12': MimeType(
    extensions: ['ppsm'],
  ),
  'application/vnd.ms-powerpoint.template.macroenabled.12': MimeType(
    extensions: ['potm'],
  ),
  'application/vnd.ms-printdevicecapabilities+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-printing.printticket+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-printschematicket+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.ms-project': MimeType(
    extensions: ['mpp', 'mpt'],
  ),
  'application/vnd.ms-word.document.macroenabled.12': MimeType(
    extensions: ['docm'],
  ),
  'application/vnd.ms-word.template.macroenabled.12': MimeType(
    extensions: ['dotm'],
  ),
  'application/vnd.ms-works': MimeType(
    extensions: ['wps', 'wks', 'wcm', 'wdb'],
  ),
  'application/vnd.ms-wpl': MimeType(
    extensions: ['wpl'],
  ),
  'application/vnd.ms-xpsdocument': MimeType(
    compressible: false,
    extensions: ['xps'],
  ),
  'application/vnd.mseq': MimeType(
    extensions: ['mseq'],
  ),
  'application/vnd.musician': MimeType(
    extensions: ['mus'],
  ),
  'application/vnd.muvee.style': MimeType(
    extensions: ['msty'],
  ),
  'application/vnd.mynfc': MimeType(
    extensions: ['taglet'],
  ),
  'application/vnd.nearst.inv+json': MimeType(
    compressible: true,
  ),
  'application/vnd.neurolanguage.nlu': MimeType(
    extensions: ['nlu'],
  ),
  'application/vnd.nitf': MimeType(
    extensions: ['ntf', 'nitf'],
  ),
  'application/vnd.noblenet-directory': MimeType(
    extensions: ['nnd'],
  ),
  'application/vnd.noblenet-sealer': MimeType(
    extensions: ['nns'],
  ),
  'application/vnd.noblenet-web': MimeType(
    extensions: ['nnw'],
  ),
  'application/vnd.nokia.conml+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.nokia.iptv.config+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.nokia.landmark+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.nokia.landmarkcollection+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.nokia.n-gage.ac+xml': MimeType(
    compressible: true,
    extensions: ['ac'],
  ),
  'application/vnd.nokia.n-gage.data': MimeType(
    extensions: ['ngdat'],
  ),
  'application/vnd.nokia.n-gage.symbian.install': MimeType(
    extensions: ['n-gage'],
  ),
  'application/vnd.nokia.pcd+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.nokia.radio-preset': MimeType(
    extensions: ['rpst'],
  ),
  'application/vnd.nokia.radio-presets': MimeType(
    extensions: ['rpss'],
  ),
  'application/vnd.novadigm.edm': MimeType(
    extensions: ['edm'],
  ),
  'application/vnd.novadigm.edx': MimeType(
    extensions: ['edx'],
  ),
  'application/vnd.novadigm.ext': MimeType(
    extensions: ['ext'],
  ),
  'application/vnd.oasis.opendocument.chart': MimeType(
    extensions: ['odc'],
  ),
  'application/vnd.oasis.opendocument.chart-template': MimeType(
    extensions: ['otc'],
  ),
  'application/vnd.oasis.opendocument.database': MimeType(
    extensions: ['odb'],
  ),
  'application/vnd.oasis.opendocument.formula': MimeType(
    extensions: ['odf'],
  ),
  'application/vnd.oasis.opendocument.formula-template': MimeType(
    extensions: ['odft'],
  ),
  'application/vnd.oasis.opendocument.graphics': MimeType(
    compressible: false,
    extensions: ['odg'],
  ),
  'application/vnd.oasis.opendocument.graphics-template': MimeType(
    extensions: ['otg'],
  ),
  'application/vnd.oasis.opendocument.image': MimeType(
    extensions: ['odi'],
  ),
  'application/vnd.oasis.opendocument.image-template': MimeType(
    extensions: ['oti'],
  ),
  'application/vnd.oasis.opendocument.presentation': MimeType(
    compressible: false,
    extensions: ['odp'],
  ),
  'application/vnd.oasis.opendocument.presentation-template': MimeType(
    extensions: ['otp'],
  ),
  'application/vnd.oasis.opendocument.spreadsheet': MimeType(
    compressible: false,
    extensions: ['ods'],
  ),
  'application/vnd.oasis.opendocument.spreadsheet-template': MimeType(
    extensions: ['ots'],
  ),
  'application/vnd.oasis.opendocument.text': MimeType(
    compressible: false,
    extensions: ['odt'],
  ),
  'application/vnd.oasis.opendocument.text-master': MimeType(
    extensions: ['odm'],
  ),
  'application/vnd.oasis.opendocument.text-template': MimeType(
    extensions: ['ott'],
  ),
  'application/vnd.oasis.opendocument.text-web': MimeType(
    extensions: ['oth'],
  ),
  'application/vnd.oftn.l10n+json': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.contentaccessdownload+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.contentaccessstreaming+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.dae.svg+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.dae.xhtml+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.mippvcontrolmessage+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.spdiscovery+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.spdlist+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.ueprofile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oipf.userprofile+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.olpc-sugar': MimeType(
    extensions: ['xo'],
  ),
  'application/vnd.oma.bcast.associated-procedure-parameter+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.drm-trigger+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.imd+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.notification+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.sgdd+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.smartcard-trigger+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.bcast.sprov+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.cab-address-book+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.cab-feature-handler+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.cab-pcc+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.cab-subs-invite+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.cab-user-prefs+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.dd2+xml': MimeType(
    compressible: true,
    extensions: ['dd2'],
  ),
  'application/vnd.oma.drm.risd+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.group-usage-list+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.lwm2m+json': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.pal+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.poc.detailed-progress-report+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.poc.final-report+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.poc.groups+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.poc.invocation-descriptor+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.poc.optimized-progress-report+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.scidm.messages+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oma.xcap-directory+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.omads-email+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.omads-file+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.omads-folder+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openblox.game+xml': MimeType(
    compressible: true,
    extensions: ['obgx'],
  ),
  'application/vnd.openofficeorg.extension': MimeType(
    extensions: ['oxt'],
  ),
  'application/vnd.openstreetmap.data+xml': MimeType(
    compressible: true,
    extensions: ['osm'],
  ),
  'application/vnd.openxmlformats-officedocument.custom-properties+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.customxmlproperties+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawing+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.chart+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.chartshapes+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.diagramcolors+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.diagramdata+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.diagramlayout+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.drawingml.diagramstyle+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.extended-properties+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.commentauthors+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.comments+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.handoutmaster+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.notesmaster+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.notesslide+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.presentation':
      MimeType(
    compressible: false,
    extensions: ['pptx'],
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.presprops+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slide':
      MimeType(
    extensions: ['sldx'],
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slide+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slidelayout+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slidemaster+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slideshow':
      MimeType(
    extensions: ['ppsx'],
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slideshow.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.slideupdateinfo+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.tablestyles+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.tags+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.template':
      MimeType(
    extensions: ['potx'],
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.template.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.presentationml.viewprops+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.calcchain+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.chartsheet+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.comments+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.connections+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.dialogsheet+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.externallink+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.pivotcachedefinition+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.pivotcacherecords+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.pivottable+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.querytable+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.revisionheaders+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.revisionlog+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sharedstrings+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet': MimeType(
    compressible: false,
    extensions: ['xlsx'],
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheetmetadata+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.table+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.tablesinglecells+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.template':
      MimeType(
    extensions: ['xltx'],
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.usernames+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.volatiledependencies+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.theme+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.themeoverride+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.comments+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
      MimeType(
    compressible: false,
    extensions: ['docx'],
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document.glossary+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.endnotes+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.fonttable+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.footnotes+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.template':
      MimeType(
    extensions: ['dotx'],
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.template.main+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-officedocument.wordprocessingml.websettings+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-package.core-properties+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-package.digital-signature-xmlsignature+xml':
      MimeType(
    compressible: true,
  ),
  'application/vnd.openxmlformats-package.relationships+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.oracle.resource+json': MimeType(
    compressible: true,
  ),
  'application/vnd.osgeo.mapguide.package': MimeType(
    extensions: ['mgp'],
  ),
  'application/vnd.osgi.dp': MimeType(
    extensions: ['dp'],
  ),
  'application/vnd.osgi.subsystem': MimeType(
    extensions: ['esa'],
  ),
  'application/vnd.otps.ct-kip+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.pagerduty+json': MimeType(
    compressible: true,
  ),
  'application/vnd.palm': MimeType(
    extensions: ['pdb', 'pqa', 'oprc'],
  ),
  'application/vnd.pawaafile': MimeType(
    extensions: ['paw'],
  ),
  'application/vnd.pg.format': MimeType(
    extensions: ['str'],
  ),
  'application/vnd.pg.osasli': MimeType(
    extensions: ['ei6'],
  ),
  'application/vnd.picsel': MimeType(
    extensions: ['efif'],
  ),
  'application/vnd.pmi.widget': MimeType(
    extensions: ['wg'],
  ),
  'application/vnd.poc.group-advertisement+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.pocketlearn': MimeType(
    extensions: ['plf'],
  ),
  'application/vnd.powerbuilder6': MimeType(
    extensions: ['pbd'],
  ),
  'application/vnd.previewsystems.box': MimeType(
    extensions: ['box'],
  ),
  'application/vnd.proteus.magazine': MimeType(
    extensions: ['mgz'],
  ),
  'application/vnd.publishare-delta-tree': MimeType(
    extensions: ['qps'],
  ),
  'application/vnd.pvi.ptid1': MimeType(
    extensions: ['ptid'],
  ),
  'application/vnd.pwg-xhtml-print+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.quark.quarkxpress': MimeType(
    extensions: ['qxd', 'qxt', 'qwd', 'qwt', 'qxl', 'qxb'],
  ),
  'application/vnd.radisys.moml+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-audit+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-audit-conf+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-audit-conn+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-audit-dialog+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-audit-stream+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-conf+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-base+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-fax-detect+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-fax-sendrecv+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-group+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-speech+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.radisys.msml-dialog-transform+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.realvnc.bed': MimeType(
    extensions: ['bed'],
  ),
  'application/vnd.recordare.musicxml': MimeType(
    extensions: ['mxl'],
  ),
  'application/vnd.recordare.musicxml+xml': MimeType(
    compressible: true,
    extensions: ['musicxml'],
  ),
  'application/vnd.restful+json': MimeType(
    compressible: true,
  ),
  'application/vnd.rig.cryptonote': MimeType(
    extensions: ['cryptonote'],
  ),
  'application/vnd.rim.cod': MimeType(
    extensions: ['cod'],
  ),
  'application/vnd.rn-realmedia': MimeType(
    extensions: ['rm'],
  ),
  'application/vnd.rn-realmedia-vbr': MimeType(
    extensions: ['rmvb'],
  ),
  'application/vnd.route66.link66+xml': MimeType(
    compressible: true,
    extensions: ['link66'],
  ),
  'application/vnd.sailingtracker.track': MimeType(
    extensions: ['st'],
  ),
  'application/vnd.seemail': MimeType(
    extensions: ['see'],
  ),
  'application/vnd.sema': MimeType(
    extensions: ['sema'],
  ),
  'application/vnd.semd': MimeType(
    extensions: ['semd'],
  ),
  'application/vnd.semf': MimeType(
    extensions: ['semf'],
  ),
  'application/vnd.shana.informed.formdata': MimeType(
    extensions: ['ifm'],
  ),
  'application/vnd.shana.informed.formtemplate': MimeType(
    extensions: ['itp'],
  ),
  'application/vnd.shana.informed.interchange': MimeType(
    extensions: ['iif'],
  ),
  'application/vnd.shana.informed.package': MimeType(
    extensions: ['ipk'],
  ),
  'application/vnd.shootproof+json': MimeType(
    compressible: true,
  ),
  'application/vnd.shopkick+json': MimeType(
    compressible: true,
  ),
  'application/vnd.simtech-mindmapper': MimeType(
    extensions: ['twd', 'twds'],
  ),
  'application/vnd.siren+json': MimeType(
    compressible: true,
  ),
  'application/vnd.smaf': MimeType(
    extensions: ['mmf'],
  ),
  'application/vnd.smart.teacher': MimeType(
    extensions: ['teacher'],
  ),
  'application/vnd.software602.filler.form+xml': MimeType(
    compressible: true,
    extensions: ['fo'],
  ),
  'application/vnd.solent.sdkm+xml': MimeType(
    compressible: true,
    extensions: ['sdkm', 'sdkd'],
  ),
  'application/vnd.spotfire.dxp': MimeType(
    extensions: ['dxp'],
  ),
  'application/vnd.spotfire.sfs': MimeType(
    extensions: ['sfs'],
  ),
  'application/vnd.stardivision.calc': MimeType(
    extensions: ['sdc'],
  ),
  'application/vnd.stardivision.draw': MimeType(
    extensions: ['sda'],
  ),
  'application/vnd.stardivision.impress': MimeType(
    extensions: ['sdd'],
  ),
  'application/vnd.stardivision.math': MimeType(
    extensions: ['smf'],
  ),
  'application/vnd.stardivision.writer': MimeType(
    extensions: ['sdw', 'vor'],
  ),
  'application/vnd.stardivision.writer-global': MimeType(
    extensions: ['sgl'],
  ),
  'application/vnd.stepmania.package': MimeType(
    extensions: ['smzip'],
  ),
  'application/vnd.stepmania.stepchart': MimeType(
    extensions: ['sm'],
  ),
  'application/vnd.sun.wadl+xml': MimeType(
    compressible: true,
    extensions: ['wadl'],
  ),
  'application/vnd.sun.xml.calc': MimeType(
    extensions: ['sxc'],
  ),
  'application/vnd.sun.xml.calc.template': MimeType(
    extensions: ['stc'],
  ),
  'application/vnd.sun.xml.draw': MimeType(
    extensions: ['sxd'],
  ),
  'application/vnd.sun.xml.draw.template': MimeType(
    extensions: ['std'],
  ),
  'application/vnd.sun.xml.impress': MimeType(
    extensions: ['sxi'],
  ),
  'application/vnd.sun.xml.impress.template': MimeType(
    extensions: ['sti'],
  ),
  'application/vnd.sun.xml.math': MimeType(
    extensions: ['sxm'],
  ),
  'application/vnd.sun.xml.writer': MimeType(
    extensions: ['sxw'],
  ),
  'application/vnd.sun.xml.writer.global': MimeType(
    extensions: ['sxg'],
  ),
  'application/vnd.sun.xml.writer.template': MimeType(
    extensions: ['stw'],
  ),
  'application/vnd.sus-calendar': MimeType(
    extensions: ['sus', 'susp'],
  ),
  'application/vnd.svd': MimeType(
    extensions: ['svd'],
  ),
  'application/vnd.symbian.install': MimeType(
    extensions: ['sis', 'sisx'],
  ),
  'application/vnd.syncml+xml': MimeType(
    compressible: true,
    extensions: ['xsm'],
  ),
  'application/vnd.syncml.dm+wbxml': MimeType(
    extensions: ['bdm'],
  ),
  'application/vnd.syncml.dm+xml': MimeType(
    compressible: true,
    extensions: ['xdm'],
  ),
  'application/vnd.syncml.dmddf+xml': MimeType(
    compressible: true,
    extensions: ['ddf'],
  ),
  'application/vnd.syncml.dmtnds+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.tableschema+json': MimeType(
    compressible: true,
  ),
  'application/vnd.tao.intent-module-archive': MimeType(
    extensions: ['tao'],
  ),
  'application/vnd.tcpdump.pcap': MimeType(
    extensions: ['pcap', 'cap', 'dmp'],
  ),
  'application/vnd.think-cell.ppttc+json': MimeType(
    compressible: true,
  ),
  'application/vnd.tmd.mediaflex.api+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.tmobile-livetv': MimeType(
    extensions: ['tmo'],
  ),
  'application/vnd.trid.tpt': MimeType(
    extensions: ['tpt'],
  ),
  'application/vnd.triscape.mxs': MimeType(
    extensions: ['mxs'],
  ),
  'application/vnd.trueapp': MimeType(
    extensions: ['tra'],
  ),
  'application/vnd.ufdl': MimeType(
    extensions: ['ufd', 'ufdl'],
  ),
  'application/vnd.uiq.theme': MimeType(
    extensions: ['utz'],
  ),
  'application/vnd.umajin': MimeType(
    extensions: ['umj'],
  ),
  'application/vnd.unity': MimeType(
    extensions: ['unityweb'],
  ),
  'application/vnd.uoml+xml': MimeType(
    compressible: true,
    extensions: ['uoml'],
  ),
  'application/vnd.vcx': MimeType(
    extensions: ['vcx'],
  ),
  'application/vnd.vel+json': MimeType(
    compressible: true,
  ),
  'application/vnd.visio': MimeType(
    extensions: ['vsd', 'vst', 'vss', 'vsw'],
  ),
  'application/vnd.visionary': MimeType(
    extensions: ['vis'],
  ),
  'application/vnd.vsf': MimeType(
    extensions: ['vsf'],
  ),
  'application/vnd.wap.wbxml': MimeType(
    extensions: ['wbxml'],
  ),
  'application/vnd.wap.wmlc': MimeType(
    extensions: ['wmlc'],
  ),
  'application/vnd.wap.wmlscriptc': MimeType(
    extensions: ['wmlsc'],
  ),
  'application/vnd.webturbo': MimeType(
    extensions: ['wtb'],
  ),
  'application/vnd.wolfram.player': MimeType(
    extensions: ['nbp'],
  ),
  'application/vnd.wordperfect': MimeType(
    extensions: ['wpd'],
  ),
  'application/vnd.wqd': MimeType(
    extensions: ['wqd'],
  ),
  'application/vnd.wt.stf': MimeType(
    extensions: ['stf'],
  ),
  'application/vnd.wv.csp+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.wv.ssp+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.xacml+json': MimeType(
    compressible: true,
  ),
  'application/vnd.xara': MimeType(
    extensions: ['xar'],
  ),
  'application/vnd.xfdl': MimeType(
    extensions: ['xfdl'],
  ),
  'application/vnd.xmi+xml': MimeType(
    compressible: true,
  ),
  'application/vnd.yamaha.hv-dic': MimeType(
    extensions: ['hvd'],
  ),
  'application/vnd.yamaha.hv-script': MimeType(
    extensions: ['hvs'],
  ),
  'application/vnd.yamaha.hv-voice': MimeType(
    extensions: ['hvp'],
  ),
  'application/vnd.yamaha.openscoreformat': MimeType(
    extensions: ['osf'],
  ),
  'application/vnd.yamaha.openscoreformat.osfpvg+xml': MimeType(
    compressible: true,
    extensions: ['osfpvg'],
  ),
  'application/vnd.yamaha.smaf-audio': MimeType(
    extensions: ['saf'],
  ),
  'application/vnd.yamaha.smaf-phrase': MimeType(
    extensions: ['spf'],
  ),
  'application/vnd.yellowriver-custom-menu': MimeType(
    extensions: ['cmp'],
  ),
  'application/vnd.zul': MimeType(
    extensions: ['zir', 'zirz'],
  ),
  'application/vnd.zzazz.deck+xml': MimeType(
    compressible: true,
    extensions: ['zaz'],
  ),
  'application/voicexml+xml': MimeType(
    compressible: true,
    extensions: ['vxml'],
  ),
  'application/voucher-cms+json': MimeType(
    compressible: true,
  ),
  'application/wasm': MimeType(
    compressible: true,
    extensions: ['wasm'],
  ),
  'application/watcherinfo+xml': MimeType(
    compressible: true,
  ),
  'application/webpush-options+json': MimeType(
    compressible: true,
  ),
  'application/widget': MimeType(
    extensions: ['wgt'],
  ),
  'application/winhlp': MimeType(
    extensions: ['hlp'],
  ),
  'application/wsdl+xml': MimeType(
    compressible: true,
    extensions: ['wsdl'],
  ),
  'application/wspolicy+xml': MimeType(
    compressible: true,
    extensions: ['wspolicy'],
  ),
  'application/x-7z-compressed': MimeType(
    compressible: false,
    extensions: ['7z'],
  ),
  'application/x-abiword': MimeType(
    extensions: ['abw'],
  ),
  'application/x-ace-compressed': MimeType(
    extensions: ['ace'],
  ),
  'application/x-apple-diskimage': MimeType(
    extensions: ['dmg'],
  ),
  'application/x-arj': MimeType(
    compressible: false,
    extensions: ['arj'],
  ),
  'application/x-authorware-bin': MimeType(
    extensions: ['aab', 'x32', 'u32', 'vox'],
  ),
  'application/x-authorware-map': MimeType(
    extensions: ['aam'],
  ),
  'application/x-authorware-seg': MimeType(
    extensions: ['aas'],
  ),
  'application/x-bcpio': MimeType(
    extensions: ['bcpio'],
  ),
  'application/x-bdoc': MimeType(
    compressible: false,
    extensions: ['bdoc'],
  ),
  'application/x-bittorrent': MimeType(
    extensions: ['torrent'],
  ),
  'application/x-blorb': MimeType(
    extensions: ['blb', 'blorb'],
  ),
  'application/x-bzip': MimeType(
    compressible: false,
    extensions: ['bz'],
  ),
  'application/x-bzip2': MimeType(
    compressible: false,
    extensions: ['bz2', 'boz'],
  ),
  'application/x-cbr': MimeType(
    extensions: ['cbr', 'cba', 'cbt', 'cbz', 'cb7'],
  ),
  'application/x-cdlink': MimeType(
    extensions: ['vcd'],
  ),
  'application/x-cfs-compressed': MimeType(
    extensions: ['cfs'],
  ),
  'application/x-chat': MimeType(
    extensions: ['chat'],
  ),
  'application/x-chess-pgn': MimeType(
    extensions: ['pgn'],
  ),
  'application/x-chrome-extension': MimeType(
    extensions: ['crx'],
  ),
  'application/x-cocoa': MimeType(
    extensions: ['cco'],
  ),
  'application/x-conference': MimeType(
    extensions: ['nsc'],
  ),
  'application/x-cpio': MimeType(
    extensions: ['cpio'],
  ),
  'application/x-csh': MimeType(
    extensions: ['csh'],
  ),
  'application/x-deb': MimeType(
    compressible: false,
  ),
  'application/x-debian-package': MimeType(
    extensions: ['deb', 'udeb'],
  ),
  'application/x-dgc-compressed': MimeType(
    extensions: ['dgc'],
  ),
  'application/x-director': MimeType(
    extensions: ['dir', 'dcr', 'dxr', 'cst', 'cct', 'cxt', 'w3d', 'fgd', 'swa'],
  ),
  'application/x-doom': MimeType(
    extensions: ['wad'],
  ),
  'application/x-dtbncx+xml': MimeType(
    compressible: true,
    extensions: ['ncx'],
  ),
  'application/x-dtbook+xml': MimeType(
    compressible: true,
    extensions: ['dtb'],
  ),
  'application/x-dtbresource+xml': MimeType(
    compressible: true,
    extensions: ['res'],
  ),
  'application/x-dvi': MimeType(
    compressible: false,
    extensions: ['dvi'],
  ),
  'application/x-envoy': MimeType(
    extensions: ['evy'],
  ),
  'application/x-eva': MimeType(
    extensions: ['eva'],
  ),
  'application/x-font-bdf': MimeType(
    extensions: ['bdf'],
  ),
  'application/x-font-ghostscript': MimeType(
    extensions: ['gsf'],
  ),
  'application/x-font-linux-psf': MimeType(
    extensions: ['psf'],
  ),
  'application/x-font-pcf': MimeType(
    extensions: ['pcf'],
  ),
  'application/x-font-snf': MimeType(
    extensions: ['snf'],
  ),
  'application/x-font-type1': MimeType(
    extensions: ['pfa', 'pfb', 'pfm', 'afm'],
  ),
  'application/x-freearc': MimeType(
    extensions: ['arc'],
  ),
  'application/x-futuresplash': MimeType(
    extensions: ['spl'],
  ),
  'application/x-gca-compressed': MimeType(
    extensions: ['gca'],
  ),
  'application/x-glulx': MimeType(
    extensions: ['ulx'],
  ),
  'application/x-gnumeric': MimeType(
    extensions: ['gnumeric'],
  ),
  'application/x-gramps-xml': MimeType(
    extensions: ['gramps'],
  ),
  'application/x-gtar': MimeType(
    extensions: ['gtar'],
  ),
  'application/x-hdf': MimeType(
    extensions: ['hdf'],
  ),
  'application/x-httpd-php': MimeType(
    compressible: true,
    extensions: ['php'],
  ),
  'application/x-install-instructions': MimeType(
    extensions: ['install'],
  ),
  'application/x-iso9660-image': MimeType(
    extensions: ['iso'],
  ),
  'application/x-java-archive-diff': MimeType(
    extensions: ['jardiff'],
  ),
  'application/x-java-jnlp-file': MimeType(
    compressible: false,
    extensions: ['jnlp'],
  ),
  'application/x-javascript': MimeType(
    compressible: true,
  ),
  'application/x-keepass2': MimeType(
    extensions: ['kdbx'],
  ),
  'application/x-latex': MimeType(
    compressible: false,
    extensions: ['latex'],
  ),
  'application/x-lua-bytecode': MimeType(
    extensions: ['luac'],
  ),
  'application/x-lzh-compressed': MimeType(
    extensions: ['lzh', 'lha'],
  ),
  'application/x-makeself': MimeType(
    extensions: ['run'],
  ),
  'application/x-mie': MimeType(
    extensions: ['mie'],
  ),
  'application/x-mobipocket-ebook': MimeType(
    extensions: ['prc', 'mobi'],
  ),
  'application/x-mpegurl': MimeType(
    compressible: false,
  ),
  'application/x-ms-application': MimeType(
    extensions: ['application'],
  ),
  'application/x-ms-shortcut': MimeType(
    extensions: ['lnk'],
  ),
  'application/x-ms-wmd': MimeType(
    extensions: ['wmd'],
  ),
  'application/x-ms-wmz': MimeType(
    extensions: ['wmz'],
  ),
  'application/x-ms-xbap': MimeType(
    extensions: ['xbap'],
  ),
  'application/x-msaccess': MimeType(
    extensions: ['mdb'],
  ),
  'application/x-msbinder': MimeType(
    extensions: ['obd'],
  ),
  'application/x-mscardfile': MimeType(
    extensions: ['crd'],
  ),
  'application/x-msclip': MimeType(
    extensions: ['clp'],
  ),
  'application/x-msdos-program': MimeType(
    extensions: ['exe'],
  ),
  'application/x-msdownload': MimeType(
    extensions: ['exe', 'dll', 'com', 'bat', 'msi'],
  ),
  'application/x-msmediaview': MimeType(
    extensions: ['mvb', 'm13', 'm14'],
  ),
  'application/x-msmetafile': MimeType(
    extensions: ['wmf', 'wmz', 'emf', 'emz'],
  ),
  'application/x-msmoney': MimeType(
    extensions: ['mny'],
  ),
  'application/x-mspublisher': MimeType(
    extensions: ['pub'],
  ),
  'application/x-msschedule': MimeType(
    extensions: ['scd'],
  ),
  'application/x-msterminal': MimeType(
    extensions: ['trm'],
  ),
  'application/x-mswrite': MimeType(
    extensions: ['wri'],
  ),
  'application/x-netcdf': MimeType(
    extensions: ['nc', 'cdf'],
  ),
  'application/x-ns-proxy-autoconfig': MimeType(
    compressible: true,
    extensions: ['pac'],
  ),
  'application/x-nzb': MimeType(
    extensions: ['nzb'],
  ),
  'application/x-perl': MimeType(
    extensions: ['pl', 'pm'],
  ),
  'application/x-pilot': MimeType(
    extensions: ['prc', 'pdb'],
  ),
  'application/x-pkcs12': MimeType(
    compressible: false,
    extensions: ['p12', 'pfx'],
  ),
  'application/x-pkcs7-certificates': MimeType(
    extensions: ['p7b', 'spc'],
  ),
  'application/x-pkcs7-certreqresp': MimeType(
    extensions: ['p7r'],
  ),
  'application/x-rar-compressed': MimeType(
    compressible: false,
    extensions: ['rar'],
  ),
  'application/x-redhat-package-manager': MimeType(
    extensions: ['rpm'],
  ),
  'application/x-research-info-systems': MimeType(
    extensions: ['ris'],
  ),
  'application/x-sea': MimeType(
    extensions: ['sea'],
  ),
  'application/x-sh': MimeType(
    compressible: true,
    extensions: ['sh'],
  ),
  'application/x-shar': MimeType(
    extensions: ['shar'],
  ),
  'application/x-shockwave-flash': MimeType(
    compressible: false,
    extensions: ['swf'],
  ),
  'application/x-silverlight-app': MimeType(
    extensions: ['xap'],
  ),
  'application/x-sql': MimeType(
    extensions: ['sql'],
  ),
  'application/x-stuffit': MimeType(
    compressible: false,
    extensions: ['sit'],
  ),
  'application/x-stuffitx': MimeType(
    extensions: ['sitx'],
  ),
  'application/x-subrip': MimeType(
    extensions: ['srt'],
  ),
  'application/x-sv4cpio': MimeType(
    extensions: ['sv4cpio'],
  ),
  'application/x-sv4crc': MimeType(
    extensions: ['sv4crc'],
  ),
  'application/x-t3vm-image': MimeType(
    extensions: ['t3'],
  ),
  'application/x-tads': MimeType(
    extensions: ['gam'],
  ),
  'application/x-tar': MimeType(
    compressible: true,
    extensions: ['tar'],
  ),
  'application/x-tcl': MimeType(
    extensions: ['tcl', 'tk'],
  ),
  'application/x-tex': MimeType(
    extensions: ['tex'],
  ),
  'application/x-tex-tfm': MimeType(
    extensions: ['tfm'],
  ),
  'application/x-texinfo': MimeType(
    extensions: ['texinfo', 'texi'],
  ),
  'application/x-tgif': MimeType(
    extensions: ['obj'],
  ),
  'application/x-ustar': MimeType(
    extensions: ['ustar'],
  ),
  'application/x-virtualbox-hdd': MimeType(
    compressible: true,
    extensions: ['hdd'],
  ),
  'application/x-virtualbox-ova': MimeType(
    compressible: true,
    extensions: ['ova'],
  ),
  'application/x-virtualbox-ovf': MimeType(
    compressible: true,
    extensions: ['ovf'],
  ),
  'application/x-virtualbox-vbox': MimeType(
    compressible: true,
    extensions: ['vbox'],
  ),
  'application/x-virtualbox-vbox-extpack': MimeType(
    compressible: false,
    extensions: ['vbox-extpack'],
  ),
  'application/x-virtualbox-vdi': MimeType(
    compressible: true,
    extensions: ['vdi'],
  ),
  'application/x-virtualbox-vhd': MimeType(
    compressible: true,
    extensions: ['vhd'],
  ),
  'application/x-virtualbox-vmdk': MimeType(
    compressible: true,
    extensions: ['vmdk'],
  ),
  'application/x-wais-source': MimeType(
    extensions: ['src'],
  ),
  'application/x-web-app-manifest+json': MimeType(
    compressible: true,
    extensions: ['webapp'],
  ),
  'application/x-www-form-urlencoded': MimeType(
    compressible: true,
  ),
  'application/x-x509-ca-cert': MimeType(
    extensions: ['der', 'crt', 'pem'],
  ),
  'application/x-xfig': MimeType(
    extensions: ['fig'],
  ),
  'application/x-xliff+xml': MimeType(
    compressible: true,
    extensions: ['xlf'],
  ),
  'application/x-xpinstall': MimeType(
    compressible: false,
    extensions: ['xpi'],
  ),
  'application/x-xz': MimeType(
    extensions: ['xz'],
  ),
  'application/x-zmachine': MimeType(
    extensions: ['z1', 'z2', 'z3', 'z4', 'z5', 'z6', 'z7', 'z8'],
  ),
  'application/xacml+xml': MimeType(
    compressible: true,
  ),
  'application/xaml+xml': MimeType(
    compressible: true,
    extensions: ['xaml'],
  ),
  'application/xcap-att+xml': MimeType(
    compressible: true,
    extensions: ['xav'],
  ),
  'application/xcap-caps+xml': MimeType(
    compressible: true,
    extensions: ['xca'],
  ),
  'application/xcap-diff+xml': MimeType(
    compressible: true,
    extensions: ['xdf'],
  ),
  'application/xcap-el+xml': MimeType(
    compressible: true,
    extensions: ['xel'],
  ),
  'application/xcap-error+xml': MimeType(
    compressible: true,
    extensions: ['xer'],
  ),
  'application/xcap-ns+xml': MimeType(
    compressible: true,
    extensions: ['xns'],
  ),
  'application/xcon-conference-info+xml': MimeType(
    compressible: true,
  ),
  'application/xcon-conference-info-diff+xml': MimeType(
    compressible: true,
  ),
  'application/xenc+xml': MimeType(
    compressible: true,
    extensions: ['xenc'],
  ),
  'application/xhtml+xml': MimeType(
    compressible: true,
    extensions: ['xhtml', 'xht'],
  ),
  'application/xhtml-voice+xml': MimeType(
    compressible: true,
  ),
  'application/xliff+xml': MimeType(
    compressible: true,
    extensions: ['xlf'],
  ),
  'application/xml': MimeType(
    compressible: true,
    extensions: ['xml', 'xsl', 'xsd', 'rng'],
  ),
  'application/xml-dtd': MimeType(
    compressible: true,
    extensions: ['dtd'],
  ),
  'application/xml-patch+xml': MimeType(
    compressible: true,
  ),
  'application/xmpp+xml': MimeType(
    compressible: true,
  ),
  'application/xop+xml': MimeType(
    compressible: true,
    extensions: ['xop'],
  ),
  'application/xproc+xml': MimeType(
    compressible: true,
    extensions: ['xpl'],
  ),
  'application/xslt+xml': MimeType(
    compressible: true,
    extensions: ['xslt'],
  ),
  'application/xspf+xml': MimeType(
    compressible: true,
    extensions: ['xspf'],
  ),
  'application/xv+xml': MimeType(
    compressible: true,
    extensions: ['mxml', 'xhvml', 'xvml', 'xvm'],
  ),
  'application/yang': MimeType(
    extensions: ['yang'],
  ),
  'application/yang-data+json': MimeType(
    compressible: true,
  ),
  'application/yang-data+xml': MimeType(
    compressible: true,
  ),
  'application/yang-patch+json': MimeType(
    compressible: true,
  ),
  'application/yang-patch+xml': MimeType(
    compressible: true,
  ),
  'application/yin+xml': MimeType(
    compressible: true,
    extensions: ['yin'],
  ),
  'application/zip': MimeType(
    compressible: false,
    extensions: ['zip'],
  ),
  'audio/3gpp': MimeType(
    compressible: false,
    extensions: ['3gpp'],
  ),
  'audio/adpcm': MimeType(
    extensions: ['adp'],
  ),
  'audio/basic': MimeType(
    compressible: false,
    extensions: ['au', 'snd'],
  ),
  'audio/l24': MimeType(
    compressible: false,
  ),
  'audio/midi': MimeType(
    extensions: ['mid', 'midi', 'kar', 'rmi'],
  ),
  'audio/mobile-xmf': MimeType(
    extensions: ['mxmf'],
  ),
  'audio/mp3': MimeType(
    compressible: false,
    extensions: ['mp3'],
  ),
  'audio/mp4': MimeType(
    compressible: false,
    extensions: ['m4a', 'mp4a'],
  ),
  'audio/mpeg': MimeType(
    compressible: false,
    extensions: ['mpga', 'mp2', 'mp2a', 'mp3', 'm2a', 'm3a'],
  ),
  'audio/ogg': MimeType(
    compressible: false,
    extensions: ['oga', 'ogg', 'spx'],
  ),
  'audio/s3m': MimeType(
    extensions: ['s3m'],
  ),
  'audio/silk': MimeType(
    extensions: ['sil'],
  ),
  'audio/vnd.dece.audio': MimeType(
    extensions: ['uva', 'uvva'],
  ),
  'audio/vnd.digital-winds': MimeType(
    extensions: ['eol'],
  ),
  'audio/vnd.dra': MimeType(
    extensions: ['dra'],
  ),
  'audio/vnd.dts': MimeType(
    extensions: ['dts'],
  ),
  'audio/vnd.dts.hd': MimeType(
    extensions: ['dtshd'],
  ),
  'audio/vnd.lucent.voice': MimeType(
    extensions: ['lvp'],
  ),
  'audio/vnd.ms-playready.media.pya': MimeType(
    extensions: ['pya'],
  ),
  'audio/vnd.nuera.ecelp4800': MimeType(
    extensions: ['ecelp4800'],
  ),
  'audio/vnd.nuera.ecelp7470': MimeType(
    extensions: ['ecelp7470'],
  ),
  'audio/vnd.nuera.ecelp9600': MimeType(
    extensions: ['ecelp9600'],
  ),
  'audio/vnd.rip': MimeType(
    extensions: ['rip'],
  ),
  'audio/vnd.rn-realaudio': MimeType(
    compressible: false,
  ),
  'audio/vnd.wave': MimeType(
    compressible: false,
  ),
  'audio/vorbis': MimeType(
    compressible: false,
  ),
  'audio/wav': MimeType(
    compressible: false,
    extensions: ['wav'],
  ),
  'audio/wave': MimeType(
    compressible: false,
    extensions: ['wav'],
  ),
  'audio/webm': MimeType(
    compressible: false,
    extensions: ['weba'],
  ),
  'audio/x-aac': MimeType(
    compressible: false,
    extensions: ['aac'],
  ),
  'audio/x-aiff': MimeType(
    extensions: ['aif', 'aiff', 'aifc'],
  ),
  'audio/x-caf': MimeType(
    compressible: false,
    extensions: ['caf'],
  ),
  'audio/x-flac': MimeType(
    extensions: ['flac'],
  ),
  'audio/x-m4a': MimeType(
    extensions: ['m4a'],
  ),
  'audio/x-matroska': MimeType(
    extensions: ['mka'],
  ),
  'audio/x-mpegurl': MimeType(
    extensions: ['m3u'],
  ),
  'audio/x-ms-wax': MimeType(
    extensions: ['wax'],
  ),
  'audio/x-ms-wma': MimeType(
    extensions: ['wma'],
  ),
  'audio/x-pn-realaudio': MimeType(
    extensions: ['ram', 'ra'],
  ),
  'audio/x-pn-realaudio-plugin': MimeType(
    extensions: ['rmp'],
  ),
  'audio/x-realaudio': MimeType(
    extensions: ['ra'],
  ),
  'audio/x-wav': MimeType(
    extensions: ['wav'],
  ),
  'audio/xm': MimeType(
    extensions: ['xm'],
  ),
  'chemical/x-cdx': MimeType(
    extensions: ['cdx'],
  ),
  'chemical/x-cif': MimeType(
    extensions: ['cif'],
  ),
  'chemical/x-cmdf': MimeType(
    extensions: ['cmdf'],
  ),
  'chemical/x-cml': MimeType(
    extensions: ['cml'],
  ),
  'chemical/x-csml': MimeType(
    extensions: ['csml'],
  ),
  'chemical/x-xyz': MimeType(
    extensions: ['xyz'],
  ),
  'font/collection': MimeType(
    extensions: ['ttc'],
  ),
  'font/otf': MimeType(
    compressible: true,
    extensions: ['otf'],
  ),
  'font/ttf': MimeType(
    compressible: true,
    extensions: ['ttf'],
  ),
  'font/woff': MimeType(
    extensions: ['woff'],
  ),
  'font/woff2': MimeType(
    extensions: ['woff2'],
  ),
  'image/aces': MimeType(
    extensions: ['exr'],
  ),
  'image/apng': MimeType(
    compressible: false,
    extensions: ['apng'],
  ),
  'image/bmp': MimeType(
    compressible: true,
    extensions: ['bmp'],
  ),
  'image/cgm': MimeType(
    extensions: ['cgm'],
  ),
  'image/dicom-rle': MimeType(
    extensions: ['drle'],
  ),
  'image/emf': MimeType(
    extensions: ['emf'],
  ),
  'image/fits': MimeType(
    extensions: ['fits'],
  ),
  'image/g3fax': MimeType(
    extensions: ['g3'],
  ),
  'image/gif': MimeType(
    compressible: false,
    extensions: ['gif'],
  ),
  'image/heic': MimeType(
    extensions: ['heic'],
  ),
  'image/heic-sequence': MimeType(
    extensions: ['heics'],
  ),
  'image/heif': MimeType(
    extensions: ['heif'],
  ),
  'image/heif-sequence': MimeType(
    extensions: ['heifs'],
  ),
  'image/hej2k': MimeType(
    extensions: ['hej2'],
  ),
  'image/hsj2': MimeType(
    extensions: ['hsj2'],
  ),
  'image/ief': MimeType(
    extensions: ['ief'],
  ),
  'image/jls': MimeType(
    extensions: ['jls'],
  ),
  'image/jp2': MimeType(
    compressible: false,
    extensions: ['jp2', 'jpg2'],
  ),
  'image/jpeg': MimeType(
    compressible: false,
    extensions: ['jpeg', 'jpg', 'jpe'],
  ),
  'image/jph': MimeType(
    extensions: ['jph'],
  ),
  'image/jphc': MimeType(
    extensions: ['jhc'],
  ),
  'image/jpm': MimeType(
    compressible: false,
    extensions: ['jpm'],
  ),
  'image/jpx': MimeType(
    compressible: false,
    extensions: ['jpx', 'jpf'],
  ),
  'image/jxr': MimeType(
    extensions: ['jxr'],
  ),
  'image/jxra': MimeType(
    extensions: ['jxra'],
  ),
  'image/jxrs': MimeType(
    extensions: ['jxrs'],
  ),
  'image/jxs': MimeType(
    extensions: ['jxs'],
  ),
  'image/jxsc': MimeType(
    extensions: ['jxsc'],
  ),
  'image/jxsi': MimeType(
    extensions: ['jxsi'],
  ),
  'image/jxss': MimeType(
    extensions: ['jxss'],
  ),
  'image/ktx': MimeType(
    extensions: ['ktx'],
  ),
  'image/pjpeg': MimeType(
    compressible: false,
  ),
  'image/png': MimeType(
    compressible: false,
    extensions: ['png'],
  ),
  'image/prs.btif': MimeType(
    extensions: ['btif'],
  ),
  'image/prs.pti': MimeType(
    extensions: ['pti'],
  ),
  'image/sgi': MimeType(
    extensions: ['sgi'],
  ),
  'image/svg+xml': MimeType(
    compressible: true,
    extensions: ['svg', 'svgz'],
  ),
  'image/t38': MimeType(
    extensions: ['t38'],
  ),
  'image/tiff': MimeType(
    compressible: false,
    extensions: ['tif', 'tiff'],
  ),
  'image/tiff-fx': MimeType(
    extensions: ['tfx'],
  ),
  'image/vnd.adobe.photoshop': MimeType(
    compressible: true,
    extensions: ['psd'],
  ),
  'image/vnd.airzip.accelerator.azv': MimeType(
    extensions: ['azv'],
  ),
  'image/vnd.dece.graphic': MimeType(
    extensions: ['uvi', 'uvvi', 'uvg', 'uvvg'],
  ),
  'image/vnd.djvu': MimeType(
    extensions: ['djvu', 'djv'],
  ),
  'image/vnd.dvb.subtitle': MimeType(
    extensions: ['sub'],
  ),
  'image/vnd.dwg': MimeType(
    extensions: ['dwg'],
  ),
  'image/vnd.dxf': MimeType(
    extensions: ['dxf'],
  ),
  'image/vnd.fastbidsheet': MimeType(
    extensions: ['fbs'],
  ),
  'image/vnd.fpx': MimeType(
    extensions: ['fpx'],
  ),
  'image/vnd.fst': MimeType(
    extensions: ['fst'],
  ),
  'image/vnd.fujixerox.edmics-mmr': MimeType(
    extensions: ['mmr'],
  ),
  'image/vnd.fujixerox.edmics-rlc': MimeType(
    extensions: ['rlc'],
  ),
  'image/vnd.microsoft.icon': MimeType(
    extensions: ['ico'],
  ),
  'image/vnd.ms-dds': MimeType(
    extensions: ['dds'],
  ),
  'image/vnd.ms-modi': MimeType(
    extensions: ['mdi'],
  ),
  'image/vnd.ms-photo': MimeType(
    extensions: ['wdp'],
  ),
  'image/vnd.net-fpx': MimeType(
    extensions: ['npx'],
  ),
  'image/vnd.tencent.tap': MimeType(
    extensions: ['tap'],
  ),
  'image/vnd.valve.source.texture': MimeType(
    extensions: ['vtf'],
  ),
  'image/vnd.wap.wbmp': MimeType(
    extensions: ['wbmp'],
  ),
  'image/vnd.xiff': MimeType(
    extensions: ['xif'],
  ),
  'image/vnd.zbrush.pcx': MimeType(
    extensions: ['pcx'],
  ),
  'image/webp': MimeType(
    extensions: ['webp'],
  ),
  'image/wmf': MimeType(
    extensions: ['wmf'],
  ),
  'image/x-3ds': MimeType(
    extensions: ['3ds'],
  ),
  'image/x-cmu-raster': MimeType(
    extensions: ['ras'],
  ),
  'image/x-cmx': MimeType(
    extensions: ['cmx'],
  ),
  'image/x-freehand': MimeType(
    extensions: ['fh', 'fhc', 'fh4', 'fh5', 'fh7'],
  ),
  'image/x-icon': MimeType(
    compressible: true,
    extensions: ['ico'],
  ),
  'image/x-jng': MimeType(
    extensions: ['jng'],
  ),
  'image/x-mrsid-image': MimeType(
    extensions: ['sid'],
  ),
  'image/x-ms-bmp': MimeType(
    compressible: true,
    extensions: ['bmp'],
  ),
  'image/x-pcx': MimeType(
    extensions: ['pcx'],
  ),
  'image/x-pict': MimeType(
    extensions: ['pic', 'pct'],
  ),
  'image/x-portable-anymap': MimeType(
    extensions: ['pnm'],
  ),
  'image/x-portable-bitmap': MimeType(
    extensions: ['pbm'],
  ),
  'image/x-portable-graymap': MimeType(
    extensions: ['pgm'],
  ),
  'image/x-portable-pixmap': MimeType(
    extensions: ['ppm'],
  ),
  'image/x-rgb': MimeType(
    extensions: ['rgb'],
  ),
  'image/x-tga': MimeType(
    extensions: ['tga'],
  ),
  'image/x-xbitmap': MimeType(
    extensions: ['xbm'],
  ),
  'image/x-xcf': MimeType(
    compressible: false,
  ),
  'image/x-xpixmap': MimeType(
    extensions: ['xpm'],
  ),
  'image/x-xwindowdump': MimeType(
    extensions: ['xwd'],
  ),
  'message/disposition-notification': MimeType(
    extensions: ['disposition-notification'],
  ),
  'message/global': MimeType(
    extensions: ['u8msg'],
  ),
  'message/global-delivery-status': MimeType(
    extensions: ['u8dsn'],
  ),
  'message/global-disposition-notification': MimeType(
    extensions: ['u8mdn'],
  ),
  'message/global-headers': MimeType(
    extensions: ['u8hdr'],
  ),
  'message/http': MimeType(
    compressible: false,
  ),
  'message/imdn+xml': MimeType(
    compressible: true,
  ),
  'message/partial': MimeType(
    compressible: false,
  ),
  'message/rfc822': MimeType(
    compressible: true,
    extensions: ['eml', 'mime'],
  ),
  'message/vnd.wfa.wsc': MimeType(
    extensions: ['wsc'],
  ),
  'model/3mf': MimeType(
    extensions: ['3mf'],
  ),
  'model/gltf+json': MimeType(
    compressible: true,
    extensions: ['gltf'],
  ),
  'model/gltf-binary': MimeType(
    compressible: true,
    extensions: ['glb'],
  ),
  'model/iges': MimeType(
    compressible: false,
    extensions: ['igs', 'iges'],
  ),
  'model/mesh': MimeType(
    compressible: false,
    extensions: ['msh', 'mesh', 'silo'],
  ),
  'model/mtl': MimeType(
    extensions: ['mtl'],
  ),
  'model/obj': MimeType(
    extensions: ['obj'],
  ),
  'model/stl': MimeType(
    extensions: ['stl'],
  ),
  'model/vnd.collada+xml': MimeType(
    compressible: true,
    extensions: ['dae'],
  ),
  'model/vnd.dwf': MimeType(
    extensions: ['dwf'],
  ),
  'model/vnd.gdl': MimeType(
    extensions: ['gdl'],
  ),
  'model/vnd.gtw': MimeType(
    extensions: ['gtw'],
  ),
  'model/vnd.moml+xml': MimeType(
    compressible: true,
  ),
  'model/vnd.mts': MimeType(
    extensions: ['mts'],
  ),
  'model/vnd.opengex': MimeType(
    extensions: ['ogex'],
  ),
  'model/vnd.parasolid.transmit.binary': MimeType(
    extensions: ['x_b'],
  ),
  'model/vnd.parasolid.transmit.text': MimeType(
    extensions: ['x_t'],
  ),
  'model/vnd.usdz+zip': MimeType(
    compressible: false,
    extensions: ['usdz'],
  ),
  'model/vnd.valve.source.compiled-map': MimeType(
    extensions: ['bsp'],
  ),
  'model/vnd.vtu': MimeType(
    extensions: ['vtu'],
  ),
  'model/vrml': MimeType(
    compressible: false,
    extensions: ['wrl', 'vrml'],
  ),
  'model/x3d+binary': MimeType(
    compressible: false,
    extensions: ['x3db', 'x3dbz'],
  ),
  'model/x3d+fastinfoset': MimeType(
    extensions: ['x3db'],
  ),
  'model/x3d+vrml': MimeType(
    compressible: false,
    extensions: ['x3dv', 'x3dvz'],
  ),
  'model/x3d+xml': MimeType(
    compressible: true,
    extensions: ['x3d', 'x3dz'],
  ),
  'model/x3d-vrml': MimeType(
    extensions: ['x3dv'],
  ),
  'multipart/alternative': MimeType(
    compressible: false,
  ),
  'multipart/encrypted': MimeType(
    compressible: false,
  ),
  'multipart/form-data': MimeType(
    compressible: false,
  ),
  'multipart/related': MimeType(
    compressible: false,
  ),
  'multipart/signed': MimeType(
    compressible: false,
  ),
  'multipart/byteranges': MimeType(
    compressible: false,
  ),
  'text/cache-manifest': MimeType(
    compressible: true,
    extensions: ['appcache', 'manifest'],
  ),
  'text/calendar': MimeType(
    extensions: ['ics', 'ifb'],
  ),
  'text/calender': MimeType(
    compressible: true,
  ),
  'text/cmd': MimeType(
    compressible: true,
  ),
  'text/coffeescript': MimeType(
    extensions: ['coffee', 'litcoffee'],
  ),
  'text/css': MimeType(
    charset: 'UTF-8',
    compressible: true,
    extensions: ['css'],
  ),
  'text/csv': MimeType(
    compressible: true,
    extensions: ['csv'],
  ),
  'text/html': MimeType(
    compressible: true,
    extensions: ['html', 'htm', 'shtml'],
  ),
  'text/jade': MimeType(
    extensions: ['jade'],
  ),
  'text/javascript': MimeType(
    compressible: true,
  ),
  'text/jsx': MimeType(
    compressible: true,
    extensions: ['jsx'],
  ),
  'text/less': MimeType(
    compressible: true,
    extensions: ['less'],
  ),
  'text/markdown': MimeType(
    compressible: true,
    extensions: ['markdown', 'md'],
  ),
  'text/mathml': MimeType(
    extensions: ['mml'],
  ),
  'text/mdx': MimeType(
    compressible: true,
    extensions: ['mdx'],
  ),
  'text/n3': MimeType(
    compressible: true,
    extensions: ['n3'],
  ),
  'text/plain': MimeType(
    compressible: true,
    extensions: ['txt', 'text', 'conf', 'def', 'list', 'log', 'in', 'ini'],
  ),
  'text/prs.lines.tag': MimeType(
    extensions: ['dsc'],
  ),
  'text/richtext': MimeType(
    compressible: true,
    extensions: ['rtx'],
  ),
  'text/rtf': MimeType(
    compressible: true,
    extensions: ['rtf'],
  ),
  'text/sgml': MimeType(
    extensions: ['sgml', 'sgm'],
  ),
  'text/shex': MimeType(
    extensions: ['shex'],
  ),
  'text/slim': MimeType(
    extensions: ['slim', 'slm'],
  ),
  'text/stylus': MimeType(
    extensions: ['stylus', 'styl'],
  ),
  'text/tab-separated-values': MimeType(
    compressible: true,
    extensions: ['tsv'],
  ),
  'text/troff': MimeType(
    extensions: ['t', 'tr', 'roff', 'man', 'me', 'ms'],
  ),
  'text/turtle': MimeType(
    charset: 'UTF-8',
    extensions: ['ttl'],
  ),
  'text/uri-list': MimeType(
    compressible: true,
    extensions: ['uri', 'uris', 'urls'],
  ),
  'text/vcard': MimeType(
    compressible: true,
    extensions: ['vcard'],
  ),
  'text/vnd.curl': MimeType(
    extensions: ['curl'],
  ),
  'text/vnd.curl.dcurl': MimeType(
    extensions: ['dcurl'],
  ),
  'text/vnd.curl.mcurl': MimeType(
    extensions: ['mcurl'],
  ),
  'text/vnd.curl.scurl': MimeType(
    extensions: ['scurl'],
  ),
  'text/vnd.dvb.subtitle': MimeType(
    extensions: ['sub'],
  ),
  'text/vnd.fly': MimeType(
    extensions: ['fly'],
  ),
  'text/vnd.fmi.flexstor': MimeType(
    extensions: ['flx'],
  ),
  'text/vnd.graphviz': MimeType(
    extensions: ['gv'],
  ),
  'text/vnd.in3d.3dml': MimeType(
    extensions: ['3dml'],
  ),
  'text/vnd.in3d.spot': MimeType(
    extensions: ['spot'],
  ),
  'text/vnd.sun.j2me.app-descriptor': MimeType(
    extensions: ['jad'],
  ),
  'text/vnd.wap.wml': MimeType(
    extensions: ['wml'],
  ),
  'text/vnd.wap.wmlscript': MimeType(
    extensions: ['wmls'],
  ),
  'text/vtt': MimeType(
    charset: 'UTF-8',
    compressible: true,
    extensions: ['vtt'],
  ),
  'text/x-asm': MimeType(
    extensions: ['s', 'asm'],
  ),
  'text/x-c': MimeType(
    extensions: ['c', 'cc', 'cxx', 'cpp', 'h', 'hh', 'dic'],
  ),
  'text/x-component': MimeType(
    extensions: ['htc'],
  ),
  'text/x-fortran': MimeType(
    extensions: ['f', 'for', 'f77', 'f90'],
  ),
  'text/x-gwt-rpc': MimeType(
    compressible: true,
  ),
  'text/x-handlebars-template': MimeType(
    extensions: ['hbs'],
  ),
  'text/x-java-source': MimeType(
    extensions: ['java'],
  ),
  'text/x-jquery-tmpl': MimeType(
    compressible: true,
  ),
  'text/x-lua': MimeType(
    extensions: ['lua'],
  ),
  'text/x-markdown': MimeType(
    compressible: true,
    extensions: ['mkd'],
  ),
  'text/x-nfo': MimeType(
    extensions: ['nfo'],
  ),
  'text/x-opml': MimeType(
    extensions: ['opml'],
  ),
  'text/x-org': MimeType(
    compressible: true,
    extensions: ['org'],
  ),
  'text/x-pascal': MimeType(
    extensions: ['p', 'pas'],
  ),
  'text/x-processing': MimeType(
    compressible: true,
    extensions: ['pde'],
  ),
  'text/x-sass': MimeType(
    extensions: ['sass'],
  ),
  'text/x-scss': MimeType(
    extensions: ['scss'],
  ),
  'text/x-setext': MimeType(
    extensions: ['etx'],
  ),
  'text/x-sfv': MimeType(
    extensions: ['sfv'],
  ),
  'text/x-suse-ymp': MimeType(
    compressible: true,
    extensions: ['ymp'],
  ),
  'text/x-uuencode': MimeType(
    extensions: ['uu'],
  ),
  'text/x-vcalendar': MimeType(
    extensions: ['vcs'],
  ),
  'text/x-vcard': MimeType(
    extensions: ['vcf'],
  ),
  'text/xml': MimeType(
    compressible: true,
    extensions: ['xml'],
  ),
  'text/yaml': MimeType(
    extensions: ['yaml', 'yml'],
  ),
  'video/3gpp': MimeType(
    extensions: ['3gp', '3gpp'],
  ),
  'video/3gpp2': MimeType(
    extensions: ['3g2'],
  ),
  'video/h261': MimeType(
    extensions: ['h261'],
  ),
  'video/h263': MimeType(
    extensions: ['h263'],
  ),
  'video/h264': MimeType(
    extensions: ['h264'],
  ),
  'video/jpeg': MimeType(
    extensions: ['jpgv'],
  ),
  'video/jpm': MimeType(
    extensions: ['jpm', 'jpgm'],
  ),
  'video/mj2': MimeType(
    extensions: ['mj2', 'mjp2'],
  ),
  'video/mp2t': MimeType(
    extensions: ['ts'],
  ),
  'video/mp4': MimeType(
    compressible: false,
    extensions: ['mp4', 'mp4v', 'mpg4'],
  ),
  'video/mpeg': MimeType(
    compressible: false,
    extensions: ['mpeg', 'mpg', 'mpe', 'm1v', 'm2v'],
  ),
  'video/ogg': MimeType(
    compressible: false,
    extensions: ['ogv'],
  ),
  'video/quicktime': MimeType(
    compressible: false,
    extensions: ['qt', 'mov'],
  ),
  'video/vnd.dece.hd': MimeType(
    extensions: ['uvh', 'uvvh'],
  ),
  'video/vnd.dece.mobile': MimeType(
    extensions: ['uvm', 'uvvm'],
  ),
  'video/vnd.dece.pd': MimeType(
    extensions: ['uvp', 'uvvp'],
  ),
  'video/vnd.dece.sd': MimeType(
    extensions: ['uvs', 'uvvs'],
  ),
  'video/vnd.dece.video': MimeType(
    extensions: ['uvv', 'uvvv'],
  ),
  'video/vnd.dvb.file': MimeType(
    extensions: ['dvb'],
  ),
  'video/vnd.fvt': MimeType(
    extensions: ['fvt'],
  ),
  'video/vnd.mpegurl': MimeType(
    extensions: ['mxu', 'm4u'],
  ),
  'video/vnd.ms-playready.media.pyv': MimeType(
    extensions: ['pyv'],
  ),
  'video/vnd.uvvu.mp4': MimeType(
    extensions: ['uvu', 'uvvu'],
  ),
  'video/vnd.vivo': MimeType(
    extensions: ['viv'],
  ),
  'video/webm': MimeType(
    compressible: false,
    extensions: ['webm'],
  ),
  'video/x-f4v': MimeType(
    extensions: ['f4v'],
  ),
  'video/x-fli': MimeType(
    extensions: ['fli'],
  ),
  'video/x-flv': MimeType(
    compressible: false,
    extensions: ['flv'],
  ),
  'video/x-m4v': MimeType(
    extensions: ['m4v'],
  ),
  'video/x-matroska': MimeType(
    compressible: false,
    extensions: ['mkv', 'mk3d', 'mks'],
  ),
  'video/x-mng': MimeType(
    extensions: ['mng'],
  ),
  'video/x-ms-asf': MimeType(
    extensions: ['asf', 'asx'],
  ),
  'video/x-ms-vob': MimeType(
    extensions: ['vob'],
  ),
  'video/x-ms-wm': MimeType(
    extensions: ['wm'],
  ),
  'video/x-ms-wmv': MimeType(
    compressible: false,
    extensions: ['wmv'],
  ),
  'video/x-ms-wmx': MimeType(
    extensions: ['wmx'],
  ),
  'video/x-ms-wvx': MimeType(
    extensions: ['wvx'],
  ),
  'video/x-msvideo': MimeType(
    extensions: ['avi'],
  ),
  'video/x-sgi-movie': MimeType(
    extensions: ['movie'],
  ),
  'video/x-smv': MimeType(
    extensions: ['smv'],
  ),
  'x-conference/x-cooltalk': MimeType(
    extensions: ['ice'],
  ),
  'x-shader/x-fragment': MimeType(
    compressible: true,
  ),
  'x-shader/x-vertex': MimeType(
    compressible: true,
  ),
};
final kContentTypeByExtension = <String, String>{
  'ez': 'application/andrew-inset',
  'aw': 'application/applixware',
  'atom': 'application/atom+xml',
  'atomcat': 'application/atomcat+xml',
  'atomdeleted': 'application/atomdeleted+xml',
  'atomsvc': 'application/atomsvc+xml',
  'dwd': 'application/atsc-dwd+xml',
  'held': 'application/atsc-held+xml',
  'rsat': 'application/atsc-rsat+xml',
  'bdoc': 'application/bdoc',
  'xcs': 'application/calendar+xml',
  'ccxml': 'application/ccxml+xml',
  'cdfx': 'application/cdfx+xml',
  'cdmia': 'application/cdmi-capability',
  'cdmic': 'application/cdmi-container',
  'cdmid': 'application/cdmi-domain',
  'cdmio': 'application/cdmi-object',
  'cdmiq': 'application/cdmi-queue',
  'cu': 'application/cu-seeme',
  'mpd': 'application/dash+xml',
  'davmount': 'application/davmount+xml',
  'dbk': 'application/docbook+xml',
  'dssc': 'application/dssc+der',
  'xdssc': 'application/dssc+xml',
  'ecma': 'application/ecmascript',
  'es': 'application/ecmascript',
  'emma': 'application/emma+xml',
  'emotionml': 'application/emotionml+xml',
  'epub': 'application/epub+zip',
  'exi': 'application/exi',
  'fdt': 'application/fdt+xml',
  'pfr': 'application/font-tdpfr',
  'geojson': 'application/geo+json',
  'gml': 'application/gml+xml',
  'gpx': 'application/gpx+xml',
  'gxf': 'application/gxf',
  'gz': 'application/gzip',
  'hjson': 'application/hjson',
  'stk': 'application/hyperstudio',
  'ink': 'application/inkml+xml',
  'inkml': 'application/inkml+xml',
  'ipfix': 'application/ipfix',
  'its': 'application/its+xml',
  'jar': 'application/java-archive',
  'war': 'application/java-archive',
  'ear': 'application/java-archive',
  'ser': 'application/java-serialized-object',
  'class': 'application/java-vm',
  'js': 'application/javascript',
  'mjs': 'application/javascript',
  'json': 'application/json',
  'map': 'application/json',
  'json5': 'application/json5',
  'jsonml': 'application/jsonml+json',
  'jsonld': 'application/ld+json',
  'lgr': 'application/lgr+xml',
  'lostxml': 'application/lost+xml',
  'hqx': 'application/mac-binhex40',
  'cpt': 'application/mac-compactpro',
  'mads': 'application/mads+xml',
  'webmanifest': 'application/manifest+json',
  'mrc': 'application/marc',
  'mrcx': 'application/marcxml+xml',
  'ma': 'application/mathematica',
  'nb': 'application/mathematica',
  'mb': 'application/mathematica',
  'mathml': 'application/mathml+xml',
  'mbox': 'application/mbox',
  'mscml': 'application/mediaservercontrol+xml',
  'metalink': 'application/metalink+xml',
  'meta4': 'application/metalink4+xml',
  'mets': 'application/mets+xml',
  'maei': 'application/mmt-aei+xml',
  'musd': 'application/mmt-usd+xml',
  'mods': 'application/mods+xml',
  'm21': 'application/mp21',
  'mp21': 'application/mp21',
  'mp4s': 'application/mp4',
  'm4p': 'application/mp4',
  'xdf': 'application/mrb-consumer+xml',
  'doc': 'application/msword',
  'dot': 'application/msword',
  'mxf': 'application/mxf',
  'nq': 'application/n-quads',
  'nt': 'application/n-triples',
  'bin': 'application/octet-stream',
  'dms': 'application/octet-stream',
  'lrf': 'application/octet-stream',
  'mar': 'application/octet-stream',
  'so': 'application/octet-stream',
  'dist': 'application/octet-stream',
  'distz': 'application/octet-stream',
  'pkg': 'application/octet-stream',
  'bpk': 'application/octet-stream',
  'dump': 'application/octet-stream',
  'elc': 'application/octet-stream',
  'deploy': 'application/octet-stream',
  'exe': 'application/octet-stream',
  'dll': 'application/octet-stream',
  'deb': 'application/octet-stream',
  'dmg': 'application/octet-stream',
  'iso': 'application/octet-stream',
  'img': 'application/octet-stream',
  'msi': 'application/octet-stream',
  'msp': 'application/octet-stream',
  'msm': 'application/octet-stream',
  'buffer': 'application/octet-stream',
  'oda': 'application/oda',
  'opf': 'application/oebps-package+xml',
  'ogx': 'application/ogg',
  'omdoc': 'application/omdoc+xml',
  'onetoc': 'application/onenote',
  'onetoc2': 'application/onenote',
  'onetmp': 'application/onenote',
  'onepkg': 'application/onenote',
  'oxps': 'application/oxps',
  'relo': 'application/p2p-overlay+xml',
  'xer': 'application/patch-ops-error+xml',
  'pdf': 'application/pdf',
  'pgp': 'application/pgp-encrypted',
  'asc': 'application/pgp-signature',
  'sig': 'application/pgp-signature',
  'prf': 'application/pics-rules',
  'p10': 'application/pkcs10',
  'p7m': 'application/pkcs7-mime',
  'p7c': 'application/pkcs7-mime',
  'p7s': 'application/pkcs7-signature',
  'p8': 'application/pkcs8',
  'ac': 'application/pkix-attr-cert',
  'cer': 'application/pkix-cert',
  'crl': 'application/pkix-crl',
  'pkipath': 'application/pkix-pkipath',
  'pki': 'application/pkixcmp',
  'pls': 'application/pls+xml',
  'ai': 'application/postscript',
  'eps': 'application/postscript',
  'ps': 'application/postscript',
  'provx': 'application/provenance+xml',
  'cww': 'application/prs.cww',
  'pskcxml': 'application/pskc+xml',
  'raml': 'application/raml+yaml',
  'rdf': 'application/rdf+xml',
  'owl': 'application/rdf+xml',
  'rif': 'application/reginfo+xml',
  'rnc': 'application/relax-ng-compact-syntax',
  'rl': 'application/resource-lists+xml',
  'rld': 'application/resource-lists-diff+xml',
  'rs': 'application/rls-services+xml',
  'rapd': 'application/route-apd+xml',
  'sls': 'application/route-s-tsid+xml',
  'rusd': 'application/route-usd+xml',
  'gbr': 'application/rpki-ghostbusters',
  'mft': 'application/rpki-manifest',
  'roa': 'application/rpki-roa',
  'rsd': 'application/rsd+xml',
  'rss': 'application/rss+xml',
  'rtf': 'application/rtf',
  'sbml': 'application/sbml+xml',
  'scq': 'application/scvp-cv-request',
  'scs': 'application/scvp-cv-response',
  'spq': 'application/scvp-vp-request',
  'spp': 'application/scvp-vp-response',
  'sdp': 'application/sdp',
  'senmlx': 'application/senml+xml',
  'sensmlx': 'application/sensml+xml',
  'setpay': 'application/set-payment-initiation',
  'setreg': 'application/set-registration-initiation',
  'shf': 'application/shf+xml',
  'siv': 'application/sieve',
  'sieve': 'application/sieve',
  'smi': 'application/smil+xml',
  'smil': 'application/smil+xml',
  'rq': 'application/sparql-query',
  'srx': 'application/sparql-results+xml',
  'gram': 'application/srgs',
  'grxml': 'application/srgs+xml',
  'sru': 'application/sru+xml',
  'ssdl': 'application/ssdl+xml',
  'ssml': 'application/ssml+xml',
  'swidtag': 'application/swid+xml',
  'tei': 'application/tei+xml',
  'teicorpus': 'application/tei+xml',
  'tfi': 'application/thraud+xml',
  'tsd': 'application/timestamped-data',
  'toml': 'application/toml',
  'ttml': 'application/ttml+xml',
  'rsheet': 'application/urc-ressheet+xml',
  '1km': 'application/vnd.1000minds.decision-model+xml',
  'plb': 'application/vnd.3gpp.pic-bw-large',
  'psb': 'application/vnd.3gpp.pic-bw-small',
  'pvb': 'application/vnd.3gpp.pic-bw-var',
  'tcap': 'application/vnd.3gpp2.tcap',
  'pwn': 'application/vnd.3m.post-it-notes',
  'aso': 'application/vnd.accpac.simply.aso',
  'imp': 'application/vnd.accpac.simply.imp',
  'acu': 'application/vnd.acucobol',
  'atc': 'application/vnd.acucorp',
  'acutc': 'application/vnd.acucorp',
  'air': 'application/vnd.adobe.air-application-installer-package+zip',
  'fcdt': 'application/vnd.adobe.formscentral.fcdt',
  'fxp': 'application/vnd.adobe.fxp',
  'fxpl': 'application/vnd.adobe.fxp',
  'xdp': 'application/vnd.adobe.xdp+xml',
  'xfdf': 'application/vnd.adobe.xfdf',
  'ahead': 'application/vnd.ahead.space',
  'azf': 'application/vnd.airzip.filesecure.azf',
  'azs': 'application/vnd.airzip.filesecure.azs',
  'azw': 'application/vnd.amazon.ebook',
  'acc': 'application/vnd.americandynamics.acc',
  'ami': 'application/vnd.amiga.ami',
  'apk': 'application/vnd.android.package-archive',
  'cii': 'application/vnd.anser-web-certificate-issue-initiation',
  'fti': 'application/vnd.anser-web-funds-transfer-initiation',
  'atx': 'application/vnd.antix.game-component',
  'mpkg': 'application/vnd.apple.installer+xml',
  'keynote': 'application/vnd.apple.keynote',
  'm3u8': 'application/vnd.apple.mpegurl',
  'numbers': 'application/vnd.apple.numbers',
  'pages': 'application/vnd.apple.pages',
  'pkpass': 'application/vnd.apple.pkpass',
  'swi': 'application/vnd.aristanetworks.swi',
  'iota': 'application/vnd.astraea-software.iota',
  'aep': 'application/vnd.audiograph',
  'bmml': 'application/vnd.balsamiq.bmml+xml',
  'mpm': 'application/vnd.blueice.multipass',
  'bmi': 'application/vnd.bmi',
  'rep': 'application/vnd.businessobjects',
  'cdxml': 'application/vnd.chemdraw+xml',
  'mmd': 'application/vnd.chipnuts.karaoke-mmd',
  'cdy': 'application/vnd.cinderella',
  'csl': 'application/vnd.citationstyles.style+xml',
  'cla': 'application/vnd.claymore',
  'rp9': 'application/vnd.cloanto.rp9',
  'c4g': 'application/vnd.clonk.c4group',
  'c4d': 'application/vnd.clonk.c4group',
  'c4f': 'application/vnd.clonk.c4group',
  'c4p': 'application/vnd.clonk.c4group',
  'c4u': 'application/vnd.clonk.c4group',
  'c11amc': 'application/vnd.cluetrust.cartomobile-config',
  'c11amz': 'application/vnd.cluetrust.cartomobile-config-pkg',
  'csp': 'application/vnd.commonspace',
  'cdbcmsg': 'application/vnd.contact.cmsg',
  'cmc': 'application/vnd.cosmocaller',
  'clkx': 'application/vnd.crick.clicker',
  'clkk': 'application/vnd.crick.clicker.keyboard',
  'clkp': 'application/vnd.crick.clicker.palette',
  'clkt': 'application/vnd.crick.clicker.template',
  'clkw': 'application/vnd.crick.clicker.wordbank',
  'wbs': 'application/vnd.criticaltools.wbs+xml',
  'pml': 'application/vnd.ctc-posml',
  'ppd': 'application/vnd.cups-ppd',
  'car': 'application/vnd.curl.car',
  'pcurl': 'application/vnd.curl.pcurl',
  'dart': 'application/vnd.dart',
  'rdz': 'application/vnd.data-vision.rdz',
  'uvf': 'application/vnd.dece.data',
  'uvvf': 'application/vnd.dece.data',
  'uvd': 'application/vnd.dece.data',
  'uvvd': 'application/vnd.dece.data',
  'uvt': 'application/vnd.dece.ttml+xml',
  'uvvt': 'application/vnd.dece.ttml+xml',
  'uvx': 'application/vnd.dece.unspecified',
  'uvvx': 'application/vnd.dece.unspecified',
  'uvz': 'application/vnd.dece.zip',
  'uvvz': 'application/vnd.dece.zip',
  'fe_launch': 'application/vnd.denovo.fcselayout-link',
  'dna': 'application/vnd.dna',
  'mlp': 'application/vnd.dolby.mlp',
  'dpg': 'application/vnd.dpgraph',
  'dfac': 'application/vnd.dreamfactory',
  'kpxx': 'application/vnd.ds-keypoint',
  'ait': 'application/vnd.dvb.ait',
  'svc': 'application/vnd.dvb.service',
  'geo': 'application/vnd.dynageo',
  'mag': 'application/vnd.ecowin.chart',
  'nml': 'application/vnd.enliven',
  'esf': 'application/vnd.epson.esf',
  'msf': 'application/vnd.epson.msf',
  'qam': 'application/vnd.epson.quickanime',
  'slt': 'application/vnd.epson.salt',
  'ssf': 'application/vnd.epson.ssf',
  'es3': 'application/vnd.eszigno3+xml',
  'et3': 'application/vnd.eszigno3+xml',
  'ez2': 'application/vnd.ezpix-album',
  'ez3': 'application/vnd.ezpix-package',
  'fdf': 'application/vnd.fdf',
  'mseed': 'application/vnd.fdsn.mseed',
  'seed': 'application/vnd.fdsn.seed',
  'dataless': 'application/vnd.fdsn.seed',
  'gph': 'application/vnd.flographit',
  'ftc': 'application/vnd.fluxtime.clip',
  'fm': 'application/vnd.framemaker',
  'frame': 'application/vnd.framemaker',
  'maker': 'application/vnd.framemaker',
  'book': 'application/vnd.framemaker',
  'fnc': 'application/vnd.frogans.fnc',
  'ltf': 'application/vnd.frogans.ltf',
  'fsc': 'application/vnd.fsc.weblaunch',
  'oas': 'application/vnd.fujitsu.oasys',
  'oa2': 'application/vnd.fujitsu.oasys2',
  'oa3': 'application/vnd.fujitsu.oasys3',
  'fg5': 'application/vnd.fujitsu.oasysgp',
  'bh2': 'application/vnd.fujitsu.oasysprs',
  'ddd': 'application/vnd.fujixerox.ddd',
  'xdw': 'application/vnd.fujixerox.docuworks',
  'xbd': 'application/vnd.fujixerox.docuworks.binder',
  'fzs': 'application/vnd.fuzzysheet',
  'txd': 'application/vnd.genomatix.tuxedo',
  'ggb': 'application/vnd.geogebra.file',
  'ggt': 'application/vnd.geogebra.tool',
  'gex': 'application/vnd.geometry-explorer',
  'gre': 'application/vnd.geometry-explorer',
  'gxt': 'application/vnd.geonext',
  'g2w': 'application/vnd.geoplan',
  'g3w': 'application/vnd.geospace',
  'gmx': 'application/vnd.gmx',
  'gdoc': 'application/vnd.google-apps.document',
  'gslides': 'application/vnd.google-apps.presentation',
  'gsheet': 'application/vnd.google-apps.spreadsheet',
  'kml': 'application/vnd.google-earth.kml+xml',
  'kmz': 'application/vnd.google-earth.kmz',
  'gqf': 'application/vnd.grafeq',
  'gqs': 'application/vnd.grafeq',
  'gac': 'application/vnd.groove-account',
  'ghf': 'application/vnd.groove-help',
  'gim': 'application/vnd.groove-identity-message',
  'grv': 'application/vnd.groove-injector',
  'gtm': 'application/vnd.groove-tool-message',
  'tpl': 'application/vnd.groove-tool-template',
  'vcg': 'application/vnd.groove-vcard',
  'hal': 'application/vnd.hal+xml',
  'zmm': 'application/vnd.handheld-entertainment+xml',
  'hbci': 'application/vnd.hbci',
  'les': 'application/vnd.hhe.lesson-player',
  'hpgl': 'application/vnd.hp-hpgl',
  'hpid': 'application/vnd.hp-hpid',
  'hps': 'application/vnd.hp-hps',
  'jlt': 'application/vnd.hp-jlyt',
  'pcl': 'application/vnd.hp-pcl',
  'pclxl': 'application/vnd.hp-pclxl',
  'sfd-hdstx': 'application/vnd.hydrostatix.sof-data',
  'mpy': 'application/vnd.ibm.minipay',
  'afp': 'application/vnd.ibm.modcap',
  'listafp': 'application/vnd.ibm.modcap',
  'list3820': 'application/vnd.ibm.modcap',
  'irm': 'application/vnd.ibm.rights-management',
  'sc': 'application/vnd.ibm.secure-container',
  'icc': 'application/vnd.iccprofile',
  'icm': 'application/vnd.iccprofile',
  'igl': 'application/vnd.igloader',
  'ivp': 'application/vnd.immervision-ivp',
  'ivu': 'application/vnd.immervision-ivu',
  'igm': 'application/vnd.insors.igm',
  'xpw': 'application/vnd.intercon.formnet',
  'xpx': 'application/vnd.intercon.formnet',
  'i2g': 'application/vnd.intergeo',
  'qbo': 'application/vnd.intu.qbo',
  'qfx': 'application/vnd.intu.qfx',
  'rcprofile': 'application/vnd.ipunplugged.rcprofile',
  'irp': 'application/vnd.irepository.package+xml',
  'xpr': 'application/vnd.is-xpr',
  'fcs': 'application/vnd.isac.fcs',
  'jam': 'application/vnd.jam',
  'rms': 'application/vnd.jcp.javame.midlet-rms',
  'jisp': 'application/vnd.jisp',
  'joda': 'application/vnd.joost.joda-archive',
  'ktz': 'application/vnd.kahootz',
  'ktr': 'application/vnd.kahootz',
  'karbon': 'application/vnd.kde.karbon',
  'chrt': 'application/vnd.kde.kchart',
  'kfo': 'application/vnd.kde.kformula',
  'flw': 'application/vnd.kde.kivio',
  'kon': 'application/vnd.kde.kontour',
  'kpr': 'application/vnd.kde.kpresenter',
  'kpt': 'application/vnd.kde.kpresenter',
  'ksp': 'application/vnd.kde.kspread',
  'kwd': 'application/vnd.kde.kword',
  'kwt': 'application/vnd.kde.kword',
  'htke': 'application/vnd.kenameaapp',
  'kia': 'application/vnd.kidspiration',
  'kne': 'application/vnd.kinar',
  'knp': 'application/vnd.kinar',
  'skp': 'application/vnd.koan',
  'skd': 'application/vnd.koan',
  'skt': 'application/vnd.koan',
  'skm': 'application/vnd.koan',
  'sse': 'application/vnd.kodak-descriptor',
  'lasxml': 'application/vnd.las.las+xml',
  'lbd': 'application/vnd.llamagraphics.life-balance.desktop',
  'lbe': 'application/vnd.llamagraphics.life-balance.exchange+xml',
  '123': 'application/vnd.lotus-1-2-3',
  'apr': 'application/vnd.lotus-approach',
  'pre': 'application/vnd.lotus-freelance',
  'nsf': 'application/vnd.lotus-notes',
  'org': 'application/vnd.lotus-organizer',
  'scm': 'application/vnd.lotus-screencam',
  'lwp': 'application/vnd.lotus-wordpro',
  'portpkg': 'application/vnd.macports.portpkg',
  'mcd': 'application/vnd.mcd',
  'mc1': 'application/vnd.medcalcdata',
  'cdkey': 'application/vnd.mediastation.cdkey',
  'mwf': 'application/vnd.mfer',
  'mfm': 'application/vnd.mfmp',
  'flo': 'application/vnd.micrografx.flo',
  'igx': 'application/vnd.micrografx.igx',
  'mif': 'application/vnd.mif',
  'daf': 'application/vnd.mobius.daf',
  'dis': 'application/vnd.mobius.dis',
  'mbk': 'application/vnd.mobius.mbk',
  'mqy': 'application/vnd.mobius.mqy',
  'msl': 'application/vnd.mobius.msl',
  'plc': 'application/vnd.mobius.plc',
  'txf': 'application/vnd.mobius.txf',
  'mpn': 'application/vnd.mophun.application',
  'mpc': 'application/vnd.mophun.certificate',
  'xul': 'application/vnd.mozilla.xul+xml',
  'cil': 'application/vnd.ms-artgalry',
  'cab': 'application/vnd.ms-cab-compressed',
  'xls': 'application/vnd.ms-excel',
  'xlm': 'application/vnd.ms-excel',
  'xla': 'application/vnd.ms-excel',
  'xlc': 'application/vnd.ms-excel',
  'xlt': 'application/vnd.ms-excel',
  'xlw': 'application/vnd.ms-excel',
  'xlam': 'application/vnd.ms-excel.addin.macroenabled.12',
  'xlsb': 'application/vnd.ms-excel.sheet.binary.macroenabled.12',
  'xlsm': 'application/vnd.ms-excel.sheet.macroenabled.12',
  'xltm': 'application/vnd.ms-excel.template.macroenabled.12',
  'eot': 'application/vnd.ms-fontobject',
  'chm': 'application/vnd.ms-htmlhelp',
  'ims': 'application/vnd.ms-ims',
  'lrm': 'application/vnd.ms-lrm',
  'thmx': 'application/vnd.ms-officetheme',
  'msg': 'application/vnd.ms-outlook',
  'cat': 'application/vnd.ms-pki.seccat',
  'stl': 'application/vnd.ms-pki.stl',
  'ppt': 'application/vnd.ms-powerpoint',
  'pps': 'application/vnd.ms-powerpoint',
  'pot': 'application/vnd.ms-powerpoint',
  'ppam': 'application/vnd.ms-powerpoint.addin.macroenabled.12',
  'pptm': 'application/vnd.ms-powerpoint.presentation.macroenabled.12',
  'sldm': 'application/vnd.ms-powerpoint.slide.macroenabled.12',
  'ppsm': 'application/vnd.ms-powerpoint.slideshow.macroenabled.12',
  'potm': 'application/vnd.ms-powerpoint.template.macroenabled.12',
  'mpp': 'application/vnd.ms-project',
  'mpt': 'application/vnd.ms-project',
  'docm': 'application/vnd.ms-word.document.macroenabled.12',
  'dotm': 'application/vnd.ms-word.template.macroenabled.12',
  'wps': 'application/vnd.ms-works',
  'wks': 'application/vnd.ms-works',
  'wcm': 'application/vnd.ms-works',
  'wdb': 'application/vnd.ms-works',
  'wpl': 'application/vnd.ms-wpl',
  'xps': 'application/vnd.ms-xpsdocument',
  'mseq': 'application/vnd.mseq',
  'mus': 'application/vnd.musician',
  'msty': 'application/vnd.muvee.style',
  'taglet': 'application/vnd.mynfc',
  'nlu': 'application/vnd.neurolanguage.nlu',
  'ntf': 'application/vnd.nitf',
  'nitf': 'application/vnd.nitf',
  'nnd': 'application/vnd.noblenet-directory',
  'nns': 'application/vnd.noblenet-sealer',
  'nnw': 'application/vnd.noblenet-web',
  'ngdat': 'application/vnd.nokia.n-gage.data',
  'n-gage': 'application/vnd.nokia.n-gage.symbian.install',
  'rpst': 'application/vnd.nokia.radio-preset',
  'rpss': 'application/vnd.nokia.radio-presets',
  'edm': 'application/vnd.novadigm.edm',
  'edx': 'application/vnd.novadigm.edx',
  'ext': 'application/vnd.novadigm.ext',
  'odc': 'application/vnd.oasis.opendocument.chart',
  'otc': 'application/vnd.oasis.opendocument.chart-template',
  'odb': 'application/vnd.oasis.opendocument.database',
  'odf': 'application/vnd.oasis.opendocument.formula',
  'odft': 'application/vnd.oasis.opendocument.formula-template',
  'odg': 'application/vnd.oasis.opendocument.graphics',
  'otg': 'application/vnd.oasis.opendocument.graphics-template',
  'odi': 'application/vnd.oasis.opendocument.image',
  'oti': 'application/vnd.oasis.opendocument.image-template',
  'odp': 'application/vnd.oasis.opendocument.presentation',
  'otp': 'application/vnd.oasis.opendocument.presentation-template',
  'ods': 'application/vnd.oasis.opendocument.spreadsheet',
  'ots': 'application/vnd.oasis.opendocument.spreadsheet-template',
  'odt': 'application/vnd.oasis.opendocument.text',
  'odm': 'application/vnd.oasis.opendocument.text-master',
  'ott': 'application/vnd.oasis.opendocument.text-template',
  'oth': 'application/vnd.oasis.opendocument.text-web',
  'xo': 'application/vnd.olpc-sugar',
  'dd2': 'application/vnd.oma.dd2+xml',
  'obgx': 'application/vnd.openblox.game+xml',
  'oxt': 'application/vnd.openofficeorg.extension',
  'osm': 'application/vnd.openstreetmap.data+xml',
  'pptx':
      'application/vnd.openxmlformats-officedocument.presentationml.presentation',
  'sldx': 'application/vnd.openxmlformats-officedocument.presentationml.slide',
  'ppsx':
      'application/vnd.openxmlformats-officedocument.presentationml.slideshow',
  'potx':
      'application/vnd.openxmlformats-officedocument.presentationml.template',
  'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  'xltx':
      'application/vnd.openxmlformats-officedocument.spreadsheetml.template',
  'docx':
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'dotx':
      'application/vnd.openxmlformats-officedocument.wordprocessingml.template',
  'mgp': 'application/vnd.osgeo.mapguide.package',
  'dp': 'application/vnd.osgi.dp',
  'esa': 'application/vnd.osgi.subsystem',
  'pdb': 'application/vnd.palm',
  'pqa': 'application/vnd.palm',
  'oprc': 'application/vnd.palm',
  'paw': 'application/vnd.pawaafile',
  'str': 'application/vnd.pg.format',
  'ei6': 'application/vnd.pg.osasli',
  'efif': 'application/vnd.picsel',
  'wg': 'application/vnd.pmi.widget',
  'plf': 'application/vnd.pocketlearn',
  'pbd': 'application/vnd.powerbuilder6',
  'box': 'application/vnd.previewsystems.box',
  'mgz': 'application/vnd.proteus.magazine',
  'qps': 'application/vnd.publishare-delta-tree',
  'ptid': 'application/vnd.pvi.ptid1',
  'qxd': 'application/vnd.quark.quarkxpress',
  'qxt': 'application/vnd.quark.quarkxpress',
  'qwd': 'application/vnd.quark.quarkxpress',
  'qwt': 'application/vnd.quark.quarkxpress',
  'qxl': 'application/vnd.quark.quarkxpress',
  'qxb': 'application/vnd.quark.quarkxpress',
  'bed': 'application/vnd.realvnc.bed',
  'mxl': 'application/vnd.recordare.musicxml',
  'musicxml': 'application/vnd.recordare.musicxml+xml',
  'cryptonote': 'application/vnd.rig.cryptonote',
  'cod': 'application/vnd.rim.cod',
  'rm': 'application/vnd.rn-realmedia',
  'rmvb': 'application/vnd.rn-realmedia-vbr',
  'link66': 'application/vnd.route66.link66+xml',
  'st': 'application/vnd.sailingtracker.track',
  'see': 'application/vnd.seemail',
  'sema': 'application/vnd.sema',
  'semd': 'application/vnd.semd',
  'semf': 'application/vnd.semf',
  'ifm': 'application/vnd.shana.informed.formdata',
  'itp': 'application/vnd.shana.informed.formtemplate',
  'iif': 'application/vnd.shana.informed.interchange',
  'ipk': 'application/vnd.shana.informed.package',
  'twd': 'application/vnd.simtech-mindmapper',
  'twds': 'application/vnd.simtech-mindmapper',
  'mmf': 'application/vnd.smaf',
  'teacher': 'application/vnd.smart.teacher',
  'fo': 'application/vnd.software602.filler.form+xml',
  'sdkm': 'application/vnd.solent.sdkm+xml',
  'sdkd': 'application/vnd.solent.sdkm+xml',
  'dxp': 'application/vnd.spotfire.dxp',
  'sfs': 'application/vnd.spotfire.sfs',
  'sdc': 'application/vnd.stardivision.calc',
  'sda': 'application/vnd.stardivision.draw',
  'sdd': 'application/vnd.stardivision.impress',
  'smf': 'application/vnd.stardivision.math',
  'sdw': 'application/vnd.stardivision.writer',
  'vor': 'application/vnd.stardivision.writer',
  'sgl': 'application/vnd.stardivision.writer-global',
  'smzip': 'application/vnd.stepmania.package',
  'sm': 'application/vnd.stepmania.stepchart',
  'wadl': 'application/vnd.sun.wadl+xml',
  'sxc': 'application/vnd.sun.xml.calc',
  'stc': 'application/vnd.sun.xml.calc.template',
  'sxd': 'application/vnd.sun.xml.draw',
  'std': 'application/vnd.sun.xml.draw.template',
  'sxi': 'application/vnd.sun.xml.impress',
  'sti': 'application/vnd.sun.xml.impress.template',
  'sxm': 'application/vnd.sun.xml.math',
  'sxw': 'application/vnd.sun.xml.writer',
  'sxg': 'application/vnd.sun.xml.writer.global',
  'stw': 'application/vnd.sun.xml.writer.template',
  'sus': 'application/vnd.sus-calendar',
  'susp': 'application/vnd.sus-calendar',
  'svd': 'application/vnd.svd',
  'sis': 'application/vnd.symbian.install',
  'sisx': 'application/vnd.symbian.install',
  'xsm': 'application/vnd.syncml+xml',
  'bdm': 'application/vnd.syncml.dm+wbxml',
  'xdm': 'application/vnd.syncml.dm+xml',
  'ddf': 'application/vnd.syncml.dmddf+xml',
  'tao': 'application/vnd.tao.intent-module-archive',
  'pcap': 'application/vnd.tcpdump.pcap',
  'cap': 'application/vnd.tcpdump.pcap',
  'dmp': 'application/vnd.tcpdump.pcap',
  'tmo': 'application/vnd.tmobile-livetv',
  'tpt': 'application/vnd.trid.tpt',
  'mxs': 'application/vnd.triscape.mxs',
  'tra': 'application/vnd.trueapp',
  'ufd': 'application/vnd.ufdl',
  'ufdl': 'application/vnd.ufdl',
  'utz': 'application/vnd.uiq.theme',
  'umj': 'application/vnd.umajin',
  'unityweb': 'application/vnd.unity',
  'uoml': 'application/vnd.uoml+xml',
  'vcx': 'application/vnd.vcx',
  'vsd': 'application/vnd.visio',
  'vst': 'application/vnd.visio',
  'vss': 'application/vnd.visio',
  'vsw': 'application/vnd.visio',
  'vis': 'application/vnd.visionary',
  'vsf': 'application/vnd.vsf',
  'wbxml': 'application/vnd.wap.wbxml',
  'wmlc': 'application/vnd.wap.wmlc',
  'wmlsc': 'application/vnd.wap.wmlscriptc',
  'wtb': 'application/vnd.webturbo',
  'nbp': 'application/vnd.wolfram.player',
  'wpd': 'application/vnd.wordperfect',
  'wqd': 'application/vnd.wqd',
  'stf': 'application/vnd.wt.stf',
  'xar': 'application/vnd.xara',
  'xfdl': 'application/vnd.xfdl',
  'hvd': 'application/vnd.yamaha.hv-dic',
  'hvs': 'application/vnd.yamaha.hv-script',
  'hvp': 'application/vnd.yamaha.hv-voice',
  'osf': 'application/vnd.yamaha.openscoreformat',
  'osfpvg': 'application/vnd.yamaha.openscoreformat.osfpvg+xml',
  'saf': 'application/vnd.yamaha.smaf-audio',
  'spf': 'application/vnd.yamaha.smaf-phrase',
  'cmp': 'application/vnd.yellowriver-custom-menu',
  'zir': 'application/vnd.zul',
  'zirz': 'application/vnd.zul',
  'zaz': 'application/vnd.zzazz.deck+xml',
  'vxml': 'application/voicexml+xml',
  'wasm': 'application/wasm',
  'wgt': 'application/widget',
  'hlp': 'application/winhlp',
  'wsdl': 'application/wsdl+xml',
  'wspolicy': 'application/wspolicy+xml',
  '7z': 'application/x-7z-compressed',
  'abw': 'application/x-abiword',
  'ace': 'application/x-ace-compressed',
  'arj': 'application/x-arj',
  'aab': 'application/x-authorware-bin',
  'x32': 'application/x-authorware-bin',
  'u32': 'application/x-authorware-bin',
  'vox': 'application/x-authorware-bin',
  'aam': 'application/x-authorware-map',
  'aas': 'application/x-authorware-seg',
  'bcpio': 'application/x-bcpio',
  'torrent': 'application/x-bittorrent',
  'blb': 'application/x-blorb',
  'blorb': 'application/x-blorb',
  'bz': 'application/x-bzip',
  'bz2': 'application/x-bzip2',
  'boz': 'application/x-bzip2',
  'cbr': 'application/x-cbr',
  'cba': 'application/x-cbr',
  'cbt': 'application/x-cbr',
  'cbz': 'application/x-cbr',
  'cb7': 'application/x-cbr',
  'vcd': 'application/x-cdlink',
  'cfs': 'application/x-cfs-compressed',
  'chat': 'application/x-chat',
  'pgn': 'application/x-chess-pgn',
  'crx': 'application/x-chrome-extension',
  'cco': 'application/x-cocoa',
  'nsc': 'application/x-conference',
  'cpio': 'application/x-cpio',
  'csh': 'application/x-csh',
  'udeb': 'application/x-debian-package',
  'dgc': 'application/x-dgc-compressed',
  'dir': 'application/x-director',
  'dcr': 'application/x-director',
  'dxr': 'application/x-director',
  'cst': 'application/x-director',
  'cct': 'application/x-director',
  'cxt': 'application/x-director',
  'w3d': 'application/x-director',
  'fgd': 'application/x-director',
  'swa': 'application/x-director',
  'wad': 'application/x-doom',
  'ncx': 'application/x-dtbncx+xml',
  'dtb': 'application/x-dtbook+xml',
  'res': 'application/x-dtbresource+xml',
  'dvi': 'application/x-dvi',
  'evy': 'application/x-envoy',
  'eva': 'application/x-eva',
  'bdf': 'application/x-font-bdf',
  'gsf': 'application/x-font-ghostscript',
  'psf': 'application/x-font-linux-psf',
  'pcf': 'application/x-font-pcf',
  'snf': 'application/x-font-snf',
  'pfa': 'application/x-font-type1',
  'pfb': 'application/x-font-type1',
  'pfm': 'application/x-font-type1',
  'afm': 'application/x-font-type1',
  'arc': 'application/x-freearc',
  'spl': 'application/x-futuresplash',
  'gca': 'application/x-gca-compressed',
  'ulx': 'application/x-glulx',
  'gnumeric': 'application/x-gnumeric',
  'gramps': 'application/x-gramps-xml',
  'gtar': 'application/x-gtar',
  'hdf': 'application/x-hdf',
  'php': 'application/x-httpd-php',
  'install': 'application/x-install-instructions',
  'jardiff': 'application/x-java-archive-diff',
  'jnlp': 'application/x-java-jnlp-file',
  'kdbx': 'application/x-keepass2',
  'latex': 'application/x-latex',
  'luac': 'application/x-lua-bytecode',
  'lzh': 'application/x-lzh-compressed',
  'lha': 'application/x-lzh-compressed',
  'run': 'application/x-makeself',
  'mie': 'application/x-mie',
  'prc': 'application/x-mobipocket-ebook',
  'mobi': 'application/x-mobipocket-ebook',
  'application': 'application/x-ms-application',
  'lnk': 'application/x-ms-shortcut',
  'wmd': 'application/x-ms-wmd',
  'wmz': 'application/x-ms-wmz',
  'xbap': 'application/x-ms-xbap',
  'mdb': 'application/x-msaccess',
  'obd': 'application/x-msbinder',
  'crd': 'application/x-mscardfile',
  'clp': 'application/x-msclip',
  'com': 'application/x-msdownload',
  'bat': 'application/x-msdownload',
  'mvb': 'application/x-msmediaview',
  'm13': 'application/x-msmediaview',
  'm14': 'application/x-msmediaview',
  'wmf': 'application/x-msmetafile',
  'emf': 'application/x-msmetafile',
  'emz': 'application/x-msmetafile',
  'mny': 'application/x-msmoney',
  'pub': 'application/x-mspublisher',
  'scd': 'application/x-msschedule',
  'trm': 'application/x-msterminal',
  'wri': 'application/x-mswrite',
  'nc': 'application/x-netcdf',
  'cdf': 'application/x-netcdf',
  'pac': 'application/x-ns-proxy-autoconfig',
  'nzb': 'application/x-nzb',
  'pl': 'application/x-perl',
  'pm': 'application/x-perl',
  'p12': 'application/x-pkcs12',
  'pfx': 'application/x-pkcs12',
  'p7b': 'application/x-pkcs7-certificates',
  'spc': 'application/x-pkcs7-certificates',
  'p7r': 'application/x-pkcs7-certreqresp',
  'rar': 'application/x-rar-compressed',
  'rpm': 'application/x-redhat-package-manager',
  'ris': 'application/x-research-info-systems',
  'sea': 'application/x-sea',
  'sh': 'application/x-sh',
  'shar': 'application/x-shar',
  'swf': 'application/x-shockwave-flash',
  'xap': 'application/x-silverlight-app',
  'sql': 'application/x-sql',
  'sit': 'application/x-stuffit',
  'sitx': 'application/x-stuffitx',
  'srt': 'application/x-subrip',
  'sv4cpio': 'application/x-sv4cpio',
  'sv4crc': 'application/x-sv4crc',
  't3': 'application/x-t3vm-image',
  'gam': 'application/x-tads',
  'tar': 'application/x-tar',
  'tcl': 'application/x-tcl',
  'tk': 'application/x-tcl',
  'tex': 'application/x-tex',
  'tfm': 'application/x-tex-tfm',
  'texinfo': 'application/x-texinfo',
  'texi': 'application/x-texinfo',
  'obj': 'application/x-tgif',
  'ustar': 'application/x-ustar',
  'hdd': 'application/x-virtualbox-hdd',
  'ova': 'application/x-virtualbox-ova',
  'ovf': 'application/x-virtualbox-ovf',
  'vbox': 'application/x-virtualbox-vbox',
  'vbox-extpack': 'application/x-virtualbox-vbox-extpack',
  'vdi': 'application/x-virtualbox-vdi',
  'vhd': 'application/x-virtualbox-vhd',
  'vmdk': 'application/x-virtualbox-vmdk',
  'src': 'application/x-wais-source',
  'webapp': 'application/x-web-app-manifest+json',
  'der': 'application/x-x509-ca-cert',
  'crt': 'application/x-x509-ca-cert',
  'pem': 'application/x-x509-ca-cert',
  'fig': 'application/x-xfig',
  'xlf': 'application/x-xliff+xml',
  'xpi': 'application/x-xpinstall',
  'xz': 'application/x-xz',
  'z1': 'application/x-zmachine',
  'z2': 'application/x-zmachine',
  'z3': 'application/x-zmachine',
  'z4': 'application/x-zmachine',
  'z5': 'application/x-zmachine',
  'z6': 'application/x-zmachine',
  'z7': 'application/x-zmachine',
  'z8': 'application/x-zmachine',
  'xaml': 'application/xaml+xml',
  'xav': 'application/xcap-att+xml',
  'xca': 'application/xcap-caps+xml',
  'xel': 'application/xcap-el+xml',
  'xns': 'application/xcap-ns+xml',
  'xenc': 'application/xenc+xml',
  'xhtml': 'application/xhtml+xml',
  'xht': 'application/xhtml+xml',
  'xml': 'application/xml',
  'xsl': 'application/xml',
  'xsd': 'application/xml',
  'rng': 'application/xml',
  'dtd': 'application/xml-dtd',
  'xop': 'application/xop+xml',
  'xpl': 'application/xproc+xml',
  'xslt': 'application/xslt+xml',
  'xspf': 'application/xspf+xml',
  'mxml': 'application/xv+xml',
  'xhvml': 'application/xv+xml',
  'xvml': 'application/xv+xml',
  'xvm': 'application/xv+xml',
  'yang': 'application/yang',
  'yin': 'application/yin+xml',
  'zip': 'application/zip',
  '3gpp': 'audio/3gpp',
  'adp': 'audio/adpcm',
  'au': 'audio/basic',
  'snd': 'audio/basic',
  'mid': 'audio/midi',
  'midi': 'audio/midi',
  'kar': 'audio/midi',
  'rmi': 'audio/midi',
  'mxmf': 'audio/mobile-xmf',
  'mp3': 'audio/mp3',
  'm4a': 'audio/mp4',
  'mp4a': 'audio/mp4',
  'mpga': 'audio/mpeg',
  'mp2': 'audio/mpeg',
  'mp2a': 'audio/mpeg',
  'm2a': 'audio/mpeg',
  'm3a': 'audio/mpeg',
  'oga': 'audio/ogg',
  'ogg': 'audio/ogg',
  'spx': 'audio/ogg',
  's3m': 'audio/s3m',
  'sil': 'audio/silk',
  'uva': 'audio/vnd.dece.audio',
  'uvva': 'audio/vnd.dece.audio',
  'eol': 'audio/vnd.digital-winds',
  'dra': 'audio/vnd.dra',
  'dts': 'audio/vnd.dts',
  'dtshd': 'audio/vnd.dts.hd',
  'lvp': 'audio/vnd.lucent.voice',
  'pya': 'audio/vnd.ms-playready.media.pya',
  'ecelp4800': 'audio/vnd.nuera.ecelp4800',
  'ecelp7470': 'audio/vnd.nuera.ecelp7470',
  'ecelp9600': 'audio/vnd.nuera.ecelp9600',
  'rip': 'audio/vnd.rip',
  'wav': 'audio/wav',
  'weba': 'audio/webm',
  'aac': 'audio/x-aac',
  'aif': 'audio/x-aiff',
  'aiff': 'audio/x-aiff',
  'aifc': 'audio/x-aiff',
  'caf': 'audio/x-caf',
  'flac': 'audio/x-flac',
  'mka': 'audio/x-matroska',
  'm3u': 'audio/x-mpegurl',
  'wax': 'audio/x-ms-wax',
  'wma': 'audio/x-ms-wma',
  'ram': 'audio/x-pn-realaudio',
  'ra': 'audio/x-pn-realaudio',
  'rmp': 'audio/x-pn-realaudio-plugin',
  'xm': 'audio/xm',
  'cdx': 'chemical/x-cdx',
  'cif': 'chemical/x-cif',
  'cmdf': 'chemical/x-cmdf',
  'cml': 'chemical/x-cml',
  'csml': 'chemical/x-csml',
  'xyz': 'chemical/x-xyz',
  'ttc': 'font/collection',
  'otf': 'font/otf',
  'ttf': 'font/ttf',
  'woff': 'font/woff',
  'woff2': 'font/woff2',
  'exr': 'image/aces',
  'apng': 'image/apng',
  'bmp': 'image/bmp',
  'cgm': 'image/cgm',
  'drle': 'image/dicom-rle',
  'fits': 'image/fits',
  'g3': 'image/g3fax',
  'gif': 'image/gif',
  'heic': 'image/heic',
  'heics': 'image/heic-sequence',
  'heif': 'image/heif',
  'heifs': 'image/heif-sequence',
  'hej2': 'image/hej2k',
  'hsj2': 'image/hsj2',
  'ief': 'image/ief',
  'jls': 'image/jls',
  'jp2': 'image/jp2',
  'jpg2': 'image/jp2',
  'jpeg': 'image/jpeg',
  'jpg': 'image/jpeg',
  'jpe': 'image/jpeg',
  'jph': 'image/jph',
  'jhc': 'image/jphc',
  'jpm': 'image/jpm',
  'jpx': 'image/jpx',
  'jpf': 'image/jpx',
  'jxr': 'image/jxr',
  'jxra': 'image/jxra',
  'jxrs': 'image/jxrs',
  'jxs': 'image/jxs',
  'jxsc': 'image/jxsc',
  'jxsi': 'image/jxsi',
  'jxss': 'image/jxss',
  'ktx': 'image/ktx',
  'png': 'image/png',
  'btif': 'image/prs.btif',
  'pti': 'image/prs.pti',
  'sgi': 'image/sgi',
  'svg': 'image/svg+xml',
  'svgz': 'image/svg+xml',
  't38': 'image/t38',
  'tif': 'image/tiff',
  'tiff': 'image/tiff',
  'tfx': 'image/tiff-fx',
  'psd': 'image/vnd.adobe.photoshop',
  'azv': 'image/vnd.airzip.accelerator.azv',
  'uvi': 'image/vnd.dece.graphic',
  'uvvi': 'image/vnd.dece.graphic',
  'uvg': 'image/vnd.dece.graphic',
  'uvvg': 'image/vnd.dece.graphic',
  'djvu': 'image/vnd.djvu',
  'djv': 'image/vnd.djvu',
  'sub': 'image/vnd.dvb.subtitle',
  'dwg': 'image/vnd.dwg',
  'dxf': 'image/vnd.dxf',
  'fbs': 'image/vnd.fastbidsheet',
  'fpx': 'image/vnd.fpx',
  'fst': 'image/vnd.fst',
  'mmr': 'image/vnd.fujixerox.edmics-mmr',
  'rlc': 'image/vnd.fujixerox.edmics-rlc',
  'ico': 'image/vnd.microsoft.icon',
  'dds': 'image/vnd.ms-dds',
  'mdi': 'image/vnd.ms-modi',
  'wdp': 'image/vnd.ms-photo',
  'npx': 'image/vnd.net-fpx',
  'tap': 'image/vnd.tencent.tap',
  'vtf': 'image/vnd.valve.source.texture',
  'wbmp': 'image/vnd.wap.wbmp',
  'xif': 'image/vnd.xiff',
  'pcx': 'image/vnd.zbrush.pcx',
  'webp': 'image/webp',
  '3ds': 'image/x-3ds',
  'ras': 'image/x-cmu-raster',
  'cmx': 'image/x-cmx',
  'fh': 'image/x-freehand',
  'fhc': 'image/x-freehand',
  'fh4': 'image/x-freehand',
  'fh5': 'image/x-freehand',
  'fh7': 'image/x-freehand',
  'jng': 'image/x-jng',
  'sid': 'image/x-mrsid-image',
  'pic': 'image/x-pict',
  'pct': 'image/x-pict',
  'pnm': 'image/x-portable-anymap',
  'pbm': 'image/x-portable-bitmap',
  'pgm': 'image/x-portable-graymap',
  'ppm': 'image/x-portable-pixmap',
  'rgb': 'image/x-rgb',
  'tga': 'image/x-tga',
  'xbm': 'image/x-xbitmap',
  'xpm': 'image/x-xpixmap',
  'xwd': 'image/x-xwindowdump',
  'disposition-notification': 'message/disposition-notification',
  'u8msg': 'message/global',
  'u8dsn': 'message/global-delivery-status',
  'u8mdn': 'message/global-disposition-notification',
  'u8hdr': 'message/global-headers',
  'eml': 'message/rfc822',
  'mime': 'message/rfc822',
  'wsc': 'message/vnd.wfa.wsc',
  '3mf': 'model/3mf',
  'gltf': 'model/gltf+json',
  'glb': 'model/gltf-binary',
  'igs': 'model/iges',
  'iges': 'model/iges',
  'msh': 'model/mesh',
  'mesh': 'model/mesh',
  'silo': 'model/mesh',
  'mtl': 'model/mtl',
  'dae': 'model/vnd.collada+xml',
  'dwf': 'model/vnd.dwf',
  'gdl': 'model/vnd.gdl',
  'gtw': 'model/vnd.gtw',
  'mts': 'model/vnd.mts',
  'ogex': 'model/vnd.opengex',
  'x_b': 'model/vnd.parasolid.transmit.binary',
  'x_t': 'model/vnd.parasolid.transmit.text',
  'usdz': 'model/vnd.usdz+zip',
  'bsp': 'model/vnd.valve.source.compiled-map',
  'vtu': 'model/vnd.vtu',
  'wrl': 'model/vrml',
  'vrml': 'model/vrml',
  'x3db': 'model/x3d+binary',
  'x3dbz': 'model/x3d+binary',
  'x3dv': 'model/x3d+vrml',
  'x3dvz': 'model/x3d+vrml',
  'x3d': 'model/x3d+xml',
  'x3dz': 'model/x3d+xml',
  'appcache': 'text/cache-manifest',
  'manifest': 'text/cache-manifest',
  'ics': 'text/calendar',
  'ifb': 'text/calendar',
  'coffee': 'text/coffeescript',
  'litcoffee': 'text/coffeescript',
  'css': 'text/css',
  'csv': 'text/csv',
  'html': 'text/html',
  'htm': 'text/html',
  'shtml': 'text/html',
  'jade': 'text/jade',
  'jsx': 'text/jsx',
  'less': 'text/less',
  'markdown': 'text/markdown',
  'md': 'text/markdown',
  'mml': 'text/mathml',
  'mdx': 'text/mdx',
  'n3': 'text/n3',
  'txt': 'text/plain',
  'text': 'text/plain',
  'conf': 'text/plain',
  'def': 'text/plain',
  'list': 'text/plain',
  'log': 'text/plain',
  'in': 'text/plain',
  'ini': 'text/plain',
  'dsc': 'text/prs.lines.tag',
  'rtx': 'text/richtext',
  'sgml': 'text/sgml',
  'sgm': 'text/sgml',
  'shex': 'text/shex',
  'slim': 'text/slim',
  'slm': 'text/slim',
  'stylus': 'text/stylus',
  'styl': 'text/stylus',
  'tsv': 'text/tab-separated-values',
  't': 'text/troff',
  'tr': 'text/troff',
  'roff': 'text/troff',
  'man': 'text/troff',
  'me': 'text/troff',
  'ms': 'text/troff',
  'ttl': 'text/turtle',
  'uri': 'text/uri-list',
  'uris': 'text/uri-list',
  'urls': 'text/uri-list',
  'vcard': 'text/vcard',
  'curl': 'text/vnd.curl',
  'dcurl': 'text/vnd.curl.dcurl',
  'mcurl': 'text/vnd.curl.mcurl',
  'scurl': 'text/vnd.curl.scurl',
  'fly': 'text/vnd.fly',
  'flx': 'text/vnd.fmi.flexstor',
  'gv': 'text/vnd.graphviz',
  '3dml': 'text/vnd.in3d.3dml',
  'spot': 'text/vnd.in3d.spot',
  'jad': 'text/vnd.sun.j2me.app-descriptor',
  'wml': 'text/vnd.wap.wml',
  'wmls': 'text/vnd.wap.wmlscript',
  'vtt': 'text/vtt',
  's': 'text/x-asm',
  'asm': 'text/x-asm',
  'c': 'text/x-c',
  'cc': 'text/x-c',
  'cxx': 'text/x-c',
  'cpp': 'text/x-c',
  'h': 'text/x-c',
  'hh': 'text/x-c',
  'dic': 'text/x-c',
  'htc': 'text/x-component',
  'f': 'text/x-fortran',
  'for': 'text/x-fortran',
  'f77': 'text/x-fortran',
  'f90': 'text/x-fortran',
  'hbs': 'text/x-handlebars-template',
  'java': 'text/x-java-source',
  'lua': 'text/x-lua',
  'mkd': 'text/x-markdown',
  'nfo': 'text/x-nfo',
  'opml': 'text/x-opml',
  'p': 'text/x-pascal',
  'pas': 'text/x-pascal',
  'pde': 'text/x-processing',
  'sass': 'text/x-sass',
  'scss': 'text/x-scss',
  'etx': 'text/x-setext',
  'sfv': 'text/x-sfv',
  'ymp': 'text/x-suse-ymp',
  'uu': 'text/x-uuencode',
  'vcs': 'text/x-vcalendar',
  'vcf': 'text/x-vcard',
  'yaml': 'text/yaml',
  'yml': 'text/yaml',
  '3gp': 'video/3gpp',
  '3g2': 'video/3gpp2',
  'h261': 'video/h261',
  'h263': 'video/h263',
  'h264': 'video/h264',
  'jpgv': 'video/jpeg',
  'jpgm': 'video/jpm',
  'mj2': 'video/mj2',
  'mjp2': 'video/mj2',
  'ts': 'video/mp2t',
  'mp4': 'video/mp4',
  'mp4v': 'video/mp4',
  'mpg4': 'video/mp4',
  'mpeg': 'video/mpeg',
  'mpg': 'video/mpeg',
  'mpe': 'video/mpeg',
  'm1v': 'video/mpeg',
  'm2v': 'video/mpeg',
  'ogv': 'video/ogg',
  'qt': 'video/quicktime',
  'mov': 'video/quicktime',
  'uvh': 'video/vnd.dece.hd',
  'uvvh': 'video/vnd.dece.hd',
  'uvm': 'video/vnd.dece.mobile',
  'uvvm': 'video/vnd.dece.mobile',
  'uvp': 'video/vnd.dece.pd',
  'uvvp': 'video/vnd.dece.pd',
  'uvs': 'video/vnd.dece.sd',
  'uvvs': 'video/vnd.dece.sd',
  'uvv': 'video/vnd.dece.video',
  'uvvv': 'video/vnd.dece.video',
  'dvb': 'video/vnd.dvb.file',
  'fvt': 'video/vnd.fvt',
  'mxu': 'video/vnd.mpegurl',
  'm4u': 'video/vnd.mpegurl',
  'pyv': 'video/vnd.ms-playready.media.pyv',
  'uvu': 'video/vnd.uvvu.mp4',
  'uvvu': 'video/vnd.uvvu.mp4',
  'viv': 'video/vnd.vivo',
  'webm': 'video/webm',
  'f4v': 'video/x-f4v',
  'fli': 'video/x-fli',
  'flv': 'video/x-flv',
  'm4v': 'video/x-m4v',
  'mkv': 'video/x-matroska',
  'mk3d': 'video/x-matroska',
  'mks': 'video/x-matroska',
  'mng': 'video/x-mng',
  'asf': 'video/x-ms-asf',
  'asx': 'video/x-ms-asf',
  'vob': 'video/x-ms-vob',
  'wm': 'video/x-ms-wm',
  'wmv': 'video/x-ms-wmv',
  'wmx': 'video/x-ms-wmx',
  'wvx': 'video/x-ms-wvx',
  'avi': 'video/x-msvideo',
  'movie': 'video/x-sgi-movie',
  'smv': 'video/x-smv',
  'ice': 'x-conference/x-cooltalk',
};
