import 'dart:io';
import 'package:bus_proj/models/model.dart';
import 'package:bus_proj/models/search_record_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static const String searchRecordBox = 'searchRecordBox';

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(SearchRecordModelAdapter());
  }

  Future<Box> openBox() async {
    return await Hive.openBox(searchRecordBox);
  }

  Future addSearchRecord(SearchRecordModel searchRecordModel) async {
    final box = await openBox();
    List<SearchRecordModel> searchRecords = await getSearchRecords();
    if (searchRecords.length.toInt() >= 2) {
      await box.deleteAt(0);
    }
    await box.add(searchRecordModel);
  }

  Future getSearchRecords() async {
    final box = await openBox();
    return box.values.cast<SearchRecordModel>().toList();
  }

  Future deleteSearchRecord(SearchRecordModel searchRecordModel) async {
    final box = await openBox();
    box.delete(searchRecordModel);
  }

  Future<void> deleteAllSearchRecord() async {
    final box = await openBox();
    await box.clear();
  }
}
