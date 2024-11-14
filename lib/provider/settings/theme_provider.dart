import 'package:flutter/material.dart';
import '../../services/theme_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final ThemePreference _themePreference;

  ThemeProvider(this._themePreference) {
    _loadThemePreference();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _themePreference.setTheme(isDarkMode);
    notifyListeners();
  }

  Future<void> _loadThemePreference() async {
    bool isDarkMode = await _themePreference.getTheme();
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
