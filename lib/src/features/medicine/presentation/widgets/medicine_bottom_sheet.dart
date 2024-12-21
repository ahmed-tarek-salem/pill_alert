import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/services/local_storage.dart';
import 'package:pill_alert/src/features/home/presentation/ux/saved_medicines_controller.dart';

class MedicineBottomSheet extends StatelessWidget {
  const MedicineBottomSheet({
    super.key,
    required this.savedMedicinesController,
    required this.medicine,
  });

  final SavedMedicinesController savedMedicinesController;
  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: savedMedicinesController,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.65,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding,
              vertical: 40,
            ),
            child: Column(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  shrinkWrap: true,
                  itemCount: savedMedicinesController
                      .getSavedMedicinesCount(medicine.id),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final time = savedMedicinesController.getMedicineTime(
                        medicine.id, index)!;
                    return Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.alarm,
                                  color: AppColors.primary,
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: AppColors.primary,
                                    ),
                                    textStyle: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    )),
                                onPressed: () async {
                                  final selectedTime = await showTimePicker(
                                      context: context, initialTime: time);
                                  if (selectedTime != null) {
                                    savedMedicinesController.addSavedMedicine(
                                        medicine.id, selectedTime);
                                  }
                                },
                                label: Text(time.format(context))),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.secondary,
                          ),
                          onPressed: () {
                            savedMedicinesController.removeMedicineTime(
                                medicine.id, time);
                          },
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: OutlinedButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.primary,
                      ),
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.primary,
                          ),
                          textStyle: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                      onPressed: () async {
                        final time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (time != null) {
                          savedMedicinesController.addSavedMedicine(
                              medicine.id, time);
                        }
                      },
                      label: const Text("Set New Alarm")),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FilledButton(
                      onPressed: () {
                        final LocalStorage localStorage = LocalStorage();
                        localStorage.addMedicineSchedule(
                            medicine.id,
                            savedMedicinesController
                                .getSavedMedicinesTimes(medicine.id));
                        Navigator.pop(context);
                      },
                      child: const Text("Submit")),
                )
              ],
            ),
          );
        });
  }
}
