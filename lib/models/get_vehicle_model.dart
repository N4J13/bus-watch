// To parse this JSON data, do
//
//     final vehiclesData = vehiclesDataFromJson(jsonString);

import 'dart:convert';

List<VehiclesData> vehiclesDataFromJson(String str) => List<VehiclesData>.from(json.decode(str).map((x) => VehiclesData.fromJson(x)));

String vehiclesDataToJson(List<VehiclesData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehiclesData {
    String vehicleNumber;
    int trip;
    List<Station> stations;

    VehiclesData({
        required this.vehicleNumber,
        required this.trip,
        required this.stations,
    });

    factory VehiclesData.fromJson(Map<String, dynamic> json) => VehiclesData(
        vehicleNumber: json["vehicle_number"],
        trip: json["trip"],
        stations: List<Station>.from(json["stations"].map((x) => Station.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vehicle_number": vehicleNumber,
        "trip": trip,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
    };
}

class Station {
    String station;
    String arrivalTime;
    String departureTime;

    Station({
        required this.station,
        required this.arrivalTime,
        required this.departureTime,
    });

    factory Station.fromJson(Map<String, dynamic> json) => Station(
        station: json["station"],
        arrivalTime: json["arrivalTime"],
        departureTime: json["departureTime"],
    );

    Map<String, dynamic> toJson() => {
        "station": station,
        "arrivalTime": arrivalTime,
        "departureTime": departureTime,
    };
}
