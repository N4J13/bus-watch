import 'package:bus_proj/bloc/bus_state.dart';
import 'package:bus_proj/repositories/bus_repository.dart';
import 'package:bus_proj/utils/extensions.dart';
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
  TimeOfDay? time;
  bool restrict = false;
  List<VehiclesData> vehiclesData = [];

  Future<void> getRoutes() async {
    emit(const BusLoading());
    try {
      final routes = await _busRepository.getRoutes(
        departure: departureController.text.slugify(),
        destination: destinationController.text.slugify(),
        restrict: !restrict,
        time: formatTimeOfDay(time),
      );
      routesData = routes;
      time = null;
      if (routes.isEmpty) {
        emit(const BusError("No routes found!"));
      } else {
        emit(const BusLoaded());
      }
    } catch (e) {
      emit(const BusError("Something Went Wrong!"));
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

  void swapStations() {
    final temp = departureController.text;
    departureController.text = destinationController.text;
    destinationController.text = temp;
  }

  void getTime(final selectedTime) {
    time = selectedTime;
    emit(BusTimeSelected(formatTimeOfDay(time)));
  }

  void toggleRestrict(bool value) {
    restrict = value;
    emit(BusRestrictSelected(restrict));
  }
}
