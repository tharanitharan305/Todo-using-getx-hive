import 'package:hive/hive.dart';
part 'NotifyType.g.dart';

@HiveType(typeId: 7)
enum NotifyType {
  @HiveField(0)
  Slight,
  @HiveField(1)
  Normal,
  @HiveField(3)
  Hard,
}
