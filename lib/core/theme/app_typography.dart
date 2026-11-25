import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Typography — Binjan-inspired warm editorial palette
/// 1. Playfair Display — Headings / Display (serif, editorial, human)
/// 2. DM Sans          — Body / UI (warm humanist sans-serif)
/// 3. Caveat           — Logo / handwritten accent
class AppTypography {
  static TextStyle get playfair  => GoogleFonts.playfairDisplay();
  static TextStyle get dmSans    => GoogleFonts.dmSans();
  static TextStyle get caveat    => GoogleFonts.caveat();

  // Keep these aliases so existing code using AppTheme.syne/inter/jetBrainsMono compiles
  static TextStyle get syne         => GoogleFonts.playfairDisplay();
  static TextStyle get inter        => GoogleFonts.dmSans();
  static TextStyle get jetBrainsMono => GoogleFonts.dmSans();

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        color: textColor,
        height: 1.05,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.08,
        letterSpacing: -1.0,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.12,
        letterSpacing: -0.5,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.2,
      ),
      titleLarge: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16.5,
        fontWeight: FontWeight.w400,
        height: 1.75,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: textColor,
      ),
      labelLarge: GoogleFonts.dmSans(
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.4,
        color: textColor,
      ),
      labelSmall: GoogleFonts.dmSans(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
        color: textColor,
      ),
    );
  }
}

