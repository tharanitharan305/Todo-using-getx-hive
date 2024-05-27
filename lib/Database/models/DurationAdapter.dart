import 'package:hive/hive.dart';

// Hive adapter for Duration class
class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final int typeId = 5; // Unique identifier for this adapter

  @override
  Duration read(BinaryReader reader) {
    // Read the microseconds from binary and return a Duration object
    return Duration(microseconds: reader.readInt());
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    // Write the microseconds of the Duration object to binary
    writer.writeInt(obj.inMicroseconds);
  }
}
