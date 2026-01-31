import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/routes/app_routes.dart';

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
    final camera = cameras.first;

    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _controller.initialize();

    if (!mounted) return;
    setState(() {
      _isInitialized = true;
    });
  }

  /// 📸 Capture Image
  Future<void> _captureImage() async {
    if (!_controller.value.isInitialized || _isCapturing) return;

    setState(() => _isCapturing = true);

    _capturedImage = await _controller.takePicture();

    // freeze preview
    await Future.delayed(const Duration(milliseconds: 800));

    Navigator.pushReplacement(
      context,
      AppRoutes.resultScreen,
    );
  }

  /// 🔦 Flash Toggle
  Future<void> _toggleFlash() async {
    if (!_controller.value.isInitialized) return;

    _isFlashOn = !_isFlashOn;

    await _controller.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );

    setState(() {});
  }

  /// 🖼 Open Gallery
  Future<void> _openGallery() async {
    try {
      final XFile? image =
      await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      Navigator.pushReplacement(
        context,
        AppRoutes.resultScreen,
      );
    } catch (e) {
      debugPrint("Gallery error: $e");
    }
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

          /// CAMERA / FREEZE IMAGE
          Positioned.fill(
            child: _capturedImage != null
                ? Image.file(
              File(_capturedImage!.path),
              fit: BoxFit.cover,
            )
                : _isInitialized
                ? CameraPreview(_controller)
                : const Center(
              child:
              CircularProgressIndicator(color: Colors.white),
            ),
          ),

          /// GRID
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),

          /// ❌ CLOSE
          Positioned(
            top: 40,
            left: 20,
            child: _circleIcon(Icons.close, () {
              Navigator.pop(context);
            }),
          ),

          /// 🔦 FLASH
          Positioned(
            top: 40,
            right: 80,
            child: _circleIcon(
              _isFlashOn ? Icons.flash_on : Icons.flash_off,
              _toggleFlash,
            ),
          ),

          /// 📸 CONTROLS
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                /// 🖼 GALLERY
                _circleIcon(Icons.photo_library, _openGallery),

                /// CAPTURE
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

                const SizedBox(width: 48), // balance
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

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1;

    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(size.width * i / 3, 0),
        Offset(size.width * i / 3, size.height),
        paint,
      );
      canvas.drawLine(
        Offset(0, size.height * i / 3),
        Offset(size.width, size.height * i / 3),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
