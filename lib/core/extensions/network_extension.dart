// ignore_for_file: constant_identifier_names

enum NetworkRoute {
  BASE_URL,
  TIMEZONE_URL,
}

extension NetworkRouteExtension on NetworkRoute {
  String? get rawValue {
    switch (this) {
      case NetworkRoute.BASE_URL:
        return 'http://worldtimeapi.org/api';
      case NetworkRoute.TIMEZONE_URL:
        return "/timezone";
      default:
        null;
    }
    return null;
  }
}
