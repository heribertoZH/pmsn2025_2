import 'package:flutter/material.dart';
import 'package:pmsn2025_2/screens/dashboard_screen.dart';
import 'package:pmsn2025_2/screens/list_students_screen.dart';
import 'package:pmsn2025_2/screens/splash_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, value, child) {
        return MaterialApp(
          theme: value,
          routes:  {
            "/list" : (context) => const ListStudentsScreen(),
            "/dash" : (context) => const DashboardScreen(),
          },
          title: 'Material App',
          home: SplashScreen()
        );
      }
    );
  }
}