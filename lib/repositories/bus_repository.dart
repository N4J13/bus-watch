import 'package:bus_proj/constants/constants.dart';
import 'package:bus_proj/models/model.dart';
import 'package:dio/dio.dart';

class BusRepository {
  final client = Dio();

  Future<List<RouteData>> getRoutes(
      {required String departure, required String destination}) async {
    List<RouteData> routeData = [];
    final response = await client.get(baseUrl, queryParameters: {
      'departure': departure,
      'destination': destination,
    });
    for (var element in (response.data as List)) {
      routeData.add(RouteData.fromJson(element));
    }
    return routeData;
  }

  Future<List<VehiclesData>> getRoutesfromVehicle(
      {required String vechicle}) async {
    List<VehiclesData> vehicleData = [];
    final response = await client.get(baseUrl, queryParameters: {
      'vechicle': vechicle,
    }); // Same as https://api.com/routes?vechicle=vechicle
    for (var element in (response.data as List)) {
      vehicleData.add(VehiclesData.fromJson(element));
    }
    return vehicleData;
  }
}
