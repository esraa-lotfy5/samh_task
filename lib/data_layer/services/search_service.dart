import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/api_endpoints.dart';
import 'package:samh_task/core/constants/app_globals.dart';
import 'package:samh_task/data_layer/models/flight_model.dart';
import 'package:samh_task/infrastructure/network_manager.dart';
import 'package:samh_task/infrastructure/response_wrapper.dart';

abstract class SearchResultService {
  Future<ResponseWrapper<List<FlightModel>?>> getFlights();
}

class SearchResultServiceImplementation extends SearchResultService {
  final _networkManager = AppGlobals.locator<NetworkManager>();

  @override
  Future<ResponseWrapper<List<FlightModel>?>> getFlights() async {
    final response = await _networkManager.get(
      ApiEndPoints.flights,
      fromJsonBuilder: (data) {
        debugPrint(data.toString());
        return List.generate(data.length, (index) => FlightModel.fromJson(data[index]));
      },
    );
    return response;
  }
}
