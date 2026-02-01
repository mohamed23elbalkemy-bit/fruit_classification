import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3FFF6),
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Settings",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6,),
            Text(
              "Manage your app preferences",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// SETTINGS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  /// NOTIFICATIONS
                  _settingTile(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    subtitle: "Receive alerts and updates",
                    trailing: Switch(
                      value: notifications,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() => notifications = value);
                      },
                    ),
                  ),
                  SizedBox(height: 16,),
                  const Divider(),
                  SizedBox(height: 16,),
                  /// DARK MODE
                  _settingTile(
                    icon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    subtitle: "Switch to dark theme",
                    trailing: Switch(
                      value: darkMode,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() => darkMode = value);
                      },
                    ),
                  ),
                  SizedBox(height: 16,),
                  const Divider(),
                  SizedBox(height: 16,),
                  /// LANGUAGE
                  _settingTile(
                    icon: Icons.language,
                    title: "Language",
                    subtitle: "English",
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.green.withOpacity(0.1),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }
}
