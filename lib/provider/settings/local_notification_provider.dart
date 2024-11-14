import 'package:dishdash_restaurant/services/notification_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../services/local_notification_service.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;
  final NotificationPreference _notificationPreference;

  LocalNotificationProvider(
      this.flutterNotificationService, this._notificationPreference) {
    _loadNotificationPreference();
  }

  final int _notificationDailyId = 101;
  int get notificationDailyId => _notificationDailyId;
  List<PendingNotificationRequest> pendingNotificationRequests = [];

  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;

  bool? _permission = false;
  bool? get permission => _permission;

  Future<void> _loadNotificationPreference() async {
    _isNotificationEnabled =
        await _notificationPreference.getNotificationStatus();
    notifyListeners();
  }

  Future<void> toggleNotificationStatus(bool isEnabled) async {
    _isNotificationEnabled = isEnabled;
    await _notificationPreference.setNotificationStatus(isEnabled);
    notifyListeners();
  }

  Future<void> requestPermissions() async {
    _permission = await flutterNotificationService.requestPermissions();
    notifyListeners();
  }

  void scheduleDailyElevenAMNotification() {
    flutterNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationDailyId,
    );
  }

  Future<void> checkPendingNotificationRequests(BuildContext context) async {
    pendingNotificationRequests =
        await flutterNotificationService.pendingNotificationRequests();
    notifyListeners();
  }

  Future<void> cancelNotification(int id) async {
    await flutterNotificationService.cancelNotification(id);
  }
}
