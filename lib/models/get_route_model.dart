import 'dart:convert';

List<RouteData> routeDataFromJson(String str) =>
    List<RouteData>.from(json.decode(str).map((x) => RouteData.fromJson(x)));

String routeDataToJson(List<RouteData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteData {
  int trip;
  List<StationElement> stations;

  RouteData({
    required this.trip,
    required this.stations,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
        trip: json["trip"],
        stations: List<StationElement>.from(
            json["stations"].map((x) => StationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trip": trip,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
      };
}

class StationElement {
  String station;
  String arrivalTime;
  String departureTime;

  StationElement({
    required this.station,
    required this.arrivalTime,
    required this.departureTime,
  });

  factory StationElement.fromJson(Map<String, dynamic> json) => StationElement(
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
