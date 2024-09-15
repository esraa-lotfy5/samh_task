import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/enums/flight_class_type.dart';
import 'package:samh_task/core/enums/flight_type.dart';
import 'package:samh_task/core/utils/date_time_util.dart';
import 'package:samh_task/data_layer/mocking_data.dart';
import 'package:samh_task/data_layer/models/flight_model.dart';

class SearchResultsViewModel {
  static final searchListProvider = StateNotifierProvider<SearchResultsStateNotifier, AsyncValue<List<FlightModel?>>?>(
      (_) => SearchResultsStateNotifier(null));
}

class SearchResultsStateNotifier extends StateNotifier<AsyncValue<List<FlightModel>>?> {
  SearchResultsStateNotifier(super.key);

  Future<void> getFlights({
    required String fromCity,
    required String toCity,
    required FlightType flightType,
    required FlightClassType flightClassType,
    required DateTime date,
    required int travellers,
  }) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));

    /// I will call repository if i have the apis but here i will set it manual
    //await AppGlobals.locator<SearchResultRepository>().getFlights();
    final list = MockingData.flightLists
        .where((element) => (element.flightType == flightType &&
            element.classType == flightClassType &&
            DateTimeUtil.getMonthDayYearDate(element.date) == DateTimeUtil.getMonthDayYearDate(date) &&
            element.fromCity == fromCity &&
            element.toCity == toCity &&
            element.travellers == travellers))
        .toList();

    state = AsyncValue.data(list);
  }
}
