import 'package:hive_flutter/adapters.dart';
part 'search_record_model.g.dart';

@HiveType(typeId: 0)
class SearchRecordModel {
  @HiveField(1)
  final String? departure;
  @HiveField(2)
  final String? destination;
  SearchRecordModel({
    required this.departure,
    required this.destination,
  });
}
