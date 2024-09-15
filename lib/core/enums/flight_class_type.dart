import 'package:easy_localization/easy_localization.dart';
import 'package:samh_task/generated/locale_keys.g.dart';

enum FlightClassType {
  economy,
  business,
  first;

  static String localizedClass(FlightClassType type) {
    switch (type) {
      case FlightClassType.economy:
        return LocaleKeys.economy.tr();
      case FlightClassType.business:
        return LocaleKeys.business.tr();
      case FlightClassType.first:
        return LocaleKeys.first.tr();
    }
  }
}
