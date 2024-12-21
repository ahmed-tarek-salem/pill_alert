import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum HiveBoxesNames {
  medicines,
}

class LocalStorage {
  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();
  factory LocalStorage() => instance;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TimeOfDayAdapter());
    Hive.registerAdapter(TimeOfDayListAdapter());
    await openMedicinesBox();
  }

  late final Box<List<dynamic>?> storedMedicines;

  Future<void> openMedicinesBox() async {
    storedMedicines =
        await Hive.openBox<List<dynamic>?>(HiveBoxesNames.medicines.name);
  }

  Future<void> addMedicineSchedule(int id, List<TimeOfDay>? times) async {
    if (times == null) return;
    await storedMedicines.put(id, times);
  }

  List<TimeOfDay>? getMedicineSchedule(int id) {
    var retrievedList = storedMedicines.get(id); // Get as dynamic
    print(retrievedList);
    if (retrievedList is List) {
      return retrievedList.cast<TimeOfDay>(); // Explicitly cast
    }
    return null;
  }

  Future<void> deleteMedicineSchedule(int id) async {
    await storedMedicines.delete(id);
  }
}

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final typeId = 0;

  @override
  TimeOfDay read(BinaryReader reader) {
    return TimeOfDay(hour: reader.readInt(), minute: reader.readInt());
  }

  @override
  void write(BinaryWriter writer, TimeOfDay value) {
    writer.writeInt(value.hour);
    writer.writeInt(value.minute);
  }
}

class TimeOfDayListAdapter extends TypeAdapter<List<TimeOfDay>> {
  @override
  final int typeId = 1; // Use a different typeId than TimeOfDayAdapter

  @override
  List<TimeOfDay> read(BinaryReader reader) {
    final length = reader.readUint32();
    final times = <TimeOfDay>[];
    for (var i = 0; i < length; i++) {
      times.add(TimeOfDay(hour: reader.readInt(), minute: reader.readInt()));
    }
    return times;
  }

  @override
  void write(BinaryWriter writer, List<TimeOfDay> obj) {
    writer.writeUint32(obj.length);
    for (final time in obj) {
      writer.writeInt(time.hour);
      writer.writeInt(time.minute);
    }
  }
}
