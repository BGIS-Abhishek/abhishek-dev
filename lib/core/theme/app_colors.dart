import 'package:flutter/material.dart';

class AppColors {
  // Dark Palette (Current Sleek Dark Slate)
  static const Color darkInk = Color(0xFF0F172A);
  static const Color darkInk2 = Color(0xFF1E293B);
  static const Color darkInk3 = Color(0xFF334155);
  static const Color darkLime = Color(0xFFC8F041);
  static const Color darkLime2 = Color(0xFFD4F55A);
  static const Color darkMuted = Color(0xFF64748B);
  static const Color darkMuted2 = Color(0xFF94A3B8);
  static const Color darkBorder = Color(0x2EFFFFFF);
  static const Color darkBorder2 = Color(0x45FFFFFF);
  static const Color darkTextMain = Color(0xFFF8FAFC);

  // Light Palette (Crisp High-Contrast Light Mode)
  static const Color lightInk = Color(0xFFF8FAFC);
  static const Color lightInk2 = Color(0xFFFFFFFF);
  static const Color lightInk3 = Color(0xFFF1F5F9);
  static const Color lightLime = Color(0xFF059669);
  static const Color lightLime2 = Color(0xFF10B981);
  static const Color lightMuted = Color(0xFF64748B);
  static const Color lightMuted2 = Color(0xFF475569);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightBorder2 = Color(0xFFCBD5E1);
  static const Color lightTextMain = Color(0xFF0F172A);

  // Legacy static fallbacks
  static const Color ink = darkInk;
  static const Color ink2 = darkInk2;
  static const Color ink3 = darkInk3;
  static const Color lime = darkLime;
  static const Color lime2 = darkLime2;
  static const Color muted = darkMuted;
  static const Color muted2 = darkMuted2;
  static const Color border = darkBorder;
  static const Color border2 = darkBorder2;
  static const Color textMain = darkTextMain;
  static const Color textMuted = darkMuted2;

  // Adaptive Theme Context Getters
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color bg(BuildContext context) => isDark(context) ? darkInk : lightInk;
  static Color surface(BuildContext context) => isDark(context) ? darkInk2 : lightInk2;
  static Color elevated(BuildContext context) => isDark(context) ? darkInk3 : lightInk3;
  static Color accent(BuildContext context) => isDark(context) ? darkLime : lightLime;
  static Color accentHover(BuildContext context) => isDark(context) ? darkLime2 : lightLime2;
  static Color text(BuildContext context) => isDark(context) ? darkTextMain : lightTextMain;
  static Color textSubtle(BuildContext context) => isDark(context) ? darkMuted2 : lightMuted2;
  static Color textCaption(BuildContext context) => isDark(context) ? darkMuted : lightMuted;
  static Color line(BuildContext context) => isDark(context) ? darkBorder : lightBorder;
  static Color line2(BuildContext context) => isDark(context) ? darkBorder2 : lightBorder2;
}
