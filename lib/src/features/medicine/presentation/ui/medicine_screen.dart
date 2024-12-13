import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';

class MedicineScreen extends StatelessWidget {
  final MedicineModel medicine;
  const MedicineScreen({super.key, required this.medicine});

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
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.65,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.horizontalPadding,
                            vertical: 40,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: AppColors.primary,
                                        ),
                                        textStyle: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        )),
                                    onPressed: () {
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now());
                                    },
                                    label: const Text("Set Alarm")),
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: FilledButton(
                                    onPressed: () {}, child: Text("Submit")),
                              )
                            ],
                          ),
                        );
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

class LabelInfoTile extends StatelessWidget {
  final String label;
  final String info;
  const LabelInfoTile({
    required this.label,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 4,
              backgroundColor: AppColors.secondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.primary),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(info,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primary)),
        ),
      ],
    );
  }
}
