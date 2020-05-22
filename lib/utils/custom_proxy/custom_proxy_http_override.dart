import 'dart:io';

/// This class overrides the global proxy settings.
class CustomProxyHttpOverride extends HttpOverrides {
  /// Initializer
  CustomProxyHttpOverride.withProxy(
    this.proxyString, {
    this.allowBadCertificates = false,
  });

  /// The entire proxy server
  /// Format: "localhost:8888"
  final String proxyString;

  /// Handel [Charles Proxy] certificate
  /// When is is set to false wont allow proxy when [Charles Proxy] [certificate] is missing.
  final bool allowBadCertificates;

  /// Override HTTP client creation
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        assert(proxyString != null && proxyString.isNotEmpty,
            'You must set a valid proxy if you enable it!');
        return "PROXY $proxyString;";
      }
      ..badCertificateCallback = allowBadCertificates
          ? (X509Certificate cert, String host, int port) => true
          : null;
  }
}
