import 'package:easy_localization/easy_localization.dart';

class DateTimeUtil {
  // /// ex: 5:30
  // static String? getBaseTime(DateTime? dateTime) => (dateTime != null) ? DateFormat('jm').format(dateTime) : null;

  /// ex: 1,Jun 2023
  static String? getMonthDayYearDate(DateTime? dateTime) =>
      (dateTime != null) ? DateFormat('d, MMM y').format(dateTime) : null;

  // /// ex: 12  Mars 2023
  // static String? getDayMonthYearDate(DateTime? dateTime) => (dateTime != null)
  //     ? DateFormat('d MMMM y', navigatorKey.currentContext?.locale.languageCode).format(dateTime)
  //     : null;
  //
  // /// ex: 20 ramdan 1444
  // static String? getHijriDayMonthYearDate(DateTime? dateTime) =>
  //     (dateTime != null) ? HijriCalendar.fromDate(dateTime).toFormat("dd MMMM yyyy") : null;
  //
  // /// ex: 2020-02-12 23:57:02.000
  // static DateTime? getUTCDate(int year) => DateTime.utc(year);
  //
  // /// ex: Mars
  // static String? getMonth(DateTime? dateTime) =>
  //     (dateTime != null) ? DateFormat('MMMM', navigatorKey.currentContext?.locale.languageCode).format(dateTime) : null;
  //
  // /// ex: 2023
  // static String? getYear(DateTime? dateTime) => (dateTime != null) ? DateFormat('y').format(dateTime) : null;
  //
  // /// ex: Thu
  // static String? getDay(DateTime? dateTime) => (dateTime != null) ? DateFormat('E').format(dateTime) : null;
  //
  // /// ex: 20
  // static String? getDayNumber(DateTime? dateTime) => (dateTime != null) ? (dateTime).day.toString() : null;
  //
  // /// ex: 15/11/1998
  // static String? getBirthDate(DateTime? dateTime) =>
  //     (dateTime != null) ? DateFormat('dd/MM/yyyy').format(dateTime) : null;
  //
  // /// ex: 16:38
  // static String? getHourMinute(DateTime? dateTime) => (dateTime != null) ? DateFormat.Hm().format(dateTime) : null;
  //
  // /// check if first date hour is before second date hour.
  // static bool checkIsBefore(String firstDate, String secondDate) =>
  //     DateFormat.Hm().parse(firstDate).isBefore(DateFormat.Hm().parse(secondDate));
  //
  // /// check if first date hour is after second date hour.
  // static bool checkIsAfter(String firstDate, String secondDate) =>
  //     DateFormat.Hm().parse(firstDate).isAfter(DateFormat.Hm().parse(secondDate));
}
