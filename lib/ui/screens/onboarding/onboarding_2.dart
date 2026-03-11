import 'package:flutter/material.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';
import '../../../core/routes/app_routes.dart';
import '../../../l10n/app_localizations.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                color: isDark
                    ? Theme.of(context).cardColor
                    : const Color(0xFFDFF5E3),
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
                        color: isDark
                            ? Theme.of(context).cardColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        loc.accuracy99,
                        style: const TextStyle(
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

            Text(
              loc.highAccuracyClassification,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              loc.aiDetectsFruit,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey.shade400 : Colors.grey,
              ),
            ),

            const Spacer(),

            OnboardingButton(
              text: loc.next,
              onPressed: () {
                Navigator.push(context, AppRoutes.onboarding3Screen);
              },
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, AppRoutes.loginScreen);
              },
              child: Text(
                loc.skip,
                style: TextStyle(
                  color: isDark ? Colors.grey.shade400 : Colors.grey,
                  fontSize: 16,
                ),
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

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: isDark ? Theme.of(context).cardColor : Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.crop_free,
          color: Color(0xFF4CAF50),
          size: 22,
        ),
      ),
    );
  }
}