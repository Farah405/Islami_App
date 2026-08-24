import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/HadethLayout/Hadeth_layout.dart';
import 'package:islami_app/modules/layout/QuranLayout/Quran_layout.dart';
import 'package:islami_app/modules/layout/RadioLayout/Radio_layout.dart';
import 'package:islami_app/modules/layout/SebhaLayout/Sebha_layout.dart';
import 'package:islami_app/modules/layout/TimerLayout/Timer_layout.dart';
import 'package:islami_app/theme/AppAssets.dart';
import 'package:islami_app/theme/App_Colors.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout';

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutState();
}

class _LayoutState extends State<LayoutScreen> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const QuranLayout(),
    const RadioLayout(),
    const SebhaLayout(),
    const HadethLayout(),
    const TimerLayout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavigationItem(AppIcons.QuranIcon, 'Quran', 0),
                _buildNavigationItem(AppIcons.radioIcon, 'Radio', 1),
                _buildNavigationItem(AppIcons.NecklaceIcon, 'Sebha', 2),
                _buildNavigationItem(AppIcons.hadethIcon, 'Hadeth', 3),
                _buildNavigationItem(AppIcons.TimeIcon, 'Time', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem(String iconPath, String label, int index) {
    final isSelected = selectedIndex == index;
    final iconColor = isSelected ? AppColors.white : Colors.black;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 10, ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF20202099) : Colors.transparent,
          borderRadius: BorderRadius.circular(90),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(AssetImage(iconPath), color: iconColor, size: 24),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: iconColor,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
