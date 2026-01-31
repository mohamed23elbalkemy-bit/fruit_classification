import 'package:flutter/material.dart';
import 'package:fruit_classification/ui/screens/auth/login_screen.dart';
import 'package:fruit_classification/ui/screens/auth/register_screen.dart';
import 'package:fruit_classification/ui/screens/camera/camera_screen.dart';
import 'package:fruit_classification/ui/screens/history/history_screen.dart';
import 'package:fruit_classification/ui/screens/profile/profile_screen.dart';
import '../../ui/screens/onboarding/onboarding_1.dart';
import '../../ui/screens/onboarding/onboarding_2.dart';
import '../../ui/screens/onboarding/onboarding_3.dart';

abstract final class AppRoutes {

  static MaterialPageRoute get onboarding1 {
    return MaterialPageRoute(builder: (_) => const Onboarding1());
  }

  static MaterialPageRoute get onboarding2 {
    return MaterialPageRoute(builder: (_) => const Onboarding2());
  }

  static MaterialPageRoute get onboarding3 {
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

}
