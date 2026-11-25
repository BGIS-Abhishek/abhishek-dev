import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final surfaceColor = AppColors.surface(context);

    return Container(
      width: double.infinity,
      color: surfaceColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 56,
        vertical: isMobile ? 72 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RevealAnimation(
                isLeft: true,
                child: _buildHeader(context, isMobile),
              ),
              const SizedBox(height: 56),
              isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    final textColor = AppColors.text(context);
    final captionColor = AppColors.textCaption(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Work Experience',
          style: GoogleFonts.dmSans(
            fontSize: 11, fontWeight: FontWeight.w700,
            letterSpacing: 2.0, color: captionColor,
          ),
        ),
        const SizedBox(height: 14),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "Where I've\n",
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 36 : 50,
                fontWeight: FontWeight.w700,
                height: 1.1, letterSpacing: -1.0,
                color: textColor,
              ),
            ),
            TextSpan(
              text: 'worked & learned',
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 36 : 50,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                height: 1.1, letterSpacing: -1.0,
                color: AppColors.teal,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline
        Expanded(
          flex: 11,
          child: RevealAnimation(
            delay: const Duration(milliseconds: 100),
            child: _buildTimeline(context),
          ),
        ),
        const SizedBox(width: 60),
        // Skills
        Expanded(
          flex: 11,
          child: RevealAnimation(
            delay: const Duration(milliseconds: 200),
            child: _buildSkillsGrid(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(
          delay: const Duration(milliseconds: 100),
          child: _buildTimeline(context),
        ),
        const SizedBox(height: 48),
        RevealAnimation(
          delay: const Duration(milliseconds: 200),
          child: _buildSkillsGrid(context),
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final entries = [
      _TimelineEntry(
        company: 'BGIS / Govt. Projects',
        period: '2023 — Present',
        role: 'Flutter Developer',
        desc: 'Built Tigram & Geo Survey for Kerala Forest Dept. — GPS geotagging, offline sync, QR traceability, live in production.',
        dotColor: AppColors.teal,
      ),
      _TimelineEntry(
        company: 'Enterprise / Insurance',
        period: '2023',
        role: 'Mobile App Developer',
        desc: 'Delivered Claim Assure — PDF generation, image processing, full CI/CD pipeline via Fastlane & GitHub Actions.',
        dotColor: AppColors.amber,
      ),
      _TimelineEntry(
        company: 'Healthcare',
        period: '2022 — 2023',
        role: 'Flutter Developer',
        desc: 'Built Arogya Aplya Dari — healthcare doorstep app for senior citizens. Firebase, REST API, cross-platform.',
        dotColor: AppColors.redOrange,
      ),
    ];

    return Column(
      children: List.generate(entries.length, (i) =>
        _TimelineRow(entry: entries[i], isLast: i == entries.length - 1),
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final categories = [
      _SkillCategory(
        label: 'Core Stack',
        skills: ['Flutter & Dart', 'Bloc Pattern', 'Provider', 'Clean Architecture'],
        isPrimary: true,
      ),
      _SkillCategory(
        label: 'Integration',
        skills: ['REST APIs', 'WebSocket', 'Firebase', 'SQLite', 'Hive', 'MongoDB'],
      ),
      _SkillCategory(
        label: 'DevOps & Deployment',
        skills: ['Fastlane', 'GitHub Actions', 'Play Store', 'App Store'],
      ),
      _SkillCategory(
        label: 'Specialties',
        skills: ['GIS & Mapping', 'GPS Geotagging', 'Offline-First', 'Image Processing'],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.map((cat) => _SkillCategoryWidget(category: cat)).toList(),
    );
  }
}

// ── Timeline ─────────────────────────────────────────────────────────────────
class _TimelineEntry {
  final String company, period, role, desc;
  final Color dotColor;
  const _TimelineEntry({
    required this.company, required this.period,
    required this.role, required this.desc, required this.dotColor,
  });
}

class _TimelineRow extends StatelessWidget {
  final _TimelineEntry entry;
  final bool isLast;
  const _TimelineRow({required this.entry, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final mutedColor = AppColors.textSubtle(context);
    final captionColor = AppColors.textCaption(context);
    final borderColor = AppColors.line2(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: Border(bottom: isLast ? BorderSide.none : BorderSide(color: borderColor)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company + period column
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.company,
                    style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w600, color: textColor)),
                  const SizedBox(height: 2),
                  Text(entry.period,
                    style: GoogleFonts.dmSans(fontSize: 11, color: captionColor)),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Dot + content
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 14),
                    child: Container(
                      width: 9, height: 9,
                      decoration: BoxDecoration(
                        color: entry.dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(entry.role,
                          style: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
                        const SizedBox(height: 6),
                        Text(entry.desc,
                          style: GoogleFonts.dmSans(fontSize: 13, height: 1.65, color: mutedColor)),
                      ],
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

// ── Skills ────────────────────────────────────────────────────────────────────
class _SkillCategory {
  final String label;
  final List<String> skills;
  final bool isPrimary;
  const _SkillCategory({required this.label, required this.skills, this.isPrimary = false});
}

class _SkillCategoryWidget extends StatelessWidget {
  final _SkillCategory category;
  const _SkillCategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    final captionColor = AppColors.textCaption(context);
    final borderColor = AppColors.line2(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                category.label,
                style: GoogleFonts.dmSans(
                  fontSize: 10, fontWeight: FontWeight.w700,
                  letterSpacing: 1.8, color: captionColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: Container(height: 1, color: borderColor)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((s) => _SkillPill(text: s, isPrimary: category.isPrimary)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillPill extends StatefulWidget {
  final String text;
  final bool isPrimary;
  const _SkillPill({required this.text, this.isPrimary = false});

  @override
  State<_SkillPill> createState() => _SkillPillState();
}

class _SkillPillState extends State<_SkillPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final teal = AppColors.teal;
    final textColor = AppColors.text(context);
    final border = AppColors.line2(context);
    final bg = AppColors.elevated(context);

    final isPrimaryActive = widget.isPrimary;
    final isHov = _hovered;

    Color bgColor = isPrimaryActive
        ? teal.withOpacity(0.12)
        : (isHov ? textColor : bg);
    Color borderC = isPrimaryActive
        ? teal
        : (isHov ? textColor : border);
    Color textC = isPrimaryActive
        ? teal
        : (isHov ? AppColors.bg(context) : textColor);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderC),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.dmSans(
            fontSize: 12, fontWeight: FontWeight.w500,
            color: textC,
          ),
        ),
      ),
    );
  }
}
