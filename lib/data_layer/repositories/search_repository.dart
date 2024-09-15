import 'package:samh_task/core/constants/app_globals.dart';
import 'package:samh_task/data_layer/models/flight_model.dart';
import 'package:samh_task/data_layer/services/search_service.dart';
import 'package:samh_task/infrastructure/response_wrapper.dart';

abstract class SearchResultRepository {
  Future<ResponseWrapper<List<FlightModel>?>> getFlights();
}

class SearchResultRepositoryImplementation extends SearchResultRepository {
  final _searchResultService = AppGlobals.locator<SearchResultService>();

  /// Get flights list
  @override
  Future<ResponseWrapper<List<FlightModel>?>> getFlights() async {
    final response = await _searchResultService.getFlights();
    return response;
  }
}
