import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/services/local_notifications.dart';
import 'package:pill_alert/src/features/home/presentation/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pill Alert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.surface,
        timePickerTheme: const TimePickerThemeData(
            dayPeriodColor: AppColors.secondary,
            dayPeriodTextStyle: TextStyle(color: Colors.white)),
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              iconColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              foregroundColor: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
