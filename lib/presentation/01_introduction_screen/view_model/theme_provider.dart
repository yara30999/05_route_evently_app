import 'package:flutter/material.dart';
import '../../../app/app_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  final AppPreferences _appPreferences;
  ThemeProvider(this._appPreferences);

  ThemeMode themeMode = ThemeMode.light;

  void setTheme() async {
    themeMode == ThemeMode.light
        ? themeMode = ThemeMode.dark
        : themeMode = ThemeMode.light;
    await _appPreferences.setTheme(themeMode);
    notifyListeners();
  }

  void getTheme() async {
    themeMode = await _appPreferences.getTheme();
    notifyListeners();
  }
}
