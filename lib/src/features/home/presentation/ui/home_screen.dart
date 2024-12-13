import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.homeBackground,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final medicine = medicines[index];
                            return MedicineTile(medicine: medicine);
                          },
                          separatorBuilder: (context, index) => const Divider(
                                height: 30,
                                color: AppColors.primary,
                                thickness: 0.5,
                                indent: 45,
                                endIndent: 45,
                              ),
                          itemCount: medicines.length)),
                ),
                const SizedBox(height: 32),
                FilledButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {},
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

class MedicineTile extends StatelessWidget {
  const MedicineTile({
    super.key,
    required this.medicine,
  });

  final MedicineModel medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                const Text(
                  "Diabetic Drug",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                const Text(
                  "10:00 AM - 6:30 PM",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: AppColors.secondary))
        ],
      ),
    );
  }
}
