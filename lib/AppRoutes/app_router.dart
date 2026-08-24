import 'package:flutter/cupertino.dart';
import 'package:islami_app/AppRoutes/app_routes.dart';
import 'package:islami_app/modules/layout/QuranLayout/Quran_layout.dart';
import 'package:islami_app/modules/layout/QuranLayout/Widgets/Qurandetails.dart';
import 'package:islami_app/modules/onboarding/onboarding.dart';
import 'package:islami_app/modules/splash/splash_view.dart';

abstract class AppRouter {
  static Map <String , Widget Function(BuildContext)> routes = {
    AppRoutes.initial: (context) => const SplashView(),
    AppRoutes.splash: (context) => const SplashView(),
    AppRoutes.intro: (context) => const onboarding(),
    AppRoutes.home: (context) => const QuranLayout(),
    AppRoutes.quran: (context) => const Qurandetails(suraId: 1, suraName: 'Sura Name', englishName: 'English Name'),
  };
}