import 'package:bus_proj/bloc/bus_state.dart';

import 'package:bus_proj/repositories/bus_repository.dart';
import 'package:bus_proj/services/hive_service.dart';
import 'package:bus_proj/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/model.dart';

class BusBloc extends Cubit<BusState> {
  BusBloc() : super(const BusInitial());

  final BusRepository _busRepository = BusRepository();
  TextEditingController departureController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<RouteData> routesData = [];
  List<VehiclesData> vehiclesData = [];
  final HiveService hiveService = HiveService();
  List list = [];

  Future<void> getRoutes() async {
    emit(const BusLoading());
    try {
      final routes = await _busRepository.getRoutes(
        departure: HelperFunction.convertStationName(departureController.text),
        destination:
            HelperFunction.convertStationName(destinationController.text),
      );
      routesData = routes;
      if (routes.isEmpty) {
        emit(const BusError("No routes found!"));
      } else {
        final departure = departureController.text;
        final destination = destinationController.text;
        final searchRecord =
            SearchRecordModel(departure: departure, destination: destination);
        await hiveService.addSearchRecord(searchRecord);
        list.add(searchRecord);

        emit(const BusLoaded());
      }
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }

  Future<void> getRoutesfromVehicle() async {
    emit(const BusLoading());
    try {
      final vehicles = await _busRepository.getRoutesfromVehicle(
          vehicle: vehicleController.text);
      vehiclesData = vehicles;
      emit(const BusLoaded());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }

  Future getRecentSearch() async {
    emit(const BusLoading());
    try {
      final records = await hiveService.getSearchRecords();
      list = records;

      emit(const BusLoaded());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }

  Future clearRecentSearch() async {
    try {
      await hiveService.deleteAllSearchRecord();
      list.clear();

      emit(const BusRemove());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }
}
