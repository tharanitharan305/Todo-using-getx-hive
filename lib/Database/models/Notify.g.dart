// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notify.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotifyAdapter extends TypeAdapter<Notify> {
  @override
  final int typeId = 2;

  @override
  Notify read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notify(
      time: (fields[0] as List).cast<TimeOfDay>(),
      interval: fields[1] as Duration?,
      notyfyType: fields[2] as NotifyType?,
      noOfDays: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notify obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.interval)
      ..writeByte(2)
      ..write(obj.notyfyType)
      ..writeByte(3)
      ..write(obj.noOfDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotifyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
