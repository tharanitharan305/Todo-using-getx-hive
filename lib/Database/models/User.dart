import 'package:hive/hive.dart';

import '../../Data/Pills.dart';
import 'gender.dart';
part 'User.g.dart';

@HiveType(typeId: 0)
class User {
  User({
    required this.name,
    required this.age,
    required this.gender,
    this.dob,
    required this.phno,
    this.email,
    this.uid,
    this.healthScore,
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  Gender gender;
  @HiveField(3)
  DateTime? dob;
  @HiveField(4)
  String phno;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? uid;
  @HiveField(7)
  int? healthScore = 0;
}
