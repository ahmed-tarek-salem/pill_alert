import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/services/local_storage.dart';

class SavedMedicinesController extends ChangeNotifier {
  ///Medicine id to list of alerting times
  Map<int, List<TimeOfDay>?> medicineTimes = {};
  final LocalStorage localStorage = LocalStorage();

  fetchSavedMedicines() {
    localStorage.storedMedicines.keys.forEach((key) {
      final times = LocalStorage().getMedicineTimes(key);
      if (times != null) {
        medicineTimes[key] = times;
      }
    });
    notifyListeners();
  }

  bool isValidMedicineTime(int medicineId, TimeOfDay time) {
    final current = medicineTimes[medicineId];
    if (current == null) {
      return true;
    }
    return !current.contains(time);
  }

  void addMedicinetime(int medicineId, TimeOfDay time) {
    if (!isValidMedicineTime(medicineId, time)) return;
    final current = medicineTimes[medicineId];
    if (current == null) {
      medicineTimes[medicineId] = [time];
    } else {
      medicineTimes[medicineId] = [time, ...current];
    }
    localStorage.addMedicineTime(medicineId, time);
    notifyListeners();
  }

  void removeMedicineTime(int medicineId, TimeOfDay time) {
    medicineTimes[medicineId]?.remove(time);
    if (medicineTimes[medicineId]?.isEmpty == true) {
      medicineTimes.remove(medicineId);
    }
    localStorage.deleteMedicineTime(medicineId, time);
    notifyListeners();
  }

  void removeAllMedicineTimes(int medicineId) {
    medicineTimes.remove(medicineId);
    localStorage.deleteMedicine(medicineId);
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
