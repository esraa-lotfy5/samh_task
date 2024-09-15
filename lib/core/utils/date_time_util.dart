import 'package:easy_localization/easy_localization.dart';
import 'package:samh_task/generated/locale_keys.g.dart';

class DateTimeUtil {
  /// ex: 1,Jun 2023
  static String? getMonthDayYearDate(DateTime? dateTime) =>
      (dateTime != null) ? DateFormat('d, MMM y').format(dateTime) : null;

  /// ex: 16:38
  static String? getHourMinute(DateTime? dateTime) => (dateTime != null) ? DateFormat.Hm().format(dateTime) : null;

  static String? getDifferanceOnHoursAndMinutes(DateTime firstDateTime, DateTime secondDateTime) {
    final difference = secondDateTime.difference(firstDateTime);
    final hours = difference.inHours; // Total hours between the two DateTimes
    final minutes = difference.inMinutes.remainder(60); // Remaining minutes after removing hours
    return "${LocaleKeys.hour.tr(args: [hours.toString()])}:${LocaleKeys.min.tr(args: [minutes.toString()])}";
  }
}
