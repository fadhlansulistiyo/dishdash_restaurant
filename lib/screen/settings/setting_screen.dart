import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/settings/local_notification_provider.dart';
import '../../provider/settings/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;

    final notificationProvider = context.watch<LocalNotificationProvider>();
    bool isNotificationEnable = notificationProvider.isNotificationEnabled;
    int notificationDailyId = notificationProvider.notificationDailyId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dark Theme Switch
            SwitchListTile(
              title: const Text('Dark Theme'),
              subtitle: const Text('Enable dark theme'),
              value: isDarkTheme,
              secondary: const Icon(Icons.dark_mode),
              onChanged: (bool value) {
                themeProvider.toggleTheme(value);
              },
            ),
            const Divider(),
            // Notification Switch
            SwitchListTile(
                title: const Text('Daily Reminder'),
                subtitle: const Text('Enable daily notifications at 11am'),
                value: isNotificationEnable,
                secondary: const Icon(Icons.notifications_active),
                onChanged: (bool isEnabled) async {
                  await notificationProvider
                      .toggleNotificationStatus(isEnabled);
                  if (isNotificationEnable) {
                    await notificationProvider
                        .cancelNotification(notificationDailyId);
                  } else {
                    await _scheduleDailyElevenAMNotification();
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<void> _scheduleDailyElevenAMNotification() async {
    context
        .read<LocalNotificationProvider>()
        .scheduleDailyElevenAMNotification();
  }

/*
  Testing Purpose
  */
/*Future<void> _checkPendingNotificationRequests() async {
    final localNotificationProvider = context.read<LocalNotificationProvider>();
    await localNotificationProvider.checkPendingNotificationRequests(context);

    if (!mounted) {
      return;
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final pendingData = context.select(
            (LocalNotificationProvider provider) =>
                provider.pendingNotificationRequests);
        return AlertDialog(
          title: Text(
            '${pendingData.length} pending notification requests',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: pendingData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = pendingData[index];
                return ListTile(
                  title: Text(
                    item.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.body ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  contentPadding: EdgeInsets.zero,
                  trailing: IconButton(
                    onPressed: () {
                      localNotificationProvider
                        ..cancelNotification(item.id)
                        ..checkPendingNotificationRequests(context);
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }*/
}
