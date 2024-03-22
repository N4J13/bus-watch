import 'dart:io';

import 'package:bus_proj/models/model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // Create a Box with the name 'searchRecordBox' ✅
  static const String searchRecordBox = 'searchRecordBox';

  // Create a function to initialize the box

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(HiveModelAdapter());
  }

  // Create a function for open the box and return it
  Future<Box> openBox() async {
    await Hive.openBox(searchRecordBox);
    return await Hive.openBox(searchRecordBox);
  }

  // Create a function to add a record to the box
  Future addSearchRecord(HiveModel searchRecordModel) async {
    final box = await Hive.openBox(searchRecordBox);
    box.add(searchRecordModel);
  }

  // Create a function to get all records from the box and return them
  Future getBox() async {
    final box = await Hive.openBox(searchRecordBox);
    box.get(box.values.toList());
    return box.values.toList();
  }

  // Create a function to delete a record from the box
  Future deleteSearchRecord(HiveModel searchRecordModel) async {
    final box = await Hive.openBox(searchRecordBox);
    box.delete(searchRecordModel);
  }

  // Create a function to delete all records from the box
  Future<void> deleteAllSearchRecord() async {
    final box = await Hive.openBox(searchRecordBox);
    await box.clear();
  }
}
