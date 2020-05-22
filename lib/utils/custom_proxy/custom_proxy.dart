import 'dart:io';
import 'package:flutter/foundation.dart';
import 'custom_proxy_http_override.dart';

/// Allows you to set and enable a proxy for your app
class CustomProxy {
  /// Initializer
  CustomProxy(
      {@required this.ipAddress, this.port, this.allowBadCertificates = false});

  /// A string representing an IP address for the proxy server
  final String ipAddress;

  /// The port number for the proxy server
  /// Can be null if port is default.
  final int port;

  /// Handel [Charles Proxy] certificate
  /// When is is set to false wont allow proxy when [Charles Proxy] [certificate] is missing.
  bool allowBadCertificates;

  /// Set isProxyEnabled to true if you want to enable proxy and vice-versa
  bool get isProxyEnabled => false;

  /// Initializer from string
  CustomProxy fromString({@required String proxy}) {
    // Check if valid
    if (proxy == null || proxy == "") {
      assert(
          false, "Proxy string passed to CustomProxy.fromString() is invalid.");
      return null;
    }

    // Build and return
    final proxyParts = proxy.split(":");
    final _ipAddress = proxyParts[0];
    final _port = proxyParts.isNotEmpty ? int.tryParse(proxyParts[1]) : null;
    return CustomProxy(
      ipAddress: _ipAddress,
      port: _port,
    );
  }

  /// Enable the proxy
  void enable() {
    HttpOverrides.global = CustomProxyHttpOverride.withProxy(toString());
  }

  /// Disable the proxy
  void disable() {
    HttpOverrides.global = null;
  }

  @override
  String toString() {
    String _proxy = ipAddress;
    if (port != null) {
      _proxy += ":$port";
    }
    return _proxy;
  }
}
