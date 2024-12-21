import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/services/local_storage.dart';

class SavedMedicinesController extends ChangeNotifier {
  ///Medicine id to list of alerting times
  Map<int, List<TimeOfDay>?> medicineTimes = {};
  final LocalStorage localStorage = LocalStorage();

  fetchSavedMedicines() {
    localStorage.storedMedicines.keys.forEach((key) {
      final times = LocalStorage().getMedicineSchedule(key);
      if (times != null) {
        medicineTimes[key] = times;
      }
    });
    notifyListeners();
  }

  void addSavedMedicine(int medicineId, TimeOfDay time) {
    final current = medicineTimes[medicineId];
    if (current == null) {
      medicineTimes[medicineId] = [time];
    } else {
      medicineTimes[medicineId] = [time, ...current];
    }
    notifyListeners();
  }

  void removeMedicineTime(int medicineId, TimeOfDay time) {
    medicineTimes[medicineId]?.remove(time);
    notifyListeners();
  }

  TimeOfDay? getMedicineTime(int medicineId, int index) {
    return medicineTimes[medicineId]?[index];
  }

  int getSavedMedicinesCount(int medicineId) {
    return medicineTimes[medicineId]?.length ?? 0;
  }

  List<TimeOfDay>? getSavedMedicinesTimes(int medicineId) =>
      medicineTimes[medicineId];

  SavedMedicinesController._();

  static final SavedMedicinesController _instance =
      SavedMedicinesController._();
  factory SavedMedicinesController() => _instance;
}
