import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../Data/Pills.dart';
import 'NotifyType.dart';
part 'Notify.g.dart';

@HiveType(typeId: 2)
class Notify {
  Notify(
      {required this.time,
      this.interval,
      this.notyfyType,
      required this.noOfDays});
  @HiveField(0)
  List<TimeOfDay> time;
  @HiveField(1)
  Duration? interval = Duration(minutes: 10);
  @HiveField(2)
  NotifyType? notyfyType = NotifyType.Slight;
  @HiveField(3)
  int noOfDays;
}
