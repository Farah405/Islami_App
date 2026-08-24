import 'package:flutter/material.dart';
import 'package:islami_app/theme/AppAssets.dart';
import 'package:islami_app/theme/App_Colors.dart';

class Qurandetails extends StatelessWidget {
  final int suraId;
  final String suraName;
  final String englishName;

  const Qurandetails({super.key, required this.suraId, required this.suraName, required this.englishName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
        ),
        centerTitle: true,
        title: Text(
          englishName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context).loadString('assets/files/Quran/$suraId.txt'),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Unable to load this Sura.'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.LeftCorner, width: 90, height: 90),
                          Flexible(
                            child: Text(
                              suraName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          Image.asset(AppImages.RightCorner, width: 90, height: 90),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        snapshot.data!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          height: 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Image.asset(AppImages.BottomCorner),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}
