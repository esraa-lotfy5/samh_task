import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel {
  static final tabsIndexProvider = StateProvider<int>((_) => 0);
  static final fromBookingProvider = StateProvider<String?>((_) => null);
  static final toBookingProvider = StateProvider<String?>((_) => null);
  static final dateBookingProvider = StateProvider<DateTime?>((_) => DateTime.now());
}
