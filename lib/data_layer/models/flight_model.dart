import 'package:samh_task/core/enums/flight_class_type.dart';
import 'package:samh_task/core/enums/flight_type.dart';

class FlightModel {
  String? fromCity;
  String? toCity;
  DateTime? departTime;
  DateTime? arriveTime;
  String? companyName;
  String? companyImage;
  int? price;
  DateTime? date;
  int? travellers;
  FlightClassType? classType;
  FlightType? flightType;

  FlightModel({
    this.fromCity,
    this.toCity,
    this.departTime,
    this.arriveTime,
    this.companyName,
    this.companyImage,
    this.price,
    this.date,
    this.travellers,
    this.classType,
    this.flightType,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        fromCity: json["from_city"],
        toCity: json["tom_city"],
        departTime: json["depart_time"] != null ? DateTime.parse(json["depart_time"]) : null,
        arriveTime: json["arrive_time"] != null ? DateTime.parse(json["arrive_time"]) : null,
        companyName: json["company_name"],
        companyImage: json["company_image"],
        price: json["price"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        travellers: json["travellers"],
        classType:
            json["class_type"] != null ? FlightClassType.values.firstWhere((e) => json["class_type"] == e) : null,
        flightType: json["flight_type"] != null ? FlightType.values.firstWhere((e) => json["flight_type"] == e) : null,
      );
}
