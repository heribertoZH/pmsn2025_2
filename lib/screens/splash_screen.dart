import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025_2/screens/dashboard_screen.dart';
import 'package:pmsn2025_2/screens/list_students_screen.dart';
import 'package:pmsn2025_2/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: const Duration(milliseconds: 5000),
        nextScreen: const DashboardScreen(),
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset("assets/tecnm.json"),
        ),
      ),
    );
  }
}