import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int index;

  const OnboardingIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: i == index ? 32 : 24,
          height: 6,
          decoration: BoxDecoration(
            color: i == index
                ? const Color(0xFF4CAF50)
                : const Color(0xFFC8E6C9),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
