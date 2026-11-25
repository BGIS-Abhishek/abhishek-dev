import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 56,
        vertical: isMobile ? 72 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? _buildMobile(context)
              : _buildDesktop(context),
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: RevealAnimation(isLeft: true, child: _buildLeft(context, isMobile: false)),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 13,
          child: _buildRight(context, isMobile: false),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(isLeft: true, child: _buildLeft(context, isMobile: true)),
        const SizedBox(height: 48),
        _buildRight(context, isMobile: true),
      ],
    );
  }

  Widget _buildLeft(BuildContext context, {required bool isMobile}) {
    final textColor = AppColors.text(context);
    final mutedColor = AppColors.textSubtle(context);
    final captionColor = AppColors.textCaption(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who I Am',
          style: GoogleFonts.dmSans(
            fontSize: 11, fontWeight: FontWeight.w700,
            letterSpacing: 2.0, color: captionColor,
          ),
        ),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: 'Engineering apps\n',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.w800,
                height: 1.1, letterSpacing: -1.0,
                color: textColor,
              ),
            ),
            TextSpan(
              text: 'that scale & protect',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.w800,
                height: 1.1, letterSpacing: -1.0,
                color: AppColors.teal,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Text(
          'Flutter developer with 5 years of experience shipping production Android & iOS apps for banking, government, and enterprise clients. Currently building NSDL Payments Bank\'s digital banking app with strict RBI security guidelines, and author of the open-source wfs_layer package on pub.dev.',
          style: GoogleFonts.dmSans(
            fontSize: 14.5, height: 1.7, color: mutedColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Metric cards
        RevealAnimation(
          delay: const Duration(milliseconds: 100),
          child: _buildMetrics(context, isMobile),
        ),
        const SizedBox(height: 36),
        // Skill pills
        RevealAnimation(
          delay: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 8, runSpacing: 8,
            children: const [
              _HoverPill(text: 'Flutter & Dart'),
              _HoverPill(text: 'Bloc & Cubit'),
              _HoverPill(text: 'AES-GCM Security'),
              _HoverPill(text: 'SSL Pinning'),
              _HoverPill(text: 'Biometric Auth'),
              _HoverPill(text: 'SIM Binding'),
              _HoverPill(text: 'wfs_layer (pub.dev)'),
              _HoverPill(text: 'Mapbox & OSM'),
              _HoverPill(text: 'Fastlane CI/CD'),
              _HoverPill(text: 'flutter_secure_storage'),
              _HoverPill(text: 'Hive & SQLite'),
            ],
          ),
        ),
        const SizedBox(height: 44),
        // "Let's talk" card
        RevealAnimation(
          delay: const Duration(milliseconds: 300),
          child: _buildLetsTalkCard(context),
        ),
      ],
    );
  }

  Widget _buildMetrics(BuildContext context, bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemW = isMobile
            ? (constraints.maxWidth - 12) / 2
            : (constraints.maxWidth - 36) / 4;
        final metrics = [
          _Metric(value: '5+', label: 'Years Experience', sub: 'Android & iOS Stores'),
          _Metric(value: '12-Dev', label: 'Team PR Reviewer', sub: 'NSDL Payments Bank'),
          _Metric(value: '100%', label: 'RBI Hardened', sub: 'AES-GCM & SSL Pinning'),
          _Metric(value: 'pub.dev', label: 'Package Author', sub: 'wfs_layer OGC Vector'),
        ];
        return Wrap(
          spacing: 12, runSpacing: 12,
          children: metrics.map((m) => SizedBox(
            width: itemW,
            child: _MetricCard(metric: m),
          )).toList(),
        );
      },
    );
  }

  Widget _buildLetsTalkCard(BuildContext context) {
    final isDark = AppColors.isDark(context);
    final cardBg = isDark ? AppColors.darkInk2 : AppColors.darkNavy;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'B.Sc. Information Technology',
                  style: GoogleFonts.dmSans(
                    fontSize: 18, fontWeight: FontWeight.w700,
                    color: AppColors.cream, height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Patkar Varde College, Mumbai · Open for FinTech, Mobile & GIS Roles',
                  style: GoogleFonts.dmSans(
                    fontSize: 13, color: AppColors.cream.withValues(alpha: 0.7), height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 10, height: 10,
            decoration: const BoxDecoration(
              color: Color(0xFF3A9B88),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Available',
            style: GoogleFonts.dmSans(
              fontSize: 12, fontWeight: FontWeight.w600,
              color: AppColors.teal2,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Metric card ───────────────────────────────────────────────────────────────
class _Metric {
  final String value, label, sub;
  const _Metric({required this.value, required this.label, required this.sub});
}

class _MetricCard extends StatefulWidget {
  final _Metric metric;
  const _MetricCard({required this.metric});

  @override
  State<_MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<_MetricCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final surface = AppColors.surface(context);
    final elevated = AppColors.elevated(context);
    final teal = AppColors.teal;
    final textColor = AppColors.text(context);
    final mutedColor = AppColors.textSubtle(context);
    final border = AppColors.line2(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: _hovered ? elevated : surface,
          border: Border.all(
            color: _hovered ? teal.withOpacity(0.5) : border,
            width: _hovered ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovered
              ? [BoxShadow(color: teal.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 6))]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.metric.value,
              style: GoogleFonts.playfairDisplay(
                fontSize: 26, fontWeight: FontWeight.w800,
                color: teal, height: 1.1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.metric.label,
              style: GoogleFonts.dmSans(
                fontSize: 12, fontWeight: FontWeight.w600, color: textColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.metric.sub,
              style: GoogleFonts.dmSans(
                fontSize: 10, color: mutedColor, height: 1.3,
              ),
              maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Hover pill ────────────────────────────────────────────────────────────────
class _HoverPill extends StatefulWidget {
  final String text;
  const _HoverPill({required this.text});

  @override
  State<_HoverPill> createState() => _HoverPillState();
}

class _HoverPillState extends State<_HoverPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final border = AppColors.line2(context);
    final bg = AppColors.elevated(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered ? textColor : bg,
          border: Border.all(color: _hovered ? textColor : border),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.dmSans(
            fontSize: 12, fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.bg(context) : textColor,
          ),
        ),
      ),
    );
  }
}
