
import 'package:flutter/material.dart';

String formatTimeOfDay(TimeOfDay? time) {
  if (time == null) return '';
  final hours = time.hourOfPeriod;
  final minutes = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hours:$minutes $period';
}