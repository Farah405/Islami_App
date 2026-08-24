import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/theme/AppAssets.dart';

class RadioLayout extends StatelessWidget {
  const RadioLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.radioBackground),
            fit: BoxFit.cover,
          ),
        )
        );
  }
}
