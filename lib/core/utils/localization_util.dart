import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/managers/shared_pref_manager.dart';

class LocalizationUtil {
  static late Locale locale;
  LocalizationUtil._();
  static void init() => _setLocale(getLanguage());

  static const String path = 'assets/translations';
  static const Locale fallbackLocale = Locale(AppConstants.arLangCode, AppConstants.arCountryCode);
  static const List<Locale> supportedLocales = [
    Locale(AppConstants.enLangCode, AppConstants.enCountryCode),
    Locale(AppConstants.arLangCode, AppConstants.arCountryCode),
  ];

  static void _setLocale(String langCode) {
    switch (langCode) {
      case AppConstants.arLangCode:
        locale = const Locale(AppConstants.arLangCode, AppConstants.arCountryCode);
      case AppConstants.enLangCode:
        locale = const Locale(AppConstants.enLangCode, AppConstants.enCountryCode);
    }
  }

  static String getLanguage() {
    final langCode = SharedPreferencesManager.getData(key: AppConstants.langCode) ?? fallbackLocale.languageCode;
    _setLocale(langCode);
    return langCode;
  }

  static void setLanguageCode(WidgetRef ref, String langCode) {
    SharedPreferencesManager.saveData(key: AppConstants.langCode, value: langCode);
    _setLocale(langCode);
    ref.read(LocalizationViewModel.localeNotifier.notifier).updateLocale(locale);
  }
}

class LocalizationViewModel {
  static final localeNotifier = StateNotifierProvider<LocaleNotifier, Locale>((ref) => LocaleNotifier());
}

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(LocalizationUtil.fallbackLocale);
  void updateLocale(Locale locale) => state = locale;
}
