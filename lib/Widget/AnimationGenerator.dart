import 'package:flutter/material.dart';
import 'package:tablet/Database/models/TodoType.dart';

class AnimationGenerators {
  String GenerateAnimation({required TodoType todoType}) {
    String url;
    switch (todoType) {
      case TodoType.Running:
        // TODO: Handle this case.
        url = 'assets/animations/running.json';
        break;
      case TodoType.Walking:
        // TODO: Handle this case.
        url = 'assets/animations/walking.json';
        break;
      case TodoType.HouseHold:
        // TODO: Handle this case.
        url = 'assets/animations/house.json';
        break;
      case TodoType.Workout:
        // TODO: Handle this case.
        url = 'assets/animations/workout.json';
        break;
      case TodoType.Officework:
        // TODO: Handle this case.
        url = 'assets/animations/office2.json';
        break;
      case TodoType.Breakfast:
        // TODO: Handle this case.
        url = 'assets/animations/eat.json';
        break;
      case TodoType.Lunch:
        // TODO: Handle this case.
        url = 'assets/animations/eat.json';
        break;
      case TodoType.Dinner:
        // TODO: Handle this case.
        url = 'assets/animations/eat.json';
        break;
      case TodoType.Pills:
        // TODO: Handle this case.
        url = 'assets/animations/pills.json';
        break;
      case TodoType.Function:
        // TODO: Handle this case.
        url = 'assets/animations/function.json';
        break;
      case TodoType.Meeting:
        // TODO: Handle this case.
        url = 'assets/animations/meeting.json';
        break;
    }
    return url;
  }
}
