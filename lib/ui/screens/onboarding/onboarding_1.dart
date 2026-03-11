import 'package:flutter/material.dart';
import '../../../core/widgets/onboarding_button.dart';
import '../../../core/widgets/onboarding_indicator.dart';
import '../../../core/routes/app_routes.dart';
import '../../../l10n/app_localizations.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
            const OnboardingIndicator(index: 0),
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
                  'assets/images/onboarding1.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 65),

            Text(
              loc.identifyFruitInstantly,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              loc.scanOrUploadFruit,
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
                Navigator.push(context, AppRoutes.onboarding2Screen);
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