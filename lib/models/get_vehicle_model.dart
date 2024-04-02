import 'dart:convert';

import 'package:bus_proj/models/station.dart';

List<VehiclesData> vehiclesDataFromJson(String str) => List<VehiclesData>.from(
    json.decode(str).map((x) => VehiclesData.fromJson(x)));

String vehiclesDataToJson(List<VehiclesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehiclesData {
  int trip;
  List<Station> stations;

  VehiclesData({
    required this.trip,
    required this.stations,
  });

  factory VehiclesData.fromJson(Map<String, dynamic> json) => VehiclesData(
        trip: json["trip"],
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trip": trip,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
      };
}
