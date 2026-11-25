import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkInk,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkAccent,
        secondary: AppColors.darkAccent2,
        surface: AppColors.darkInk2,
        error: Colors.redAccent,
      ),
      textTheme: AppTypography.textTheme(AppColors.darkText),
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme.light(
        primary: AppColors.teal,
        secondary: AppColors.amber,
        surface: AppColors.cream2,
        error: Colors.redAccent,
      ),
      textTheme: AppTypography.textTheme(AppColors.darkNavy),
      useMaterial3: true,
    );
  }

  // Font shorthands — now all pointing to warm fonts
  static TextStyle get syne          => AppTypography.syne;
  static TextStyle get inter         => AppTypography.inter;
  static TextStyle get jetBrainsMono => AppTypography.jetBrainsMono;
  static TextStyle get instrumentSerif => AppTypography.playfair;
  static TextStyle get caveat        => AppTypography.caveat;
}

