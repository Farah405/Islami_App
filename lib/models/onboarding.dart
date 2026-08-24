 import 'package:islami_app/theme/AppAssets.dart';

import '../modules/onboarding/onboarding.dart';

class Onboarding{
  String imagepath;
  String title ;
  String? describtion ;
 Onboarding({required this.imagepath , required this.title , this.describtion})
   ;
 static List<Onboarding> onboardingList =
 [
   Onboarding(imagepath: AppImages.onboarding1, title: 'Welcome To Islmi App'),
   Onboarding(imagepath: AppImages.onboarding2, title: 'Welcome To Islmi' , describtion: 'We Are Very Excited To Have You In Our Community'),
   Onboarding(imagepath: AppImages.onboarding3, title: 'Reading the Quran' , describtion: 'Read, and your Lord is the Most Generous'),
   Onboarding(imagepath: AppImages.onboarding4, title: 'Bearish', describtion: 'Praise the name of your Lord, the Most High'),
   Onboarding(imagepath: AppImages.onboarding5, title: 'Holy Quran Radio',describtion: 'You can listen to the Holy Quran Radio through the application for free and easily'),
 ];

 }
