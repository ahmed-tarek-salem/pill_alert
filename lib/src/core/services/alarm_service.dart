import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pill_alert/src/core/services/encoding_decoding_id.dart';

class AlarmNotificationService {
  static final AlarmNotificationService _instance =
      AlarmNotificationService._internal();

  factory AlarmNotificationService() {
    return _instance;
  }

  AlarmNotificationService._internal();

  /// Initialize the Alarm Service
  Future<void> init() async {
    await Alarm.init(); // Initialize the alarm package
    // Listen for the alarm ring event to reschedule the next day
    Alarm.ringStream.stream.listen((settings) async {
      print("Alarm with ID ${settings.id} rang. Rescheduling for tomorrow.");
      final tomorrow = settings.dateTime.add(const Duration(days: 1));
      await scheduleAlarm(
          tomorrow,
          settings.id,
          settings.notificationSettings.title,
          settings.notificationSettings.body);
    });
    checkAndroidScheduleExactAlarmPermission();
  }

  /// Schedule an Alarm
  Future<void> scheduleAlarm(
      DateTime scheduledTime, int alarmId, String title, String body) async {
    final now = DateTime.now();
    if (scheduledTime.isBefore(now)) {
      print("Scheduled time is in the past. Alarm will not be scheduled.");
      return;
    }

    // Create and set the alarm
    final alarmSettings = AlarmSettings(
      id: alarmId,
      dateTime: scheduledTime,
      assetAudioPath: 'assets/audios/marimba.mp3', // Add your alarm sound here
      loopAudio: true,
      vibrate: true,
      fadeDuration: 5.0, // Optional fade duration in seconds
      notificationSettings:
          NotificationSettings(body: body, title: title, stopButton: "Stop"),
    );

    await Alarm.set(alarmSettings: alarmSettings);
    print("Alarm set for $scheduledTime");
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
  Future<void> scheduleDailyAlarm(TimeOfDay scheduledTimeOfDay, int alarmId,
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
