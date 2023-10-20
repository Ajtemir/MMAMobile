class Constants {
  static const int port = 80;
  static const String host = 'localhost';
  static const String scheme = 'http';
  static const String delimeter = '://';
  static const String colon = ':';
  static final String baseUrl = scheme + delimeter + host + colon + port.toString();
}