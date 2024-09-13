class AppConstants {
  AppConstants._();

  //languages code
  static const String langCode = 'languageCode';
  static const String enLangCode = 'en';
  static const String arLangCode = 'ar';
  static const String enCountryCode = 'US';
  static const String arCountryCode = 'SA';
  static const String arLocale = '${arLangCode}_$arCountryCode';
  static const String enLocale = '${enLangCode}_$enCountryCode';

  //sizes
  static double get kNotchHeight => 20.0;
}
