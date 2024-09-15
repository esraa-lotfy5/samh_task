import 'package:flutter/material.dart';
import 'package:samh_task/core/routes/routes_names.dart';
import 'package:samh_task/presentation_layer/screens/search_results/search_results_screen.dart';
import 'package:samh_task/presentation_layer/screens/tabs/tabs_screen.dart';
import 'package:samh_task/presentation_layer/screens/unknown_route_screen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutesNames.tabsScreen:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      case RoutesNames.searchResults:
        return MaterialPageRoute(builder: (_) => const SearchResultsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownRouteScreen());
    }
  }
}
