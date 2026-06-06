import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.ink,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.lime,
        secondary: AppColors.lime2,
        surface: AppColors.ink2,
        background: AppColors.ink,
        error: Colors.redAccent,
      ),
      textTheme: GoogleFonts.syneTextTheme(
        ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w400),
          bodyMedium: const TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w400),
        ),
      ),
      useMaterial3: true,
    );
  }

  static TextStyle get syne => GoogleFonts.syne();
  static TextStyle get instrumentSerif => GoogleFonts.instrumentSerif();
  static TextStyle get jetBrainsMono => GoogleFonts.jetBrainsMono();
}
