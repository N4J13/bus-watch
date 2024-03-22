// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchRecordModelAdapter extends TypeAdapter<SearchRecordModel> {
  @override
  final int typeId = 0;

  @override
  SearchRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchRecordModel(
      id: fields[0] as int?,
      origin: fields[1] as String?,
      destination: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchRecordModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.origin)
      ..writeByte(2)
      ..write(obj.destination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
