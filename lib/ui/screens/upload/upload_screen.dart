import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../result/model/fruit_result_model.dart';
import '../result/result_screen.dart';
import '../../../l10n/app_localizations.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final loc = AppLocalizations.of(context)!;

    try {
      final List<XFile> images = await picker.pickMultiImage();

      if (images.length < 4) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loc.pleaseSelectAtLeast4Images),
          ),
        );
        return;
      }

      final result = FruitResult(
        imagePaths: images.take(4).map((e) => e.path).toList(),
        name: "Orange",
        grade: "First Grade",
        accuracy: 0.91,
        dateTime: DateTime.now(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(result: result),
        ),
      );
    } catch (e) {
      debugPrint("Upload image error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          loc.uploadFruitImages,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.green.withOpacity(0.4),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green.withOpacity(0.15),
                    child: const Icon(
                        Icons.upload,
                        color: Colors.green,
                        size: 30),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    loc.upload4ImagesOfTheFruit,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loc.chooseFourImagesShowingDifferentSides,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () => _pickImage(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.photo_size_select_actual_outlined,
                              color: Colors.white),
                          const SizedBox(width: 6),
                          Text(
                            loc.chooseImages,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    loc.supportsJpgPngWebp,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Text(
              loc.tipsForBestResults,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
            const SizedBox(height: 16),
            Tip(loc.tipTakeImagesFrom4DifferentAngles),
            Tip(loc.tipUseClearWellLitPhotos),
            Tip(loc.tipCenterTheFruitInTheFrame),
            Tip(loc.tipAvoidBlurryOrDarkImages),
          ],
        ),
      ),
    );
  }
}

class Tip extends StatelessWidget {
  final String text;

  const Tip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle,
              color: Colors.green,
              size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}