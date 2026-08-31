import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

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
      textTheme: GoogleFonts.syneTextTheme(
        ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(color: AppColors.darkTextMain, fontWeight: FontWeight.w400),
          bodyMedium: const TextStyle(color: AppColors.darkTextMain, fontWeight: FontWeight.w400),
        ),
      ),
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
      textTheme: GoogleFonts.syneTextTheme(
        ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: AppColors.lightTextMain, fontWeight: FontWeight.w400),
          bodyMedium: const TextStyle(color: AppColors.lightTextMain, fontWeight: FontWeight.w400),
        ),
      ),
      useMaterial3: true,
    );
  }

  static TextStyle get syne => GoogleFonts.syne();
  static TextStyle get instrumentSerif => GoogleFonts.instrumentSerif();
  static TextStyle get jetBrainsMono => GoogleFonts.jetBrainsMono();
}
