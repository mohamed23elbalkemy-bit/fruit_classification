import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/mainActionButton.dart';
import '../../../core/widgets/recentItem.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.apple, color: Colors.green),
            SizedBox(width: 6),
            Text(
              "FruitAI",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(context, AppRoutes.profileScreen);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Classify Your Fruit",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Take a photo or upload an image to identify any fruit",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            /// 📷 Open Camera
            MainActionButton(
              icon: Icons.camera_alt,
              title: "Open Camera",
              subtitle: "Take a photo",
              isPrimary: true,
              onTap: () {
                Navigator.push(context, AppRoutes.cameraScreen);
              },
            ),

            const SizedBox(height: 15),

            /// 🖼 Upload Image
            MainActionButton(
              icon: Icons.image_outlined,
              title: "Upload Image",
              subtitle: "From gallery",
              isPrimary: false,
              onTap: () {},
            ),

            const SizedBox(height: 30),

            /// 🔥 Recent Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Recent Classifications",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, AppRoutes.historyScreen);
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            const RecentItem(
              image: "assets/images/apple_image.jpg",
              title: "Red Apple",
              confidence: "98%",
              time: "2 mins ago",
            ),
            const SizedBox(height: 10),
            const RecentItem(
              image: "assets/images/orange_image.jpg",
              title: "Orange",
              confidence: "95%",
              time: "15 mins ago",
            ),
            const SizedBox(height: 10),
            const RecentItem(
              image: "assets/images/banana_image.jpg",
              title: "Banana",
              confidence: "99%",
              time: "1 hour ago",
            ),
          ],
        ),
      ),
    );
  }
}
