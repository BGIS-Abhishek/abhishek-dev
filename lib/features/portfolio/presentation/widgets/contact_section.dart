import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (_) {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

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

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Big Friendly Heading + "Start by saying hi"
        Expanded(
          flex: 12,
          child: RevealAnimation(
            isLeft: true,
            child: _buildLeftHeading(context, isMobile: false),
          ),
        ),
        const SizedBox(width: 80),
        // Right Column: Information & Direct Action Cards
        Expanded(
          flex: 10,
          child: RevealAnimation(
            delay: const Duration(milliseconds: 150),
            child: _buildRightInfo(context),
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
          child: _buildLeftHeading(context, isMobile: true),
        ),
        const SizedBox(height: 48),
        RevealAnimation(
          delay: const Duration(milliseconds: 120),
          child: _buildRightInfo(context),
        ),
      ],
    );
  }

  Widget _buildLeftHeading(BuildContext context, {required bool isMobile}) {
    final textColor = AppColors.text(context);
    final subtleColor = AppColors.textSubtle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: GoogleFonts.dmSans(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: AppColors.teal,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Let's make\nsomething\namazing together.",
          style: GoogleFonts.dmSans(
            fontSize: isMobile ? 38 : 56,
            fontWeight: FontWeight.w800,
            color: textColor,
            height: 1.1,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Have an exciting project, a Flutter role, or an idea to discuss? Drop a note — I respond within a few hours.',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: subtleColor,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 36),
        Row(
          children: [
            Text(
              'Start by ',
              style: GoogleFonts.dmSans(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            InkWell(
              onTap: () => _launch('mailto:yabhishek1906@gmail.com'),
              child: Text(
                'saying hi ↗',
                style: GoogleFonts.dmSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.redOrange,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.redOrange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _SocialPill(
              icon: FontAwesomeIcons.github,
              label: 'GitHub',
              onTap: () => _launch('https://github.com/BGIS-Abhishek'),
            ),
            _SocialPill(
              icon: FontAwesomeIcons.linkedinIn,
              label: 'LinkedIn',
              onTap: () => _launch('https://www.linkedin.com/in/abhishek-yadav-417612148'),
            ),
            _SocialPill(
              icon: FontAwesomeIcons.whatsapp,
              label: 'WhatsApp',
              onTap: () => _launch('https://wa.me/919768661441'),
            ),
            _SocialPill(
              icon: Icons.extension_rounded,
              label: 'pub.dev (wfs_layer)',
              onTap: () => _launch('https://pub.dev/packages/wfs_layer'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightInfo(BuildContext context) {
    final isDark = AppColors.isDark(context);
    final cardBg = isDark ? AppColors.darkInk2 : AppColors.surface(context);
    final textColor = AppColors.text(context);
    final borderColor = AppColors.line(context);

    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTACT INFORMATION',
            style: GoogleFonts.dmSans(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.8,
              color: AppColors.teal,
            ),
          ),
          const SizedBox(height: 28),
          _InfoRow(
            icon: Icons.location_on_rounded,
            iconColor: AppColors.teal,
            title: 'Location',
            detail: 'Mumbai, India (Open to Remote & Hybrid)',
          ),
          const SizedBox(height: 24),
          _InfoRow(
            icon: Icons.mail_outline_rounded,
            iconColor: AppColors.amber,
            title: 'Email',
            detail: 'yabhishek1906@gmail.com',
            onTap: () => _launch('mailto:yabhishek1906@gmail.com'),
          ),
          const SizedBox(height: 24),
          _InfoRow(
            icon: Icons.phone_android_rounded,
            iconColor: AppColors.redOrange,
            title: 'Phone / WhatsApp',
            detail: '+91 97686 61441',
            onTap: () => _launch('https://wa.me/919768661441'),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.teal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2E7D32),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Available for Flutter freelance projects & full-time opportunities.',
                    style: GoogleFonts.dmSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String detail;
  final VoidCallback? onTap;

  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.detail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final subtleColor = AppColors.textSubtle(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: subtleColor,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: GoogleFonts.dmSans(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialPill extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialPill({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialPill> createState() => _SocialPillState();
}

class _SocialPillState extends State<_SocialPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final borderColor = AppColors.line(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.teal : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: _isHovered ? AppColors.teal : borderColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 14,
                color: _isHovered ? Colors.white : textColor,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _isHovered ? Colors.white : textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
