import 'dart:convert';

import 'package:bus_proj/models/station.dart';

List<RouteData> routeDataFromJson(String str) =>
    List<RouteData>.from(json.decode(str).map((x) => RouteData.fromJson(x)));

String routeDataToJson(List<RouteData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteData {
  int trip;
  String vehicleNumber;
  List<Station> stations;

  RouteData({
    required this.trip,
    required this.vehicleNumber,
    required this.stations,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
        trip: json["trip"],
        vehicleNumber: json["vehicle_number"],
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trip": trip,
        "vehicle_number": vehicleNumber,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
      };
}


