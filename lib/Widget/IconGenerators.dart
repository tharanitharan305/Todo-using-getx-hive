import 'package:flutter/material.dart';
import 'package:tablet/Database/models/NotifyType.dart';
import 'package:tablet/Database/models/TodoType.dart';

class IconGenerators {
  Icon GetTodoIcon(TodoType type, Color? color) {
    Icon icon;
    switch (type) {
      case TodoType.Pills:
        icon = Icon(
          Icons.medication_liquid_rounded,
          color: color,
        );
        break;
      case TodoType.Breakfast:
        icon = Icon(Icons.free_breakfast_rounded, color: color);
        break;
      case TodoType.Running:
        icon = Icon(Icons.directions_run_rounded, color: color);
        break;
      // TODO: Handle this case.
      case TodoType.Walking:
        // TODO: Handle this case.
        icon = Icon(Icons.directions_walk_rounded, color: color);
        break;
      case TodoType.HouseHold:
        // TODO: Handle this case.
        icon = Icon(Icons.dry_cleaning_rounded, color: color);
        break;
      case TodoType.Workout:
        // TODO: Handle this case.
        icon = Icon(Icons.sports_gymnastics_rounded, color: color);
        break;
      case TodoType.Officework:
        // TODO: Handle this case.
        icon = Icon(Icons.work);
        break;
      case TodoType.Lunch:
        // TODO: Handle this case.
        icon = Icon(Icons.lunch_dining_rounded, color: color);
        break;
      case TodoType.Dinner:
        // TODO: Handle this case.
        icon = Icon(Icons.dinner_dining_rounded, color: color);
        break;
      case TodoType.Function:
        // TODO: Handle this case.
        icon = Icon(Icons.celebration_rounded, color: color);
        break;
      case TodoType.Meeting:
        // TODO: Handle this case.
        icon = Icon(Icons.handshake_rounded, color: color);
        break;
      default:
        icon = Icon(Icons.today_rounded, color: color);
        break;
    }
    return icon;
  }

  Icon GetNotifyIcon(NotifyType type) {
    Icon icon;
    switch (type) {
      case NotifyType.Slight:
        // TODO: Handle this case.
        icon = Icon(Icons.volume_mute_rounded);
        break;
      case NotifyType.Normal:
        // TODO: Handle this case.
        icon = Icon(Icons.volume_down_rounded);
        break;
      case NotifyType.Hard:
        // TODO: Handle this case.
        icon = Icon(Icons.volume_up_rounded);
        break;
    }
    return icon;
  }
}
