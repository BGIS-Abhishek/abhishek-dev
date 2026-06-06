import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'dart:ui' as ui;

class Navbar extends StatelessWidget {
  final bool isSolid;
  final VoidCallback onAboutTap;
  final VoidCallback onWorkTap;
  final VoidCallback onServicesTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.isSolid,
    required this.onAboutTap,
    required this.onWorkTap,
    required this.onServicesTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = isMobile ? const EdgeInsets.symmetric(horizontal: 20, vertical: 16) : const EdgeInsets.symmetric(horizontal: 48, vertical: 22);
    final solidPadding = isMobile ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12) : const EdgeInsets.symmetric(horizontal: 48, vertical: 16);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: isSolid ? solidPadding : padding,
      decoration: BoxDecoration(
        color: isSolid ? AppColors.ink.withOpacity(0.92) : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSolid ? AppColors.border : Colors.transparent,
          ),
        ),
      ),
      child: isSolid ? ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: _buildContent(isMobile),
        ),
      ) : _buildContent(isMobile),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        if (!isMobile) ...[
          _buildNavLinks(),
          _buildHireButton(),
        ],
      ],
    );
  }

  Widget _buildLogo() {
    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: 12.5, // ~0.78rem
          fontWeight: FontWeight.w700,
          letterSpacing: 2.2, // 0.18em
          color: AppColors.textMain,
        ),
        children: const [
          TextSpan(text: 'A'),
          TextSpan(
            text: '.',
            style: TextStyle(color: AppColors.lime),
          ),
          TextSpan(text: 'YADAV'),
        ],
      ),
    );
  }

  Widget _buildNavLinks() {
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

  Widget _buildHireButton() {
    return InkWell(
      onTap: onContactTap,
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lime),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          'HIRE ME',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 11, // ~0.68rem
            letterSpacing: 1.6, // 0.1em
            color: AppColors.lime,
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
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() => _isHovered = value),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 250),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 11, // ~0.68rem
          letterSpacing: 1.6, // 0.1em
          color: _isHovered ? AppColors.lime : AppColors.muted2,
        ),
        child: Text(widget.text),
      ),
    );
  }
}
