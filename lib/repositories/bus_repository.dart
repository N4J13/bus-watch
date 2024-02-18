import 'package:dio/dio.dart';

class BusRepository {
  final client = Dio();

  Future<List> getRoutes({required String origin, required String destination}) async {
    final response = await client.get('https://api.com/routes' , queryParameters: {
      'origin': origin,
      'destination': destination,
    }); // Same as https://api.com/routes?origin=origin&destination=destination
    return response.data;
  }

  Future<List> getRoutesfromVehicle({required String vechicle}) async {
    final response = await client.get('https://api.com/routes' , queryParameters: {
      'vechicle': vechicle,
    }); // Same as https://api.com/routes?vechicle=vechicle
    return response.data;
  }
}
