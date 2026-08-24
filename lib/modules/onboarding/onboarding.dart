import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/models/onboarding.dart';
import 'package:islami_app/modules/layout/layout_screen.dart';
import 'package:islami_app/theme/AppAssets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardingwidget.dart';

class onboarding extends StatefulWidget {
  static const String routeName = 'onboarding';
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppImages.upperLogo,
                height: MediaQuery.of(context).size.height * 0.75 * 0.25,
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) => setState(() => currentPage = index),
                  itemCount: Onboarding.onboardingList.length,
                  itemBuilder: (context, index) => onboardingwidget(
                    onboarding: Onboarding.onboardingList[index],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // زر Back
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontSize: 16,
                        ),
                      ),
                    ),

                    SmoothPageIndicator(
                      controller: pageController,
                      count: Onboarding.onboardingList.length,
                      effect: const WormEffect(
                        activeDotColor: Color(0xFFE2BE7F),
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 8,
                      ),
                      onDotClicked: (index) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),

                    // زر Next
                    TextButton(
                      onPressed: () {
                        if (currentPage ==
                            Onboarding.onboardingList.length - 1) {
                          Navigator.pushReplacementNamed(
                            context,
                            LayoutScreen.routeName,
                          );
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
