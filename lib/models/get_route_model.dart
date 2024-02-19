// To parse this JSON data, do
//
//     final routeData = routeDataFromJson(jsonString);

import 'dart:convert';

List<RouteData> routeDataFromJson(String str) => List<RouteData>.from(json.decode(str).map((x) => RouteData.fromJson(x)));

String routeDataToJson(List<RouteData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteData {
    int trip;
    List<StationElement> stations;

    RouteData({
        required this.trip,
        required this.stations,
    });

    factory RouteData.fromJson(Map<String, dynamic> json) => RouteData(
        trip: json["trip"],
        stations: List<StationElement>.from(json["stations"].map((x) => StationElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trip": trip,
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
    };
}

class StationElement {
    StationEnum station;
    String arrivalTime;
    String departureTime;

    StationElement({
        required this.station,
        required this.arrivalTime,
        required this.departureTime,
    });

    factory StationElement.fromJson(Map<String, dynamic> json) => StationElement(
        station: stationEnumValues.map[json["station"]]!,
        arrivalTime: json["arrivalTime"],
        departureTime: json["departureTime"],
    );

    Map<String, dynamic> toJson() => {
        "station": stationEnumValues.reverse[station],
        "arrivalTime": arrivalTime,
        "departureTime": departureTime,
    };
}

enum StationEnum {
    CHOTTANIKKARA_JN,
    ERNAKULAM_SOUTH,
    HIGH_COURT_JUNCTION,
    KALOOR
}

final stationEnumValues = EnumValues({
    "CHOTTANIKKARA JN": StationEnum.CHOTTANIKKARA_JN,
    "ERNAKULAM SOUTH": StationEnum.ERNAKULAM_SOUTH,
    "HIGH COURT JUNCTION": StationEnum.HIGH_COURT_JUNCTION,
    "KALOOR": StationEnum.KALOOR
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
