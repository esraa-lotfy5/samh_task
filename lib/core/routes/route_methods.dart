import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_globals.dart';
import 'package:samh_task/core/routes/routes_names.dart';

class RouteMethods {
  static void navigateToTabsScreen() {
    Navigator.of(AppGlobals.navigatorKey.currentContext!).pushNamed(RoutesNames.searchResults);
  }

  static void navigateToSearchResultsScreen() {
    Navigator.of(AppGlobals.navigatorKey.currentContext!).pushNamed(RoutesNames.searchResults);
  }
}
