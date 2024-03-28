import 'package:bus_proj/bloc/bus_state.dart';

import 'package:bus_proj/repositories/bus_repository.dart';
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
          vechicle: vehicleController.text);
      vehiclesData = vehicles;
      emit(const BusLoaded());
    } catch (e) {
      emit(BusError(e.toString()));
    }
  }
}
