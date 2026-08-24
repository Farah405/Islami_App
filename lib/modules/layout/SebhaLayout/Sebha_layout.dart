import 'package:flutter/material.dart';
import 'package:islami_app/theme/AppAssets.dart';

class SebhaLayout extends StatefulWidget {
  const SebhaLayout({super.key});

  @override
  State<SebhaLayout> createState() => _SebhaLayoutState();
}

class _SebhaLayoutState extends State<SebhaLayout> {
  final List<String> tasbehList = ["الله اكبر", "الحمد لله", "سبحان الله"];
  int counter = 0;
  int tasbehIndex = 0;
  late String tasbehTitle = tasbehList[tasbehIndex];
  double turns = 0;

  void _updateTasbeeh() {
    setState(() {
      counter++;
      turns += 1 / 4;

      if (counter == 33) {
        tasbehIndex = (tasbehIndex + 1) % tasbehList.length;
        tasbehTitle = tasbehList[tasbehIndex];
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child:
          Image.asset(AppImages.upperLogo)),
          const SizedBox(height: 16),
          Center(child: Text(tasbehTitle, style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white,),
          )),
          SizedBox(height: 16),
          Image.asset("assets/images/SebhaHead.png",
              width: 50,
              height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 200),
                  child: InkWell(
                    onTap: _updateTasbeeh,
                    child: Image.asset(
                      "assets/images/SebhaBody 1.png",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      counter.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  }

