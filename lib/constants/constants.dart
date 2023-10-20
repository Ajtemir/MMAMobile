class Constants {
  static const int port = 80;
  static const String host = 'localhost';
  static const String scheme = 'http';
  static const String delimeter = '://';
  static const String colon = ':';
  static final String baseUrl = scheme + delimeter + host + colon + port.toString();
  static var addPartToBaseUrl = (String part) => baseUrl + part;
  static var addPathToBaseUrl = (path, {Map<String, dynamic>? queryParameters}) => Uri(
    scheme: scheme,
    host: host,
    port: port,
    path: path,
    queryParameters: queryParameters,
  );
}