import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/profile/storage/user_storage.dart';
import 'package:fruit_classification/ui/screens/history/history_screen.dart';
import 'package:fruit_classification/ui/screens/splash/splash_screen.dart';
import '../../../l10n/app_localizations.dart';
import '../auth/login_screen.dart';
import 'editProfile/edit_profile_screen.dart';
import 'package:fruit_classification/ui/screens/settings/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final user = UserStorage.currentUser;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          loc.profile,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: user.imagePath.startsWith('assets')
                        ? AssetImage(user.imagePath)
                        : FileImage(File(user.imagePath)) as ImageProvider,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).textTheme.titleMedium?.color),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.email,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            profileItem(Icons.edit,loc.editProfile,onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(),
                ),
              );
              setState(() {});
            }),

            profileItem(Icons.history,loc.history,onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            }),

            profileItem(Icons.settings,loc.settings,onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsScreen(),
                ),
              );
            }),

            profileItem(Icons.logout,loc.logout,
                color: Colors.redAccent,
                onTap: () {showLogoutDialog(context);}
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(loc.logout,
            style: TextStyle(
                color: Theme.of(context).textTheme.titleMedium?.color,
                fontWeight: FontWeight.bold)),
        content: Text(loc.confirmLogout),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              logout(context);
            },
            child: Text(loc.logout),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) {

    UserStorage.update(
      UserStorage.currentUser.copyWith(
        name: "",
        email: "",
        imagePath: "assets/images/profile_image.jpg",
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  Widget profileItem(
      IconData icon,
      String title, {
        Color color = Colors.green,
        VoidCallback? onTap,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: title == "Log Out"
                    ? Colors.red
                    : Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}