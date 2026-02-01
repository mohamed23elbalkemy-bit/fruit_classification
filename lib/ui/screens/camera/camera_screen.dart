import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../result/model/fruit_result_model.dart';
import '../result/result_screen.dart';



class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool _isInitialized = false;
  bool _isFlashOn = false;
  bool _isCapturing = false;

  XFile? _capturedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _controller.initialize();

    if (!mounted) return;
    setState(() => _isInitialized = true);
  }

  Future<void> _captureImage() async {
    if (!_controller.value.isInitialized || _isCapturing) return;

    setState(() => _isCapturing = true);

    final image = await _controller.takePicture();

    final result = FruitResult(
      imagePath: image.path,
      name: "Apple",
      grade: "First Grade",
      accuracy: 0.94,
      dateTime: DateTime.now(),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(result: result),
      ),
    );
  }

  Future<void> _openGallery() async {
    try {
      final XFile? image =
      await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final result = FruitResult(
        imagePath: image.path,
        name: "Banana",
        grade: "Second Grade",
        accuracy: 0.82,
        dateTime: DateTime.now(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(result: result),
        ),
      );
    } catch (e) {
      debugPrint("Gallery error: $e");
    }
  }


  Future<void> _toggleFlash() async {
    if (!_controller.value.isInitialized) return;

    _isFlashOn = !_isFlashOn;
    await _controller.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: _isInitialized
                ? CameraPreview(_controller)
                : const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: _circleIcon(Icons.close, () {
              Navigator.pop(context);
            }),
          ),

          Positioned(
            top: 40,
            right: 80,
            child: _circleIcon(
              _isFlashOn ? Icons.flash_on : Icons.flash_off,
              _toggleFlash,
            ),
          ),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleIcon(Icons.photo_library, _openGallery),

                GestureDetector(
                  onTap: _captureImage,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),
                ),

                const SizedBox(width: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}
