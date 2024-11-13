import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkTheme = false;
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Theme'),
              value: _isDarkTheme,
              secondary: const Icon(Icons.dark_mode),
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                  // logic
                });
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _isNotificationEnabled,
              secondary: const Icon(Icons.notifications_active),
              onChanged: (bool value) {
                setState(() {
                  _isNotificationEnabled = value;
                  // logic
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
