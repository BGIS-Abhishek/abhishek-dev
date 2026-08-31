import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'dart:ui' as ui;

class Navbar extends StatelessWidget {
  final bool isSolid;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onAboutTap;
  final VoidCallback onWorkTap;
  final VoidCallback onServicesTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.isSolid,
    required this.themeMode,
    required this.onToggleTheme,
    required this.onAboutTap,
    required this.onWorkTap,
    required this.onServicesTap,
    required this.onContactTap,
  });

  void _openMobileMenu(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: surfaceColor.withOpacity(0.96),
              padding: const EdgeInsets.fromLTRB(28, 24, 28, 48),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLogo(context),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              onToggleTheme();
                            },
                            icon: Icon(
                              AppColors.isDark(context) ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                              color: textColor,
                              size: 22,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close, color: textColor, size: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildMobileMenuItem(context, 'ABOUT', onAboutTap),
                  _buildMobileMenuItem(context, 'WORK', onWorkTap),
                  _buildMobileMenuItem(context, 'SERVICES', onServicesTap),
                  _buildMobileMenuItem(context, 'CONTACT', onContactTap),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onContactTap();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: AppColors.isDark(context) ? AppColors.darkInk : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text(
                        'HIRE ME',
                        style: AppTheme.jetBrainsMono.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0,
                          color: AppColors.isDark(context) ? AppColors.darkInk : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem(BuildContext context, String title, VoidCallback onTap) {
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTheme.syne.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: accentColor),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = isMobile ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.symmetric(horizontal: 48, vertical: 22);
    final solidPadding = isMobile ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12) : const EdgeInsets.symmetric(horizontal: 48, vertical: 16);
    final bgColor = AppColors.surface(context);
    final borderLine = AppColors.line(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: isSolid ? solidPadding : padding,
      decoration: BoxDecoration(
        color: isSolid ? bgColor.withOpacity(0.92) : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSolid ? borderLine : Colors.transparent,
          ),
        ),
      ),
      child: isSolid ? ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: _buildContent(context, isMobile),
        ),
      ) : _buildContent(context, isMobile),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    final textColor = AppColors.text(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(context),
        if (!isMobile) ...[
          Row(
            children: [
              _buildNavLinks(context),
              const SizedBox(width: 24),
              IconButton(
                onPressed: onToggleTheme,
                tooltip: 'Toggle Theme Mode',
                icon: Icon(
                  AppColors.isDark(context) ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                  color: textColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              _buildHireButton(context),
            ],
          ),
        ] else ...[
          Row(
            children: [
              IconButton(
                onPressed: onToggleTheme,
                icon: Icon(
                  AppColors.isDark(context) ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                  color: textColor,
                  size: 22,
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
    final accentColor = AppColors.accent(context);
    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.2,
          color: textColor,
        ),
        children: [
          const TextSpan(text: 'A'),
          TextSpan(
            text: '.',
            style: TextStyle(color: accentColor),
          ),
          const TextSpan(text: 'YADAV'),
        ],
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(text: 'ABOUT', onTap: onAboutTap),
        const SizedBox(width: 32),
        _NavLink(text: 'WORK', onTap: onWorkTap),
        const SizedBox(width: 32),
        _NavLink(text: 'SERVICES', onTap: onServicesTap),
        const SizedBox(width: 32),
        _NavLink(text: 'CONTACT', onTap: onContactTap),
      ],
    );
  }

  Widget _buildHireButton(BuildContext context) {
    final accentColor = AppColors.accent(context);
    return InkWell(
      onTap: onContactTap,
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(color: accentColor),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          'HIRE ME',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 11,
            letterSpacing: 1.6,
            color: accentColor,
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink({required this.text, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final subtleTextColor = AppColors.textSubtle(context);
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() => _isHovered = value),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 250),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 11,
          letterSpacing: 1.6,
          color: _isHovered ? accentColor : subtleTextColor,
        ),
        child: Text(widget.text),
      ),
    );
  }
}
