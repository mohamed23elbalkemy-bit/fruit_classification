import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F8E5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const OnboardingIndicator(index: 2),
            const SizedBox(height: 60),

            Container(
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/onboarding3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 80),

            const Text(
              'Start Your Journey',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              "Let's classify your fruit now!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 60),

            OnboardingButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.push(context, AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
