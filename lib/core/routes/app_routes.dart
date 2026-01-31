import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/about/about_app_screen.dart';
import 'package:fruit_classification/ui/screens/auth/login_screen.dart';
import 'package:fruit_classification/ui/screens/auth/register_screen.dart';
import 'package:fruit_classification/ui/screens/camera/camera_screen.dart';
import 'package:fruit_classification/ui/screens/history/history_screen.dart';
import 'package:fruit_classification/ui/screens/profile/profile_screen.dart';
import 'package:fruit_classification/ui/screens/result/result_screen.dart';
import 'package:fruit_classification/ui/screens/settings/settings_screen.dart';
import 'package:fruit_classification/ui/screens/splash/splash_screen.dart';
import 'package:fruit_classification/ui/screens/upload/upload_screen.dart';
import '../../ui/screens/onboarding/onboarding_1.dart';
import '../../ui/screens/onboarding/onboarding_2.dart';
import '../../ui/screens/onboarding/onboarding_3.dart';

abstract final class AppRoutes {

  static MaterialPageRoute get splashScreen {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  static MaterialPageRoute get onboarding1Screen {
    return MaterialPageRoute(builder: (_) => const Onboarding1());
  }

  static MaterialPageRoute get onboarding2Screen {
    return MaterialPageRoute(builder: (_) => const Onboarding2());
  }

  static MaterialPageRoute get onboarding3Screen {
    return MaterialPageRoute(builder: (_) => const Onboarding3());
  }

  static MaterialPageRoute get loginScreen {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  static MaterialPageRoute get registerScreen {
    return MaterialPageRoute(builder: (_) => const RegisterScreen());
  }

  static MaterialPageRoute get historyScreen {
    return MaterialPageRoute(builder: (_) => const HistoryScreen());
  }

  static MaterialPageRoute get cameraScreen {
    return MaterialPageRoute(builder: (_) => const CameraScreen());
  }

  static MaterialPageRoute get profileScreen {
    return MaterialPageRoute(builder: (_) => const ProfileScreen());
  }

  static MaterialPageRoute get uploadImageScreen  {
    return MaterialPageRoute(builder: (_) => const UploadImageScreen());
  }

  static MaterialPageRoute get resultScreen  {
    return MaterialPageRoute(builder: (_) => const ResultScreen());
  }

  static MaterialPageRoute get aboutAppScreen  {
    return MaterialPageRoute(builder: (_) => const AboutAppScreen());
  }

  static MaterialPageRoute get settingsScreen  {
    return MaterialPageRoute(builder: (_) => const SettingsScreen());
  }
}
