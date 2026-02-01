import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/profile/storage/user_storage.dart';
import 'package:fruit_classification/ui/screens/history/history_screen.dart';
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

    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF3FFF6),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// USER CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.email,
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ✏️ Edit Profile
            profileItem(
              Icons.edit,
              "Edit Profile",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfileScreen(),
                  ),
                );
                setState(() {});
              },
            ),

            /// 🕘 History (NEW 🔥)
            profileItem(
              Icons.history,
              "History",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HistoryScreen(),
                  ),
                );
              },
            ),

            profileItem(
              Icons.settings,
              "Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },
            ),

            profileItem(
              Icons.logout,
              "Log Out",
              color: Colors.redAccent,
              onTap: () {
                showLogoutDialog(context);
              },
            ),


          ],
        ),
      ),
    );
  }
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFF3FFF6),
        title: const Text("Log Out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel",style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              logout(context);
            },
            child: const Text("Log Out",style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
  void logout(BuildContext context) {
    /// هنا بعدين هتتحول Firebase SignOut
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
          color: Colors.white,
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
                color: title == "Log Out" ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
