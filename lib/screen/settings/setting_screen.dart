import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/settings/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    bool isDarkTheme = themeProvider.themeMode == ThemeMode.dark;

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
              value: isDarkTheme,
              secondary: const Icon(Icons.dark_mode),
              onChanged: (bool value) {
                setState(() {
                  themeProvider.toggleTheme(value);
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
