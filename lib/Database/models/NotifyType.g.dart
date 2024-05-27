// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotifyType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotifyTypeAdapter extends TypeAdapter<NotifyType> {
  @override
  final int typeId = 7;

  @override
  NotifyType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NotifyType.Slight;
      case 1:
        return NotifyType.Normal;
      case 3:
        return NotifyType.Hard;
      default:
        return NotifyType.Slight;
    }
  }

  @override
  void write(BinaryWriter writer, NotifyType obj) {
    switch (obj) {
      case NotifyType.Slight:
        writer.writeByte(0);
        break;
      case NotifyType.Normal:
        writer.writeByte(1);
        break;
      case NotifyType.Hard:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotifyTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
