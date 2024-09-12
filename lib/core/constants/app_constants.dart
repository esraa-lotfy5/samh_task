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

  //shared preferences keys
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String currentUserId = 'id';
  static const String iOSClientId = '893938853647-uu5l546ra176do0udsj50t2u1r7csbj0.apps.googleusercontent.com';
}
