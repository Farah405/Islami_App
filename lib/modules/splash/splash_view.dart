import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/modules/onboarding/onboarding.dart';
import 'package:islami_app/theme/AppAssets.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, onboarding.routeName);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.Splash),
            SizedBox(height: 48 ),
                 Image.asset(AppImages.logo , height: 70, width: 70,)
          ],
        ),
      )
    );
  }
}
