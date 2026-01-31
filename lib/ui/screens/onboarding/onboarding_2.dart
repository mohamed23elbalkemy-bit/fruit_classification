import 'package:flutter/material.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';
import '../../../core/routes/app_routes.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F8E5),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const OnboardingIndicator(index: 1),
            const SizedBox(height: 40),

            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFDFF5E3),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Transform.scale(
                      scale: 1.15,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/images/onboarding2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        '99% Accuracy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    right: 20,
                    child: Column(
                      children: [
                        _FloatingIcon(
                          icon: Icons.crop_free,
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        _FloatingIcon(
                          icon: Icons.bolt,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            const Text(
              'High Accuracy Classification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'Our AI model detects fruit type and quality.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const Spacer(),

            OnboardingButton(
              text: 'Next',
              onPressed: () {
                Navigator.push(context, AppRoutes.onboarding3);
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

class _FloatingIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _FloatingIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xFF4CAF50),
          size: 22,
        ),
      ),
    );
  }
}
