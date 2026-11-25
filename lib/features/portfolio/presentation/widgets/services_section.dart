import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 56,
        vertical: isMobile ? 72 : 110,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile ? _buildMobile(context) : _buildDesktop(context),
        ),
      ),
    );
  }

  // ── DESKTOP: Left Stack of 3 Cards, Right Text + Stats ────────────────────
  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Stack of 3 rounded service cards
        Expanded(
          flex: 11,
          child: RevealAnimation(
            isLeft: true,
            child: _buildServiceCards(context),
          ),
        ),
        const SizedBox(width: 80),
        // Right Column: Headline, Narrative & Big Stats
        Expanded(
          flex: 12,
          child: RevealAnimation(
            delay: const Duration(milliseconds: 150),
            child: _buildRightContent(context, isMobile: false),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(
          isLeft: true,
          child: _buildRightContent(context, isMobile: true),
        ),
        const SizedBox(height: 48),
        RevealAnimation(
          delay: const Duration(milliseconds: 120),
          child: _buildServiceCards(context),
        ),
      ],
    );
  }

  // ── 3 ROUNDED SERVICE CARDS (Matches Dribbble Binjan exactly) ──────────────
  Widget _buildServiceCards(BuildContext context) {
    return Column(
      children: const [
        _ServiceCard(
          icon: Icons.phone_android_rounded,
          iconBgColor: Color(0xFF267365), // Deep Teal
          title: 'Mobile App Development',
          subtitle: 'Flutter, Android, iOS · 7+ Projects',
        ),
        SizedBox(height: 20),
        _ServiceCard(
          icon: Icons.map_rounded,
          iconBgColor: Color(0xFFF3A93B), // Warm Amber
          title: 'GIS & Mapping Solutions',
          subtitle: 'GPS, Geofencing, Field Surveys',
        ),
        SizedBox(height: 20),
        _ServiceCard(
          icon: Icons.hub_rounded,
          iconBgColor: Color(0xFFEE6344), // Coral Orange
          title: 'Architecture & Backend Sync',
          subtitle: 'BLoC, REST APIs, Offline SQLite',
        ),
      ],
    );
  }

  // ── RIGHT CONTENT: "What do I help?" + Stats ──────────────────────────────
  Widget _buildRightContent(BuildContext context, {required bool isMobile}) {
    final textColor = AppColors.text(context);
    final subtleColor = AppColors.textSubtle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What do I help?',
          style: GoogleFonts.dmSans(
            fontSize: isMobile ? 36 : 50,
            fontWeight: FontWeight.w800,
            color: textColor,
            letterSpacing: -1.0,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'I help teams and organizations find practical engineering solutions to turn ambitious ideas into polished, dependable digital products.',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            height: 1.65,
            color: subtleColor,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Specializing in Flutter cross-platform mobile apps, GIS geospatial mapping, and offline-first data sync architectures that perform seamlessly under real-world conditions.',
          style: GoogleFonts.dmSans(
            fontSize: 15,
            height: 1.65,
            color: subtleColor,
          ),
        ),
        const SizedBox(height: 44),
        // TWO BIG STATS (285+ Project Completed / 190+ Happy Clients style)
        Row(
          children: [
            _buildBigStat(context, '7+', 'Projects Completed'),
            const SizedBox(width: 56),
            _buildBigStat(context, '100k+', 'End Users Impacted'),
          ],
        ),
      ],
    );
  }

  Widget _buildBigStat(BuildContext context, String number, String label) {
    final textColor = AppColors.text(context);
    final subtleColor = AppColors.textSubtle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.dmSans(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: textColor,
            height: 1.0,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: subtleColor,
          ),
        ),
      ],
    );
  }
}

// ── Individual rounded card with circular icon badge ─────────────────────────
class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subtitle;

  const _ServiceCard({
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);
    final cardBg = isDark ? AppColors.darkInk2 : Colors.white;
    final textColor = AppColors.text(context);
    final subtleColor = AppColors.textSubtle(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isDark ? const Color(0x1AFFFFFF) : const Color(0x0F000000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? (isDark ? 0.3 : 0.08) : (isDark ? 0.15 : 0.04)),
              blurRadius: _isHovered ? 24 : 14,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Circular icon container matching Dribbble
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: widget.iconBgColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: widget.iconBgColor.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.dmSans(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.dmSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: subtleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
