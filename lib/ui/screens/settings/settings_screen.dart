import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/about/about_app_screen.dart';
import '../../../app/app.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;
  String language = "en";

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    bool savedTheme = await LocalStorageService.getDarkMode();
    String savedLang = await LocalStorageService.getLanguage();

    setState(() {
      darkMode = savedTheme;
      language = savedLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.settings,
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              loc.manageAppPreferences,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 16,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _settingTile(
                    icon: Icons.notifications_none,
                    title: loc.notifications,
                    subtitle: loc.receiveAlertsAndUpdates,
                    trailing: Switch(
                      value: notifications,
                      activeColor: Colors.green,
                      onChanged: (value) async {
                        setState(() => notifications = value);
                        if (value) {
                          await NotificationService.showNotification(
                            title: "FruitAI",
                            body: loc.notificationsEnabledSuccessfully,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _settingTile(
                    icon: Icons.dark_mode_outlined,
                    title: loc.darkMode,
                    subtitle: loc.switchToDarkTheme,
                    trailing: Switch(
                      value: darkMode,
                      activeColor: Colors.green,
                      onChanged: (value) async {
                        setState(() => darkMode = value);
                        FruitClassificationApp.setDarkMode(context, value);
                        await LocalStorageService.saveDarkMode(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _settingTile(
                    icon: Icons.language,
                    title: loc.language,
                    subtitle: language == "en" ? loc.english : loc.arabic,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: _showLanguageDialog,
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _settingTile(
                    icon: Icons.info_outline,
                    title: loc.aboutApp,
                    subtitle: loc.appInformationAndDetails,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AboutAppScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              loc.version,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    final loc = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Text(loc.selectLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(loc.english),
                onTap: () async {
                  setState(() => language = "en");
                  FruitClassificationApp.setLanguage(context, "en");
                  await LocalStorageService.saveLanguage("en");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(loc.arabic),
                onTap: () async {
                  setState(() => language = "ar");
                  FruitClassificationApp.setLanguage(context, "ar");
                  await LocalStorageService.saveLanguage("ar");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.1),
          child: Icon(icon, color: Colors.green),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}