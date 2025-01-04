import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_alert/generated/l10n.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/services/alarm_service.dart';
import 'package:pill_alert/src/core/services/local_storage.dart';
import 'package:pill_alert/src/core/widgets/medicine_tile.dart';
import 'package:pill_alert/src/features/home/presentation/ux/saved_medicines_controller.dart';
import 'package:pill_alert/src/features/search/presentation/ui/search_screen.dart';

import '../../../../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final savedMedicinesController = SavedMedicinesController();
  late final LocalStorage localStorage = LocalStorage();
  final alarmService = AlarmNotificationService();

  @override
  void initState() {
    initStorage();
    initAlarmListener();
    super.initState();
  }

  initStorage() async {
    await localStorage.init();
    savedMedicinesController.fetchSavedMedicines();
  }

  initAlarmListener() {
    Alarm.ringStream.stream.listen((settings) {
      print("Alarm with ID ${settings.id} rang. Rescheduling for tomorrow.");
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(settings.notificationSettings.title),
              content: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    alarmService.stopAndSetForTomorrow(settings);
                  },
                  child: Text(S.of(context).stop_alarm)),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicines = getLocalizedMedicines(context);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   int delayInHours = 0;
      //   var dateTime = DateTime.now().add(Duration(hours: delayInHours));
      //   double? volume;

      //   if (delayInHours != 0) {
      //     dateTime = dateTime.copyWith(second: 0, millisecond: 0);
      //     volume = 0.5;
      //   }

      //   final alarmSettings = AlarmSettings(
      //     id: DateTime.now().millisecondsSinceEpoch % 10000,
      //     dateTime: dateTime,
      //     assetAudioPath: 'assets/audios/marimba.mp3',
      //     volume: volume,
      //     vibrate: false,
      //     volumeEnforced: true,
      //     notificationSettings: NotificationSettings(
      //       title: 'Alarm example',
      //       body: 'Shortcut button alarm with delay of $delayInHours hours',
      //       icon: 'notification_icon',
      //       stopButton: "Stop",
      //     ),
      //     warningNotificationOnKill: Platform.isIOS,
      //   );

      //   await Alarm.set(alarmSettings: alarmSettings);
      // }),
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
                        onPressed: () {
                          if (Intl.getCurrentLocale() == "en") {
                            S.load(const Locale('ar'));
                            MyApp.of(context)!.setLocale(const Locale('ar'));
                          } else {
                            S.load(const Locale('en'));
                            MyApp.of(context)!.setLocale(const Locale('en'));
                          }
                          print(
                              "Language changed to ${Intl.getCurrentLocale()}");
                        },
                        child: Text(S.of(context).language)),
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
                                Text(
                                  S.of(context).your_medicines,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Expanded(
                                  child: savedMedicinesController
                                          .medicineTimes.isEmpty
                                      ? Center(
                                          child: Text(
                                              S
                                                  .of(context)
                                                  .no_selected_medicines,
                                              style: const TextStyle(
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
