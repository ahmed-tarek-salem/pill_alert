import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/features/medicine/presentation/ui/medicine_screen.dart';

class MedicineTile extends StatelessWidget {
  final Color? backgroundColor;
  const MedicineTile({
    super.key,
    this.backgroundColor = Colors.white,
    required this.medicine,
    required this.times,
  });

  final MedicineModel medicine;
  final List<TimeOfDay> times;

  formattedTimes(List<TimeOfDay> times, BuildContext context) {
    String formattedTimes = "";
    for (int i = 0; i < times.length; i++) {
      formattedTimes += times[i].format(context);
      if (i != times.length - 1) {
        formattedTimes += ", ";
      }
    }
    return formattedTimes;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MedicineScreen(medicine: medicine)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.surface,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                medicine.image,
                height: 130,
                width: 110,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    medicine.name,
                    style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600),
                  ),
                  if (medicine.similars.isNotEmpty)
                    Text(
                      medicine.similars.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                  if (times.isNotEmpty)
                    Text(
                      formattedTimes(times, context),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    )
                ],
              ),
            ),
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.close, color: AppColors.secondary))
          ],
        ),
      ),
    );
  }
}
