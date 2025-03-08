import 'package:flutter/material.dart';
import 'package:pmsn2025_2/screens/dashboard_screen.dart';
import 'package:pmsn2025_2/screens/list_students_screen.dart';
import 'package:pmsn2025_2/screens/login_screen.dart';
import 'package:pmsn2025_2/screens/register_screen.dart';
import 'package:pmsn2025_2/screens/splash_screen.dart';
import 'package:pmsn2025_2/screens/todo_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalValues.loadSettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, theme, child) {
        return ValueListenableBuilder(
          valueListenable: GlobalValues.font,
          builder: (context, font, child) {
            return MaterialApp(
              theme: theme.copyWith(
                  textTheme:
                      Theme.of(context).textTheme.apply(fontFamily: font)),
              routes: {
                "/list": (context) => const ListStudentsScreen(),
                "/dash": (context) => const DashboardScreen(),
                "/todo": (context) => const TodoScreen(),
                "/register": (context) => RegisterScreen(),
                "/login": (context) => LoginScreen(),
              },
              title: 'Material App',
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}