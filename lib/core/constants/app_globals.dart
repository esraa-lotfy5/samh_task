import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:samh_task/data_layer/repositories/search_repository.dart';
import 'package:samh_task/data_layer/services/search_service.dart';
import 'package:samh_task/infrastructure/network_manager.dart';

class AppGlobals {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static GetIt locator = GetIt.instance;

  static void registerDependencies() {
    AppGlobals.locator.registerLazySingleton<NetworkManager>(() => NetworkManagerImpl());
    AppGlobals.locator.registerLazySingleton<SearchResultService>(() => SearchResultServiceImplementation());
    AppGlobals.locator.registerLazySingleton<SearchResultRepository>(() => SearchResultRepositoryImplementation());
  }
}
