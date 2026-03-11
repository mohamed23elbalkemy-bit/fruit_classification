import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/services/local_storage_service.dart';
import '../l10n/app_localizations.dart';
import '../ui/screens/splash/splash_screen.dart';
class FruitClassificationApp extends StatefulWidget {
  const FruitClassificationApp({super.key});

  static void setDarkMode(BuildContext context, bool value) {
    final state = context.findAncestorStateOfType<_FruitClassificationAppState>();
    state?.changeTheme(value);
  }
  static void setLanguage(BuildContext context, String code) {
    final state =
    context.findAncestorStateOfType<_FruitClassificationAppState>();

    state?.changeLanguage(code);
  }
  @override
  State<FruitClassificationApp> createState() => _FruitClassificationAppState();
}

class _FruitClassificationAppState extends State<FruitClassificationApp> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
    void _loadLanguage() async {
      String code = await LocalStorageService.getLanguage();

      setState(() {
        _locale = Locale(code);
      });
    }
  }
  Locale _locale = const Locale('en');

  void changeLanguage(String code) async {

    setState(() {
      _locale = Locale(code);
    });

    await LocalStorageService.saveLanguage(code);
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
      locale: _locale,

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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