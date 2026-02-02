import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/mainActionButton.dart';
import '../../../core/widgets/recentItem.dart';
import '../history/data/history_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _openScreen(Route route) async {
    await Navigator.push(context, route);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    final recent = HistoryStorage.history.take(3).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF6),

      appBar: AppBar(
        backgroundColor: Color(0xFFF3FFF6),
        automaticallyImplyLeading: false,
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              "Take a photo or upload an image to identify any fruit",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 25),


            MainActionButton(
              icon: Icons.camera_alt,
              title: "Open Camera",
              subtitle: "Take a photo",
              isPrimary: true,
              onTap: () {
                _openScreen(AppRoutes.cameraScreen);
              },
            ),

            const SizedBox(height: 15),

            /// 🖼️ UPLOAD
            MainActionButton(
              icon: Icons.image_outlined,
              title: "Upload Image",
              subtitle: "From gallery",
              isPrimary: false,
              onTap: () {
                _openScreen(AppRoutes.uploadImageScreen);
              },
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Classifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

            if (recent.isEmpty)
              const Text(
                "No recent classifications yet",
                style: TextStyle(color: Colors.black54),
              )
            else
              Column(
                children: recent.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RecentItem(
                      image: item.imagePath,
                      title: item.name,
                      confidence:
                      "${(item.accuracy * 100).toStringAsFixed(1)}%",
                      time:
                      "${item.dateTime.hour}:${item.dateTime.minute.toString().padLeft(2, '0')}",
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
