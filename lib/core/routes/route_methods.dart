import 'package:samh_task/core/constants/app_globals.dart';
import 'package:samh_task/core/routes/routes_names.dart';

class RouteMethods {
  static void navigateToTabsScreen() {
    AppGlobals.navigatorKey.currentState!.pushNamed(RoutesNames.tabsScreen);
  }

  static void navigateToSearchResultsScreen() {
    AppGlobals.navigatorKey.currentState!.pushNamed(RoutesNames.searchResults);
  }
}
