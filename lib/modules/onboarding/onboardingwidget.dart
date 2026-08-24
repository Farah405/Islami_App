import 'package:flutter/material.dart';
import 'package:islami_app/models/onboarding.dart';
import 'package:islami_app/theme/App_Colors.dart';

class onboardingwidget extends StatelessWidget {
  onboardingwidget({super.key, required this.onboarding});
  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: Image.asset(
              onboarding.imagepath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            onboarding.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            onboarding.describtion ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
