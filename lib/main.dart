import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pill_alert/generated/l10n.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';
import 'package:pill_alert/src/core/services/alarm_service.dart';
import 'package:pill_alert/src/features/home/presentation/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AlarmNotificationService().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ar');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pill Alert',
      locale: _locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
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
      home: const HomeScreen(),
    );
  }
}
