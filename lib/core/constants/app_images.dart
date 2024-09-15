class AppSvg {
  AppSvg._();

  static String get _baseUri => 'assets/images/svg';

  static String get icHome => '$_baseUri/ic_home.svg';
  static String get icSearch => '$_baseUri/ic_search.svg';
  static String get icFlight => '$_baseUri/ic_flight.svg';
  static String get icLogo => '$_baseUri/ic_logo.svg';
  static String get worldMap => '$_baseUri/world_map.svg';
  static String get icPlan => '$_baseUri/ic_plan.svg';
  static String get icConverter => '$_baseUri/ic_converter.svg';
}

class AppPng {
  AppPng._();

  static const String _baseUri = 'assets/images/png';

  static const String icBookFlightBackground = '$_baseUri/ic_book_flight_background.png';
  static const String icSearchResultBackground = '$_baseUri/ic_search_result_background.png';
}
