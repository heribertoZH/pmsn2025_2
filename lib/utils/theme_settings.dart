import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith();
    return theme;
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith();
    return theme;
  }

  static ThemeData warmTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFD88C3A),
        onPrimary: Color(0xFF4E342E),
        secondary: Color(0xFFFFC107),
        onSecondary: Color(0xFF6D4C41),
        error: Color(0xFFB71C1C),
        onError: Colors.white,
        surface: Color(0xFF2D1E1E),
        onSurface: Color(0xFFFFD180),
      ),
      scaffoldBackgroundColor: const Color(0xFF1B1917),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4E342E),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFFFE0B2)),
        bodyMedium: TextStyle(color: Color(0xFFFFD180)),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFFD88C3A),
        textTheme: ButtonTextTheme.primary,
      ),
    );
    return theme;
  }
}
