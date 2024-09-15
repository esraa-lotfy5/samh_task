import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/enums/flight_class_type.dart';

class HomeViewModel {
  static final tabsIndexProvider = StateProvider<int>((_) => 0);
  static final fromBookingProvider = StateProvider<String?>((_) => null);
  static final toBookingProvider = StateProvider<String?>((_) => null);
  static final dateBookingProvider = StateProvider<DateTime?>((_) => DateTime.now());
  static final passengerNumberBookingProvider = StateProvider<int>((_) => 1);
  static final classBookingProvider = StateProvider<FlightClassType?>((_) => null);
}
