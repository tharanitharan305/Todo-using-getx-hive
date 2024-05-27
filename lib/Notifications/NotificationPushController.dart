import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:tablet/screens/Home.dart';

class NotificationPushController {
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required TimeOfDay time,
    required int days,
  }) async {
    if (days > 1) {
      List<DateTime> dates = [scheduledTime];
      for (int i = 1; i < days; i++) {
        dates.add(scheduledTime.add(Duration(days: 1)));
      }
      for (int i = 0; i < dates.length; i++) {
        await Alarm.set(
            alarmSettings: AlarmSettings(
          loopAudio: false,
          id: Random().nextInt(1000),
          dateTime: dates[i],
          assetAudioPath: 'assets/audios/tone.mp3',
          notificationTitle: title,
          notificationBody: body,
          androidFullScreenIntent: true,
        ));
      }
    } else {
      await Alarm.set(
          alarmSettings: AlarmSettings(
              loopAudio: false,
              fadeDuration: 10,
              id: 1,
              dateTime: scheduledTime,
              assetAudioPath: 'assets/audios/tone.mp3',
              notificationTitle: title,
              notificationBody: body,
              androidFullScreenIntent: true,
              enableNotificationOnKill: true,
              volume: 0,
              vibrate: true));
    }
    Alarm.ringStream.stream.listen((_) => Home());
    Alarm.setNotificationOnAppKillContent("test", "test");
  }
}
