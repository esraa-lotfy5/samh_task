import 'package:samh_task/core/enums/flight_class_type.dart';
import 'package:samh_task/core/enums/flight_type.dart';
import 'package:samh_task/data_layer/models/flight_model.dart';

class MockingData {
  static final flightLists = [
    FlightModel(
      fromCity: "London",
      toCity: "Riyadh",
      date: DateTime.parse("2024-10-15T00:00:00.000+02:00").toLocal(),
      departTime: DateTime.parse("2024-10-15T10:15:00.000+02:00").toLocal(),
      arriveTime: DateTime.parse("2024-10-15T12:15:00.000+02:00").toLocal(),
      companyName: "IndiGo",
      companyImage: "https://seekvectorlogo.com/wp-content/uploads/2022/01/indigo-vector-logo-2022.png",
      price: 125,
      travellers: 2,
      classType: FlightClassType.first,
      flightType: FlightType.oneWay,
    ),
    FlightModel(
      fromCity: "London",
      toCity: "Riyadh",
      date: DateTime.parse("2024-10-15T00:00:00.000+02:00").toLocal(),
      departTime: DateTime.parse("2024-10-15T04:00:00.000+02:00").toLocal(),
      arriveTime: DateTime.parse("2024-10-15T06:30:00.000+02:00").toLocal(),
      companyName: "IndiGo",
      companyImage: "https://seekvectorlogo.com/wp-content/uploads/2022/01/indigo-vector-logo-2022.png",
      price: 500,
      travellers: 2,
      classType: FlightClassType.first,
      flightType: FlightType.oneWay,
    ),
    FlightModel(
      fromCity: "London",
      toCity: "Riyadh",
      date: DateTime.parse("2024-10-15T00:00:00.000+02:00").toLocal(),
      departTime: DateTime.parse("2024-10-15T07:00:00.000+02:00").toLocal(),
      arriveTime: DateTime.parse("2024-10-15T08:45:00.000+02:00").toLocal(),
      companyName: "IndiGo",
      companyImage: "https://seekvectorlogo.com/wp-content/uploads/2022/01/indigo-vector-logo-2022.png",
      price: 320,
      travellers: 2,
      classType: FlightClassType.first,
      flightType: FlightType.roundTrip,
    ),
  ];
}
