import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/features/home/presentation/ux/saved_medicines_controller.dart';
import 'package:pill_alert/src/features/medicine/presentation/widgets/label_info_tile.dart';
import 'package:pill_alert/src/features/medicine/presentation/widgets/medicine_bottom_sheet.dart';

class MedicineScreen extends StatelessWidget {
  final MedicineModel medicine;
  MedicineScreen({super.key, required this.medicine});
  final savedMedicinesController = SavedMedicinesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          medicine.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppConstants.borderRadius),
                  bottomRight: Radius.circular(AppConstants.borderRadius),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 85),
            child: Image.asset(
              medicine.image,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                LabelInfoTile(
                  label: "Similars of the drug:",
                  info: medicine.similars.join(", "),
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: "Dose:",
                  info: medicine.dose,
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: "Side effects:",
                  info: medicine.sideEffects,
                ),
                const SizedBox(height: 10),
                LabelInfoTile(
                  label: "Tips:",
                  info: medicine.tips,
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return MedicineBottomSheet(
                            savedMedicinesController: savedMedicinesController,
                            medicine: medicine);
                      });
                },
                label: const Text("Add your times"),
                icon: const Icon(Icons.alarm, color: AppColors.secondary),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
