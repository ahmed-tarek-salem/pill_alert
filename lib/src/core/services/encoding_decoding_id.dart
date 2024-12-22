import 'package:flutter/material.dart';

class EncodingAndDecodingId {
  static int encodeNotificationId(TimeOfDay timeOfDay, int medicineId) {
    // Ensure medicineId is within the valid range
    if (medicineId < 0 || medicineId > 10) {
      throw ArgumentError("medicineId must be between 0 and 10");
    }

    return timeOfDay.hour * 100 + timeOfDay.minute * 10 + medicineId;
  }

  static void decodeNotificationId(
      int notificationId, Function(TimeOfDay, int) callback) {
    if (notificationId < 0) {
      throw ArgumentError("notificationId must be a non-negative integer.");
    }

    int medicineId = notificationId % 10;
    int minutes = (notificationId ~/ 10) % 10;
    int hour = notificationId ~/ 100;

    if (medicineId < 0 || medicineId > 10) {
      throw Exception("Invalid notificationId: Cannot decode medicineId");
    }

    TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minutes);
    callback(timeOfDay, medicineId);
  }
}
