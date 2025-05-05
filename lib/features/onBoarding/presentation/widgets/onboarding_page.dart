import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/text_style.dart';

class OnboardingPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const OnboardingPage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120, color: color),
          const SizedBox(height: 40),
          AnimatedTextKit(
            repeatForever: false,
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                title,
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                description,
                textStyle: MyStyle.title16(context),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
