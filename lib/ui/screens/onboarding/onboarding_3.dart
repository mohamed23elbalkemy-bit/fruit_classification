import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';
import '../../../l10n/app_localizations.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
            const OnboardingIndicator(index: 2),
            const SizedBox(height: 60),

            Container(
              height: 260,
              decoration: BoxDecoration(
                color: isDark ? Theme.of(context).cardColor : Colors.white,
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

            Text(
              loc.startYourJourney,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              loc.letsClassifyFruit,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey.shade400 : Colors.grey,
              ),
            ),

            const SizedBox(height: 60),

            OnboardingButton(
              text: loc.getStarted,
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