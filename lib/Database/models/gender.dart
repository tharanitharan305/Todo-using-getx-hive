import 'package:hive/hive.dart';
part 'gender.g.dart';

@HiveType(typeId: 3)
enum Gender {
  @HiveField(0)
  Male,
  @HiveField(1)
  Female,
  @HiveField(2)
  Others
}
