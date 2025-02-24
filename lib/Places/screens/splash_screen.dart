import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/screens/bottom_screen.dart';
import 'package:pmsn2025_2/Places/screens/place_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: const Duration(milliseconds: 4000),
        nextScreen: BottomScreen(),
        //nextScreen: PlaceScreen(imgUrl: "https://images.unsplash.com/photo-1502790671504-542ad42d5189?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9uZG8lMjBkZSUyMHBhbnRhbGxhJTIwZGUlMjBwYWlzYWplfGVufDB8fDB8fHww",),
        splashScreenBody: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(1, 109, 173, 1), //#001b4aff
                Color.fromRGBO(1, 72, 128, 1), 
                Color.fromRGBO(0, 27, 74, 1), 
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      Text(
                        'Travel',
                        style: TextStyle(
                          fontSize: 44,
                          fontFamily: 'Lobster',
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        "assets/assets/logo.png",
                        width: 36,
                        height: 36,
                      )
                    ]),
                Column(
                  children: [
                    Text(
                      "Find Your Dream",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Destination With Us",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
