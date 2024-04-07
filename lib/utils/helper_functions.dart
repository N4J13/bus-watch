import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String formatTimeOfDay(TimeOfDay? time) {
  if (time == null) return '';
  final hours = time.hourOfPeriod;
  final minutes = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hours:$minutes $period';
}

Future<List<String>> loadStations() async {
  final String data =
      await rootBundle.loadString('assets/json/unique_stations.json');
  final List<dynamic> jsonList = jsonDecode(data);
  final List<String> stations = List<String>.from(jsonList);
  return stations;
}
