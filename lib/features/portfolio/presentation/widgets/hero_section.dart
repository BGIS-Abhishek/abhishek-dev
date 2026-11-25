import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onWorkPressed;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onWorkPressed,
    required this.onContactPressed,
  });

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (_) {
      if (await canLaunchUrl(uri)) launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: AppColors.bg(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: isMobile
              ? _buildMobile(context, size)
              : _buildDesktop(context, size),
        ),
      ),
    );
  }

  // ── DESKTOP: 3-Column Layout from Dribbble Reference ───────────────────────
  Widget _buildDesktop(BuildContext context, Size size) {
    final heroHeight = (size.height * 0.92).clamp(620.0, 840.0);

    return Container(
      height: heroHeight,
      padding: const EdgeInsets.fromLTRB(56, 90, 56, 36),
      child: Stack(
        children: [
          // CENTER LAYER: Brushstroke & Portrait
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: heroHeight - 110,
                width: 460,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    // Dynamic teal brushstroke behind portrait
                    Positioned(
                      top: 40,
                      left: -70,
                      right: -70,
                      bottom: 40,
                      child: _buildBrushstroke(),
                    ),
                    // Developer portrait
                    Positioned(
                      bottom: 0,
                      child: _buildAvatar(context, height: heroHeight * 0.68),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // LEFT COLUMN: Headline, Email, Experience Badge
          Positioned(
            left: 0,
            top: 20,
            bottom: 20,
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeadline(context, isMobile: false),
                const Spacer(),
                _buildEmail(context),
                const SizedBox(height: 28),
                _buildExpBadge(context),
              ],
            ),
          ),

          // RIGHT COLUMN: Tagline & Certification Seal
          Positioned(
            right: 0,
            top: 60,
            bottom: 20,
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildTagline(context),
                const Spacer(),
                _buildCertBadge(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── MOBILE: Stacked Vertical Layout ────────────────────────────────────────
  Widget _buildMobile(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadline(context, isMobile: true),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _buildTagline(context)),
              const SizedBox(width: 16),
              _buildEmail(context),
            ],
          ),
          const SizedBox(height: 36),
          // Portrait & brushstroke
          Center(
            child: SizedBox(
              height: 360,
              width: 320,
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 20,
                    left: -30,
                    right: -30,
                    bottom: 30,
                    child: _buildBrushstroke(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: _buildAvatar(context, height: 320),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildExpBadge(context),
              _buildCertBadge(context),
            ],
          ),
          const SizedBox(height: 36),
          _buildActions(context),
        ],
      ),
    );
  }

  // ── HEADLINE ──────────────────────────────────────────────────────────────
  Widget _buildHeadline(BuildContext context, {required bool isMobile}) {
    final color = AppColors.text(context);
    final fontSize = isMobile ? 42.0 : 68.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Hey There,',
          style: GoogleFonts.dmSans(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.5,
            color: color,
          ),
        ),
        Text(
          "I'm Abhishek",
          style: GoogleFonts.dmSans(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.5,
            color: color,
          ),
        ),
      ],
    );
  }

  // ── BRUSHSTROKE ───────────────────────────────────────────────────────────
  Widget _buildBrushstroke() {
    return Transform.rotate(
      angle: -0.15,
      child: Image.asset(
        'assets/images/brushstroke.jpg',
        fit: BoxFit.contain,
        color: const Color(0xFF1E6C5E).withValues(alpha: 0.90),
        colorBlendMode: BlendMode.srcATop,
        errorBuilder: (_, __, ___) => CustomPaint(
          painter: _BrushstrokePainter(),
        ),
      ),
    );
  }

  // ── PORTRAIT AVATAR ───────────────────────────────────────────────────────
  Widget _buildAvatar(BuildContext context, {required double height}) {
    final isDark = AppColors.isDark(context);
    final width = height * 0.72;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2E3D52) : const Color(0xFFEDE5D8),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width / 2),
        ),
        child: Image.asset(
          'assets/images/abhishek_portrait.jpg',
          width: width,
          height: height,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (_, __, ___) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_rounded,
                  size: height * 0.3,
                  color: AppColors.teal,
                ),
                Text(
                  'Abhishek Yadav',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    color: AppColors.text(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── EMAIL LINK ────────────────────────────────────────────────────────────
  Widget _buildEmail(BuildContext context) {
    return InkWell(
      onTap: () => _launch('mailto:yabhishek1906@gmail.com'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'yabhishek1906@gmail.com',
            style: GoogleFonts.dmSans(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: AppColors.redOrange,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 1.5,
            width: 170,
            color: AppColors.redOrange.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }

  // ── EXPERIENCE BADGE ──────────────────────────────────────────────────────
  Widget _buildExpBadge(BuildContext context) {
    final textColor = AppColors.text(context);
    final mutedColor = AppColors.textSubtle(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '3+',
          style: GoogleFonts.dmSans(
            fontSize: 54,
            fontWeight: FontWeight.w900,
            color: textColor,
            height: 1.0,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'YEARS\nEXPERIENCE',
          style: GoogleFonts.dmSans(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: mutedColor,
            height: 1.35,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  // ── TAGLINE ───────────────────────────────────────────────────────────────
  Widget _buildTagline(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 240),
      child: Text(
        'I build beautifully simple Flutter apps,\nand I love what I do.',
        style: GoogleFonts.dmSans(
          fontSize: 14.5,
          fontWeight: FontWeight.w400,
          color: AppColors.textSubtle(context),
          height: 1.6,
        ),
      ),
    );
  }

  // ── CERTIFICATION SEAL ────────────────────────────────────────────────────
  Widget _buildCertBadge(BuildContext context) {
    final isDark = AppColors.isDark(context);
    final badgeBg = isDark ? AppColors.darkInk2 : AppColors.darkNavy;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: badgeBg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.flutter_dash_rounded,
              color: Color(0xFF54C5F8),
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'CERTIFIED FLUTTER\nDEVELOPER',
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: AppColors.text(context),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // ── ACTIONS ───────────────────────────────────────────────────────────────
  Widget _buildActions(BuildContext context) {
    final textColor = AppColors.text(context);
    final border = AppColors.line2(context);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        GestureDetector(
          onTap: onWorkPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: AppColors.teal.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore Work',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onContactPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Get in Touch',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Fallback painter for watercolor brushstroke ──────────────────────────────
class _BrushstrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF267365)
      ..style = PaintingStyle.fill;

    final path = Path();
    final cx = size.width / 2;
    final cy = size.height / 2;

    path.moveTo(cx - 180, cy - 60);
    path.cubicTo(cx - 100, cy - 130, cx + 80, cy - 140, cx + 190, cy - 50);
    path.cubicTo(cx + 240, cy + 10, cx + 200, cy + 90, cx + 100, cy + 100);
    path.cubicTo(cx + 20, cy + 108, cx - 80, cy + 100, cx - 150, cy + 60);
    path.cubicTo(cx - 210, cy + 20, cx - 240, cy + 10, cx - 180, cy - 60);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
