import 'package:flutter/material.dart';
import '../ui/screens/splash/splash_screen.dart';

class FruitClassificationApp extends StatelessWidget {
  const FruitClassificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
