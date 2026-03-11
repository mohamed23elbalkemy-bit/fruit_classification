import 'package:flutter/material.dart';
import '../core/services/local_storage_service.dart';
import '../ui/screens/splash/splash_screen.dart';

class FruitClassificationApp extends StatefulWidget {
  const FruitClassificationApp({super.key});

  static void setDarkMode(BuildContext context, bool value) {
    final state = context.findAncestorStateOfType<_FruitClassificationAppState>();
    state?.changeTheme(value);
  }

  @override
  State<FruitClassificationApp> createState() => _FruitClassificationAppState();
}

class _FruitClassificationAppState extends State<FruitClassificationApp> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    bool savedTheme = await LocalStorageService.getDarkMode();
    setState(() {
      isDark = savedTheme;
    });
  }
  bool isDark = false;

  void changeTheme(bool value) async {
    setState(() {
      isDark = value;
    });

    await LocalStorageService.saveDarkMode(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF3FFF6),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF3FFF6),
          iconTheme: IconThemeData(color: Colors.green),
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}