import 'package:shared_preferences/shared_preferences.dart';

class NotificationPreference {
  final SharedPreferences _preferences;

  NotificationPreference(this._preferences);

  static const String _keyNotification = "MY_NOTIFICATION";

  Future<void> setNotificationStatus(bool isEnabled) async {
    try {
      await _preferences.setBool(_keyNotification, isEnabled);
    } catch (e) {
      throw Exception("Unable to save Notification Preference.");
    }
  }

  Future<bool> getNotificationStatus() async {
    return _preferences.getBool(_keyNotification) ?? false;
  }
}
