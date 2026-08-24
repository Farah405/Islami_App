import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/theme/AppAssets.dart';

class TimerLayout extends StatelessWidget {
  const TimerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.quranBackground),
            fit: BoxFit.cover,
          ),
        )
        );
  }
}
