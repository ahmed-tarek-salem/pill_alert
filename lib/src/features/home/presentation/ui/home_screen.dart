import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_constants.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';
import 'package:pill_alert/src/core/models/medicine_model.dart';
import 'package:pill_alert/src/core/widgets/medicine_tile.dart';
import 'package:pill_alert/src/features/search/presentation/ui/search_screen.dart';

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
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppConstants.borderRadius),
                      ),
                      child: ListView.separated(
                          padding: const EdgeInsets.only(top: 12),
                          itemBuilder: (context, index) {
                            final medicine = medicines[index];
                            return MedicineTile(
                                medicine: medicine,
                                backgroundColor: Colors.transparent);
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
