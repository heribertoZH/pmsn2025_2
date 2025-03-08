import 'package:flutter/material.dart';
import 'package:pmsn2025_2/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalValues {
  static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier udpList = ValueNotifier(false);
  static ValueNotifier themeApp = ValueNotifier(ThemeData.light());
  static ValueNotifier<String> font = ValueNotifier('Roboto');

  static Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _font = prefs.getString('font') ?? 'Roboto';
    String _theme = prefs.getString('theme') ?? 'Día';

    if (_theme == 'Día') {
      themeApp.value = ThemeSettings.lightTheme();
    } else if (_theme == 'Noche') {
      themeApp.value = ThemeSettings.darkTheme();
    } else {
      themeApp.value = ThemeSettings.warmTheme();
    }
    font.value = _font;
  }
}
