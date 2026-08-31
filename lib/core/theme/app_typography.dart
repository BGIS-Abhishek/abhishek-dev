import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Typography configuration for the portfolio.
/// 
/// 1. Syne — Primary Brand / Display Font (Headings, titles, numbers, CTAs)
/// 2. Inter — Body / UI Font (Paragraphs, descriptions, navigation, body copy)
/// 3. JetBrains Mono — Technical Font (Tech badges, tags, code blocks, metadata)
class AppTypography {
  static TextStyle get syne => GoogleFonts.syne();
  static TextStyle get inter => GoogleFonts.inter();
  static TextStyle get jetBrainsMono => GoogleFonts.jetBrainsMono();

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.syne(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        color: textColor,
        height: 1.05,
        letterSpacing: -0.02,
      ),
      displayMedium: GoogleFonts.syne(
        fontSize: 56,
        fontWeight: FontWeight.w800,
        color: textColor,
        height: 1.05,
        letterSpacing: -0.01,
      ),
      headlineLarge: GoogleFonts.syne(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.1,
      ),
      headlineMedium: GoogleFonts.syne(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      titleLarge: GoogleFonts.syne(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.8,
        fontWeight: FontWeight.w400,
        height: 1.8,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.4,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: textColor,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 11.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.6,
        color: textColor,
      ),
      labelSmall: GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
        color: textColor,
      ),
    );
  }
}
