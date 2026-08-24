import 'package:flutter/material.dart';
import 'App_Colors.dart';

class AppThemeManager {
  static ThemeData get themeData => ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.Dark,
      );
}
