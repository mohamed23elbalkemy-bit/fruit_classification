import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/about/about_app_screen.dart';
import 'package:fruit_classification/ui/screens/home/home_screen.dart';
import 'package:fruit_classification/ui/screens/settings/settings_screen.dart';
import '../ui/screens/splash/splash_screen.dart';

class FruitClassificationApp extends StatelessWidget {
  const FruitClassificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutAppScreen(),
    );
  }
}
