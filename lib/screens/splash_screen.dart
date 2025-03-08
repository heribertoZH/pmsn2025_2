import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pmsn2025_2/screens/login_screen.dart';
import 'package:pmsn2025_2/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Widget> _getNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('sesion') ?? false;

    return isLoggedIn ? DashboardScreen() : LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Widget>(
        future: _getNextScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return FlutterSplashScreen(
            duration: Duration(milliseconds: 3800),
            nextScreen: snapshot.data ?? LoginScreen(),
            backgroundColor: Colors.white,
            splashScreenBody: Center(
              child: Lottie.asset("assets/tecnm.json"),
            ),
          );
        },
      ),
    );
  }
}
