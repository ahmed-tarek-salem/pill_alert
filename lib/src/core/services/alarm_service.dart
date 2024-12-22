import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/services/encoding_decoding_id.dart';

class AlarmNotificationService {
  static final AlarmNotificationService _instance =
      AlarmNotificationService._internal();

  factory AlarmNotificationService() {
    return _instance;
  }

  AlarmNotificationService._internal();

  Future<void> init() async {
    await Alarm.init();
    checkAndroidScheduleExactAlarmPermission();
  }

  /// Schedule an Alarm
  Future<void> scheduleAlarm(
      DateTime scheduledTime, int alarmId, String title, String body) async {
    final alarmSettings = AlarmSettings(
      id: alarmId,
      dateTime: scheduledTime,
      assetAudioPath: 'assets/audios/marimba.mp3',
      loopAudio: true,
      vibrate: true,
      notificationSettings: NotificationSettings(body: body, title: title),
      androidFullScreenIntent: true,
    );

    await Alarm.set(alarmSettings: alarmSettings);
    print("Alarm set for $scheduledTime");
  }

  Future<void> stopAndSetForTomorrow(AlarmSettings settings) async {
    await Alarm.stop(settings.id);
    print("Alarm with ID ${settings.id} stopped.");
    await Alarm.set(
        alarmSettings: settings.copyWith(
      dateTime: settings.dateTime.add(const Duration(days: 1)),
    ));
    print("Alarm with ID ${settings.id} rescheduled for tomorrow.");
  }

  /// Cancel an Alarm
  Future<void> cancelAlarm(int alarmId) async {
    final result = await Alarm.stop(alarmId);
    if (result) {
      print("Alarm with ID $alarmId canceled.");
    } else {
      print("No alarm found with ID $alarmId.");
    }
  }

  /// Cancel all Alarms for a medicine

  Future<void> cancelAllAlarms(int medicineId, List<TimeOfDay> times) async {
    for (var time in times) {
      await cancelAlarm(
          EncodingAndDecodingId.encodeNotificationId(time, medicineId));
    }
  }

  /// Schedule a Daily Alarm
  Future<void> handleSetAlarm(TimeOfDay scheduledTimeOfDay, int alarmId,
      String title, String body) async {
    final now = DateTime.now();
    var scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      scheduledTimeOfDay.hour,
      scheduledTimeOfDay.minute,
    );

    // If the scheduled time is in the past, schedule for the next day
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await scheduleAlarm(scheduledTime, alarmId, title, body);
  }

  Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    print('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      print('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      print(
          'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted.');
    }
  }

  /// Check if Alarm is Active
  // Future<void> checkAlarmStatus(int alarmId) async {
  //   final isActive = await Alarm.(alarmId);
  //   print("Alarm with ID $alarmId is ${isActive ? 'active' : 'not active'}.");
  // }
}
