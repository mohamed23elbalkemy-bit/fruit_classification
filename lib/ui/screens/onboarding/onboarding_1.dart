import 'package:flutter/material.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';
import '../../../core/routes/app_routes.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F8E5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const OnboardingIndicator(index: 0),
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
                  'assets/images/onboarding1.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 65),

            const Text(
              'Identify Fruit Instantly',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Scan or upload a fruit image and get instant classification.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const Spacer(),

            OnboardingButton(
              text: 'Next',
              onPressed: () {
                Navigator.push(context, AppRoutes.onboarding2Screen);
              },
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
