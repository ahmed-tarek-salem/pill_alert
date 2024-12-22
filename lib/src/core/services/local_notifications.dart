// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;

// class LocalNotificationService {
//   static final LocalNotificationService _instance =
//       LocalNotificationService._internal();

//   factory LocalNotificationService() {
//     return _instance;
//   }

//   LocalNotificationService._internal();

//   static const channelId = '1';
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings(
//             '@mipmap/ic_launcher'); // Replace with your app icon

//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       defaultPresentAlert: true,
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

//     await _createNotificationChannel(); // Create the notification channel
//   }

//   Future<void> _createNotificationChannel() async {
//     const AndroidNotificationChannel androidNotificationChannel =
//         AndroidNotificationChannel(
//       channelId,
//       'Channel Name',
//       description: 'Channel Description',
//       importance: Importance.max,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(androidNotificationChannel);
//   }

//   Future<void> scheduleAlarm(DateTime scheduledTime, int notificationId,
//       String title, String body) async {
//     final now = DateTime.now();
//     if (scheduledTime.isBefore(now)) {
//       print("Scheduled time is in the past. Notification will not be shown.");
//       return; // Don't schedule if the time is in the past
//     }

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         notificationId,
//         title,
//         body,
//         tz.TZDateTime.from(scheduledTime, tz.local), // Use local timezone
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             channelId,
//             'Channel Name',
//             channelDescription: 'Channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker',
//           ),
//           iOS: DarwinNotificationDetails(), // iOS-specific details if needed
//         ),
//         androidScheduleMode: AndroidScheduleMode
//             .exactAllowWhileIdle, // Allow notification while idle
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }

//   Future<void> cancelAlarm(int notificationId) async {
//     await flutterLocalNotificationsPlugin.cancel(notificationId);
//   }

//   //Handle notification tap
//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // Add your logic here for handling notification taps when the app is in the foreground
//     print('Received local notification: $id, $title, $body, $payload');
//   }

//   Future<void> scheduleDailyAlarm(TimeOfDay scheduledTimeOfDay,
//       int notificationId, String title, String body) async {
//     final now = tz.TZDateTime.now(tz.local); // Use local timezone
//     var scheduledTime = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       scheduledTimeOfDay.hour,
//       scheduledTimeOfDay.minute,
//     );

//     // If scheduled time is in the past, schedule for the next day
//     if (scheduledTime.isBefore(now)) {
//       final tomorrow = now.add(Duration(days: 1));
//       scheduledTime = tz.TZDateTime(
//         tz.local,
//         tomorrow.year,
//         tomorrow.month,
//         tomorrow.day,
//         scheduledTimeOfDay.hour,
//         scheduledTimeOfDay.minute,
//       );
//     }

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         notificationId,
//         title,
//         body,
//         scheduledTime,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             channelId,
//             'Channel Name',
//             channelDescription: 'Channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//           ),
//           iOS: DarwinNotificationDetails(),
//         ),
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time); // Repeat daily
//   }
// }

// int encodeNotificationId(TimeOfDay timeOfDay, int medicineId) {
//   // Ensure medicineId is within the valid range
//   if (medicineId < 0 || medicineId > 10) {
//     throw ArgumentError("medicineId must be between 0 and 10");
//   }

//   return timeOfDay.hour * 100 + timeOfDay.minute * 10 + medicineId;
// }

// void decodeNotificationId(
//     int notificationId, Function(TimeOfDay, int) callback) {
//   if (notificationId < 0) {
//     throw ArgumentError("notificationId must be a non-negative integer.");
//   }

//   int medicineId = notificationId % 10;
//   int minutes = (notificationId ~/ 10) % 10;
//   int hour = notificationId ~/ 100;

//   if (medicineId < 0 || medicineId > 10) {
//     throw Exception("Invalid notificationId: Cannot decode medicineId");
//   }

//   TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minutes);
//   callback(timeOfDay, medicineId);
// }
