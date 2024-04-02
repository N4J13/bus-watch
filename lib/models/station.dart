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
