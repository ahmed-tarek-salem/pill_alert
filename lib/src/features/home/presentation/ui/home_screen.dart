import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:alarm/model/notification_settings.dart';
import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/services/local_storage.dart';
import 'package:pill_alert/src/core/widgets/medicine_tile.dart';
import 'package:pill_alert/src/features/home/presentation/ux/saved_medicines_controller.dart';
import 'package:pill_alert/src/features/search/presentation/ui/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final savedMedicinesController = SavedMedicinesController();
  late final LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    initStorage();
    super.initState();
  }

  initStorage() async {
    await localStorage.init();
    savedMedicinesController.fetchSavedMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        int delayInHours = 0;
        var dateTime = DateTime.now().add(Duration(hours: delayInHours));
        double? volume;

        if (delayInHours != 0) {
          dateTime = dateTime.copyWith(second: 0, millisecond: 0);
          volume = 0.5;
        }

        final alarmSettings = AlarmSettings(
          id: DateTime.now().millisecondsSinceEpoch % 10000,
          dateTime: dateTime,
          assetAudioPath: 'assets/audios/marimba.mp3',
          volume: volume,
          vibrate: false,
          volumeEnforced: true,
          notificationSettings: NotificationSettings(
            title: 'Alarm example',
            body: 'Shortcut button alarm with delay of $delayInHours hours',
            icon: 'notification_icon',
            stopButton: "Stop",
          ),
          warningNotificationOnKill: Platform.isIOS,
        );

        await Alarm.set(alarmSettings: alarmSettings);
      }),
      body: Stack(
        children: [
          Image.asset(AppImages.homeBackground,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 64),
                Row(
                  children: [
                    TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.white),
                        onPressed: () {},
                        child: const Text("اللغة العربية")),
                    const Spacer(),
                    Image.asset(AppImages.logo, height: 150)
                  ],
                ),
                Expanded(
                  child: ListenableBuilder(
                      listenable: savedMedicinesController,
                      builder: (context, _) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 16),
                                const Text(
                                  "Your Medicines",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Expanded(
                                  child: savedMedicinesController
                                          .medicineTimes.isEmpty
                                      ? const Center(
                                          child: Text("No Selected Medicines",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.primary,
                                              )),
                                        )
                                      : ListView.separated(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          itemBuilder: (context, index) {
                                            int medicineId =
                                                savedMedicinesController
                                                    .medicineTimes.keys
                                                    .toList()[index];
                                            final medicine =
                                                medicines.firstWhere(
                                                    (e) => e.id == medicineId);

                                            return MedicineTile(
                                                medicine: medicine,
                                                times: savedMedicinesController
                                                            .medicineTimes[
                                                        medicineId] ??
                                                    [],
                                                backgroundColor:
                                                    Colors.transparent);
                                          },
                                          separatorBuilder: (context, index) =>
                                              const Divider(
                                                height: 30,
                                                color: AppColors.primary,
                                                thickness: 0.5,
                                                indent: 45,
                                                endIndent: 45,
                                              ),
                                          itemCount: savedMedicinesController
                                              .medicineTimes.keys
                                              .toList()
                                              .length),
                                ),
                              ],
                            ));
                      }),
                ),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  child: const Icon(Icons.add, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 32),
              ],
            ),
          )
        ],
      ),
    );
  }
}
