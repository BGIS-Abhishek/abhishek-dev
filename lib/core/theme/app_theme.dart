import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkInk,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkLime,
        secondary: AppColors.darkLime2,
        surface: AppColors.darkInk2,
        error: Colors.redAccent,
      ),
      textTheme: AppTypography.textTheme(AppColors.darkTextMain),
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightInk,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightLime,
        secondary: AppColors.lightLime2,
        surface: AppColors.lightInk2,
        error: Colors.redAccent,
      ),
      textTheme: AppTypography.textTheme(AppColors.lightTextMain),
      useMaterial3: true,
    );
  }

  static TextStyle get syne => AppTypography.syne;
  static TextStyle get inter => AppTypography.inter;
  static TextStyle get jetBrainsMono => AppTypography.jetBrainsMono;
  static TextStyle get instrumentSerif => AppTypography.syne;
}
