import 'package:flutter/material.dart';
import 'package:islami_app/modules/onboarding/onboarding.dart';
import 'package:islami_app/modules/layout/layout_screen.dart';
import 'theme/AppThemManger.dart';
import 'modules/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.themeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        onboarding.routeName: (context) => const onboarding(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
      },
    );
  }
}
