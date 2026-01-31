import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF3FFF6),
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
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage:
                    AssetImage("assets/images/profile_image.jpg"),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Mohamed Nasr",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "mohamed23elbalkemy@gmail.com",
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            profileItem(Icons.edit, "Edit Profile"),
            profileItem(Icons.history, "History"),
            profileItem(Icons.settings, "Settings"),
            profileItem(Icons.logout, "Log Out",
                color: Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget profileItem(IconData icon, String title,
      {Color color = Colors.green}) {
    return Container(
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
                color: title == "Log Out" ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }
}
