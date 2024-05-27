import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final int typeId = 4; // Unique identifier for this adapter

  @override
  TimeOfDay read(BinaryReader reader) {
    // Read the hour and minute components from binary and return a TimeOfDay object
    final hour = reader.readInt();
    final minute = reader.readInt();
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    // Write the hour and minute components of the TimeOfDay object to binary
    writer.writeInt(obj.hour);
    writer.writeInt(obj.minute);
  }
}
