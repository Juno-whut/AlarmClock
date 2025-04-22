import 'package:alarm_clock/constants/colors.dart';
import 'package:alarm_clock/pages/main_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Alarm Clock',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error, 
          onError: AppColors.onError, 
          surface: AppColors.surface, 
          onSurface: AppColors.onSurface,
        ),
        scaffoldBackgroundColor: AppColors.surface,
      ),
      home: const MainPage(),
      
    );
  }
}


void main() {
  runApp(const MyApp());
}
