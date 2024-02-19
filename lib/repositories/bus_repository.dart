import 'package:bus_proj/models/model.dart';
import 'package:dio/dio.dart';


class BusRepository {
  final client = Dio();

  Future<List<RouteData>> getRoutes(
      {required String origin, required String destination}) async {
    List<RouteData> routeData = [];

    final response =
        await client.get('https://api.com/routes', queryParameters: {
      'origin': origin,
      'destination': destination,
    }); // Same as https://api.com/routes?origin=origin&destination=destination
    (response.data as List).forEach((element) {
      routeData.add(RouteData.fromJson(element));
    });
    return routeData;
  }

  Future<List<VehiclesData>> getRoutesfromVehicle(
      {required String vechicle}) async {
    List<VehiclesData> vehicleData = [];
    final response =
        await client.get('https://api.com/routes', queryParameters: {
      'vechicle': vechicle,
    }); // Same as https://api.com/routes?vechicle=vechicle
    (response.data as List).forEach((element) {
      vehicleData.add(VehiclesData.fromJson(element));
    });
    return vehicleData;
  }
}
