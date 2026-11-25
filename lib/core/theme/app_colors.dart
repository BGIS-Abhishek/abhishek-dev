import 'package:flutter/material.dart';

class AppColors {
  // ── WARM LIGHT PALETTE (Binjan-inspired: cream, teal, amber) ──
  static const Color cream       = Color(0xFFF5F0E8); // main bg
  static const Color cream2      = Color(0xFFEDE7DB); // section alt bg
  static const Color cream3      = Color(0xFFE4DDD1); // subtle surface
  static const Color darkNavy    = Color(0xFF1A2332); // primary text
  static const Color darkNavy2   = Color(0xFF243040); // footer/dark sections
  static const Color teal        = Color(0xFF2A7A6B); // primary accent
  static const Color teal2       = Color(0xFF3A9B88); // accent hover
  static const Color amber       = Color(0xFFE8A020); // secondary accent
  static const Color amber2      = Color(0xFFF0B040); // amber hover
  static const Color redOrange   = Color(0xFFE05A2B); // tertiary / cta
  static const Color warmMuted   = Color(0xFF7A7268); // body text
  static const Color warmMuted2  = Color(0xFFA89E92); // caption text
  static const Color warmBorder  = Color(0x1A1A2332); // subtle border (8%)
  static const Color warmBorder2 = Color(0x261A2332); // stronger border (15%)

  // ── DARK PALETTE (kept for dark mode toggle) ──
  static const Color darkInk     = Color(0xFF1A2332);
  static const Color darkInk2    = Color(0xFF243040);
  static const Color darkInk3    = Color(0xFF2E3D52);
  static const Color darkAccent  = Color(0xFF3A9B88);
  static const Color darkAccent2 = Color(0xFF4DB8A3);
  static const Color darkMuted   = Color(0xFF64748B);
  static const Color darkMuted2  = Color(0xFF94A3B8);
  static const Color darkBorder  = Color(0x1AFFFFFF);
  static const Color darkBorder2 = Color(0x2EFFFFFF);
  static const Color darkText    = Color(0xFFF5F0E8);

  // ── LEGACY ALIASES (for backwards compat) ──
  static const Color ink         = darkInk;
  static const Color ink2        = darkInk2;
  static const Color ink3        = darkInk3;
  static const Color lime        = teal;
  static const Color lime2       = teal2;
  static const Color muted       = warmMuted;
  static const Color muted2      = warmMuted2;
  static const Color border      = warmBorder;
  static const Color border2     = warmBorder2;
  static const Color textMain    = darkNavy;
  static const Color textMuted   = warmMuted;

  // ── ADAPTIVE GETTERS ──
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color bg(BuildContext context)          => isDark(context) ? darkInk     : cream;
  static Color surface(BuildContext context)     => isDark(context) ? darkInk2    : cream2;
  static Color elevated(BuildContext context)    => isDark(context) ? darkInk3    : cream3;
  static Color accent(BuildContext context)      => isDark(context) ? darkAccent  : teal;
  static Color accentHover(BuildContext context) => isDark(context) ? darkAccent2 : teal2;
  static Color text(BuildContext context)        => isDark(context) ? darkText    : darkNavy;
  static Color textSubtle(BuildContext context)  => isDark(context) ? darkMuted2  : warmMuted;
  static Color textCaption(BuildContext context) => isDark(context) ? darkMuted   : warmMuted2;
  static Color line(BuildContext context)        => isDark(context) ? darkBorder  : warmBorder;
  static Color line2(BuildContext context)       => isDark(context) ? darkBorder2 : warmBorder2;
}
