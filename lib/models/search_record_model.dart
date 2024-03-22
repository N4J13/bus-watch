import 'package:hive_flutter/adapters.dart';
part 'search_record_model.g.dart';

@HiveType(typeId: 0)
class SearchRecordModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? origin;
  @HiveField(2)
  final String? destination;
  SearchRecordModel({
    required this.id,
    required this.origin,
    required this.destination,
  });
}
