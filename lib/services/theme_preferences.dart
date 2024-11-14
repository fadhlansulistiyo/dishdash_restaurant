import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const _themePreferenceKey = 'isDarkMode';
  final SharedPreferences _preferences;

  ThemePreference(this._preferences);

  Future<bool> getTheme() async {
    return _preferences.getBool(_themePreferenceKey) ?? false;
  }

  Future<void> setTheme(bool isDarkMode) async {
    try {
      await _preferences.setBool(_themePreferenceKey, isDarkMode);
    } catch (e) {
      throw Exception("Unable to save Theme.");
    }
  }
}
