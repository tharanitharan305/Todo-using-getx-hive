import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
part 'TodoType.g.dart';

@HiveType(typeId: 6)
enum TodoType {
  @HiveField(0)
  Running,
  @HiveField(1)
  Walking,
  @HiveField(2)
  HouseHold,
  @HiveField(3)
  Workout,
  @HiveField(4)
  Officework,
  @HiveField(5)
  Breakfast,
  @HiveField(6)
  Lunch,
  @HiveField(7)
  Dinner,
  @HiveField(8)
  Pills,
  @HiveField(9)
  Function,
  @HiveField(10)
  Meeting
}
