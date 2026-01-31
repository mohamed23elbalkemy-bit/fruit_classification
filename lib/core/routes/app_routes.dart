import 'package:flutter/material.dart';
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

}
