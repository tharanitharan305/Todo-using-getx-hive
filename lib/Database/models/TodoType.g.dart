// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoTypeAdapter extends TypeAdapter<TodoType> {
  @override
  final int typeId = 6;

  @override
  TodoType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TodoType.Running;
      case 1:
        return TodoType.Walking;
      case 2:
        return TodoType.HouseHold;
      case 3:
        return TodoType.Workout;
      case 4:
        return TodoType.Officework;
      case 5:
        return TodoType.Breakfast;
      case 6:
        return TodoType.Lunch;
      case 7:
        return TodoType.Dinner;
      case 8:
        return TodoType.Pills;
      case 9:
        return TodoType.Function;
      case 10:
        return TodoType.Meeting;
      default:
        return TodoType.Running;
    }
  }

  @override
  void write(BinaryWriter writer, TodoType obj) {
    switch (obj) {
      case TodoType.Running:
        writer.writeByte(0);
        break;
      case TodoType.Walking:
        writer.writeByte(1);
        break;
      case TodoType.HouseHold:
        writer.writeByte(2);
        break;
      case TodoType.Workout:
        writer.writeByte(3);
        break;
      case TodoType.Officework:
        writer.writeByte(4);
        break;
      case TodoType.Breakfast:
        writer.writeByte(5);
        break;
      case TodoType.Lunch:
        writer.writeByte(6);
        break;
      case TodoType.Dinner:
        writer.writeByte(7);
        break;
      case TodoType.Pills:
        writer.writeByte(8);
        break;
      case TodoType.Function:
        writer.writeByte(9);
        break;
      case TodoType.Meeting:
        writer.writeByte(10);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
