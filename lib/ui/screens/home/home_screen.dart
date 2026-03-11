import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/mainActionButton.dart';
import '../../../core/widgets/recentItem.dart';
import '../../../l10n/app_localizations.dart';
import '../history/data/history_storage.dart';
import '../../../core/services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? lastScanTime;

  Future<void> _openScreen(Route route) async {
    await Navigator.push(context, route);

    lastScanTime = DateTime.now();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(hours: 2), () {
      if (lastScanTime == null ||
          DateTime.now().difference(lastScanTime!) > const Duration(hours: 2)) {
        NotificationService.scheduleReminder();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final recent = HistoryStorage.history.take(3).toList();
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.apple, color: Colors.green),
            const SizedBox(width: 6),
            Text(
              "FruitAI",
              style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: Theme.of(context).iconTheme.color,
            ),
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

            Text(
              loc.classifyYourFruit,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              loc.takePhotoOrUpload,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 25),

            MainActionButton(
              icon: Icons.camera_alt,
              title: loc.openCamera,
              subtitle: loc.takePhoto,
              isPrimary: true,
              onTap: () {
                _openScreen(AppRoutes.cameraScreen);
              },
            ),

            const SizedBox(height: 15),

            MainActionButton(
              icon: Icons.image_outlined,
              title: loc.uploadImage,
              subtitle: loc.fromGallery,
              isPrimary: false,
              onTap: () {
                _openScreen(AppRoutes.uploadImageScreen);
              },
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.recentClassifications,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, AppRoutes.historyScreen);
                  },
                  child: Text(
                    loc.viewAll,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            if (recent.isEmpty)
              Text(
                loc.noRecentClassifications,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.7),
                ),
              )
            else
              Column(
                children: recent.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RecentItem(
                      image: item.imagePaths.first,
                      title: item.name,
                      confidence:
                      "${(item.accuracy * 100).toStringAsFixed(1)}%",
                      time:
                      "${item.dateTime.hour}:${item.dateTime.minute.toString().padLeft(2, '0')}",
                      confidenceLabel: loc.confidence,
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