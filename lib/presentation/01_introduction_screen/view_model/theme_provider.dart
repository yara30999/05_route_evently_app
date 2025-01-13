import 'package:flutter/material.dart';
import '../../../app/app_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  final AppPreferences _appPreferences;
  ThemeProvider(this._appPreferences);

  ThemeMode themeMode = ThemeMode.light;

  //   Future<void> setTheme(ThemeMode themeMode) async {
  //   emit(ThemeLoading());
  //   try {
  //     await _appPreferences.setTheme(themeMode);
  //     currentTheme = themeMode;
  //     emit(ThemeSuccess());
  //   } catch (e) {
  //     emit(ThemeFailure());
  //   }
  // }

  // Future<void> getTheme() async {
  //   emit(ThemeLoading());
  //   try {
  //     var curTheme = await _appPreferences.getTheme();
  //     currentTheme = curTheme;
  //     emit(ThemeSuccess());
  //   } catch (e) {
  //     emit(ThemeFailure());
  //   }
  // }

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
