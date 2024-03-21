import 'package:bus_proj/bloc/bus_state.dart';

import 'package:bus_proj/repositories/bus_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/model.dart';

class BusBloc extends Cubit<BusState> {
  BusBloc() : super(const BusInitial());

  final BusRepository _busRepository = BusRepository();
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<RouteData> routesData = [];
  List<VehiclesData> vehiclesData = [];

  // TODO : Add nulable parameter origin and destination to getRoutes function and if its not null you should pass that value to the getRoutes function from the BusRepository
  Future<void> getRoutes() async {
    if (formKey.currentState!.validate()) return;
    emit(const BusLoading());
    try {
      final routes = await _busRepository.getRoutes(
          origin: originController.text,
          destination: destinationController.text);
      routesData = routes;
      emit(const BusLoaded());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }

  Future<void> getRoutesfromVehicle() async {
    emit(const BusLoading());
    try {
      final vehicles = await _busRepository.getRoutesfromVehicle(
          vechicle: vehicleController.text);
      vehiclesData = vehicles;
      emit(const BusLoaded());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }
}
