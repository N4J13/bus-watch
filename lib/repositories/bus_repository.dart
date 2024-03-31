import 'package:bus_proj/constants/constants.dart';
import 'package:bus_proj/models/model.dart';
import 'package:dio/dio.dart';

class BusRepository {
  final client = Dio();

  Future<List<RouteData>> getRoutes({
    required String departure,
    required String destination,
    required bool restrict,
    String? time,
  }) async {
    List<RouteData> routeData = [];
    Map<String, dynamic> queryParams = {
      'departure': departure,
      'destination': destination,
      'restrict': restrict,
    };
    if (time != null && time.isNotEmpty) {
      queryParams['time'] = time;
    }
    final response = await client.get(baseUrl, queryParameters: queryParams);
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
