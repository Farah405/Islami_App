import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/models/suras_list.dart';

import '../../../../theme/AppAssets.dart';
import '../../../../theme/App_Colors.dart';

class QurandetailsBackground extends StatelessWidget {
  final String suraName;
  final String englishName;


  const QurandetailsBackground({super.key, required this.suraName , required this.englishName ,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(AppImages.LeftCorner,
                        width: 90,
                        height: 90,),
                      Text(suraName ,style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ), )
                      ,Image.asset(AppImages.RightCorner,
                        width: 90,
                        height: 90,)
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(AppImages.BottomCorner)
              ],


      ),
    );


  }
}
