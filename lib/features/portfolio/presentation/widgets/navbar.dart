import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'dart:ui' as ui;

class Navbar extends StatelessWidget {
  final bool isSolid;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onAboutTap;
  final VoidCallback onWorkTap;
  final VoidCallback onServicesTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.isSolid,
    required this.themeMode,
    required this.onToggleTheme,
    required this.onAboutTap,
    required this.onWorkTap,
    required this.onServicesTap,
    this.onExperienceTap,
    required this.onContactTap,
  });

  void _openMobileMenu(BuildContext context) {
    final bgColor = AppColors.bg(context);
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);
    final borderColor = AppColors.line2(context);
    final isDark = AppColors.isDark(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: Container(
                color: bgColor.withOpacity(0.97),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Drag handle
                    Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 4),
                      child: Center(
                        child: Container(
                          width: 36, height: 4,
                          decoration: BoxDecoration(
                            color: borderColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    // Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLogo(context),
                          Row(
                            children: [
                              IconButton(
                                onPressed: onToggleTheme,
                                icon: Icon(
                                  isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                                  color: textColor, size: 20,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.close_rounded, color: textColor, size: 22),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(color: borderColor, height: 1, indent: 24, endIndent: 24),
                    _buildMobileItem(context, 'Services', onServicesTap),
                    _buildMobileItem(context, 'Work', onWorkTap),
                    _buildMobileItem(context, 'Experience', onExperienceTap ?? onAboutTap),
                    _buildMobileItem(context, 'About', onAboutTap),
                    _buildMobileItem(context, 'Contact', onContactTap),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                      child: GestureDetector(
                        onTap: () { Navigator.pop(context); onContactTap(); },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Hire Me',
                            style: GoogleFonts.dmSans(
                              fontSize: 15, fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileItem(BuildContext context, String title, VoidCallback onTap) {
    final textColor = AppColors.text(context);
    return InkWell(
      onTap: () { Navigator.pop(context); onTap(); },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 26, fontWeight: FontWeight.w700,
            color: textColor, letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: isMobile
          ? EdgeInsets.symmetric(horizontal: 20, vertical: isSolid ? 12 : 16)
          : EdgeInsets.symmetric(horizontal: 56, vertical: isSolid ? 14 : 20),
      decoration: BoxDecoration(
        color: isSolid ? bgColor.withOpacity(0.92) : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSolid ? AppColors.line2(context) : Colors.transparent,
          ),
        ),
      ),
      child: isSolid
          ? ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: _buildContent(context, isMobile),
              ),
            )
          : _buildContent(context, isMobile),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    final textColor = AppColors.text(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(context),
        if (!isMobile) ...[
          _buildDesktopLinks(context),
          Row(
            children: [
              IconButton(
                onPressed: onToggleTheme,
                tooltip: 'Toggle Theme',
                icon: Icon(
                  AppColors.isDark(context) ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                  color: textColor, size: 20,
                ),
              ),
              const SizedBox(width: 8),
              _buildHireBtn(context),
            ],
          ),
        ] else ...[
          Row(
            children: [
              IconButton(
                onPressed: onToggleTheme,
                icon: Icon(
                  AppColors.isDark(context) ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                  color: textColor, size: 22,
                ),
              ),
              IconButton(
                onPressed: () => _openMobileMenu(context),
                icon: Icon(Icons.menu_rounded, color: textColor, size: 26),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildLogo(BuildContext context) {
    final textColor = AppColors.text(context);
    return Text(
      'Abhishek',
      style: GoogleFonts.caveat(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: textColor,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildDesktopLinks(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PillNavLink(text: 'Services',   isActive: true, onTap: onServicesTap),
        const SizedBox(width: 4),
        _PillNavLink(text: 'Works',      onTap: onWorkTap),
        const SizedBox(width: 4),
        _PillNavLink(text: 'Experience', onTap: onExperienceTap ?? onAboutTap),
        const SizedBox(width: 4),
        _PillNavLink(text: 'About',      onTap: onAboutTap),
        const SizedBox(width: 4),
        _PillNavLink(text: 'Contact',    onTap: onContactTap),
      ],
    );
  }

  Widget _buildHireBtn(BuildContext context) {
    return _HireButton(onTap: onContactTap);
  }
}

// ── Pill Nav Link ─────────────────────────────────────────────────────────────
class _PillNavLink extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;
  const _PillNavLink({required this.text, this.isActive = false, required this.onTap});

  @override
  State<_PillNavLink> createState() => _PillNavLinkState();
}

class _PillNavLinkState extends State<_PillNavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final bool filled = widget.isActive || _hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            color: filled ? textColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: filled ? AppColors.bg(context) : textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Hire Me Button ────────────────────────────────────────────────────────────
class _HireButton extends StatefulWidget {
  final VoidCallback onTap;
  const _HireButton({required this.onTap});

  @override
  State<_HireButton> createState() => _HireButtonState();
}

class _HireButtonState extends State<_HireButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final teal = AppColors.accent(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered ? teal : Colors.transparent,
            border: Border.all(color: teal),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            'Hire Me',
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _hovered ? Colors.white : teal,
            ),
          ),
        ),
      ),
    );
  }
}
