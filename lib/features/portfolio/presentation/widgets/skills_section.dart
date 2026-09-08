import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 48,
        0,
        isMobile ? 20 : 48,
        isMobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RevealAnimation(
                child: Row(
                  children: [
                    Container(width: 20, height: 1, color: accentColor),
                    const SizedBox(width: 10),
                    Text(
                      'TECHNICAL SKILLS',
                      style: AppTheme.jetBrainsMono.copyWith(
                        fontSize: 10.4,
                        letterSpacing: 3.2,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RevealAnimation(
                delay: const Duration(milliseconds: 100),
                child: RichText(
                  text: TextSpan(
                    style: AppTheme.syne.copyWith(
                      fontSize: isMobile ? 38.4 : 72,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      letterSpacing: -0.01,
                      color: textColor,
                    ),
                    children: [
                      const TextSpan(text: 'The full '),
                      TextSpan(
                        text: 'toolkit',
                        style: TextStyle(fontStyle: FontStyle.italic, color: textSubtleColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              RevealAnimation(
                delay: const Duration(milliseconds: 200),
                child: isMobile
                    ? Column(
                        children: [
                          _buildGlassCard(
                            context,
                            icon: '📱',
                            category: 'Core Development',
                            badgeText: 'Production',
                            items: [
                              const _SkillChip(name: 'Flutter & Dart', icon: '⚡', isPrimary: true),
                              const _SkillChip(name: 'State — BLoC', icon: '📦', isPrimary: true),
                              const _SkillChip(name: 'State — Provider', icon: '🔄'),
                              const _SkillChip(name: 'Clean Architecture', icon: '📐', isPrimary: true),
                              const _SkillChip(name: 'REST API Integration', icon: '🌐'),
                              const _SkillChip(name: 'WebSocket Engine', icon: '🔌'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildGlassCard(
                            context,
                            icon: '🛠',
                            category: 'Tools & DevOps',
                            badgeText: 'Infrastructure',
                            items: [
                              const _SkillChip(name: 'Fastlane Pipelines', icon: '🚀', isPrimary: true),
                              const _SkillChip(name: 'GitHub Actions', icon: '🐙', isPrimary: true),
                              const _SkillChip(name: 'Firebase Suite', icon: '🔥'),
                              const _SkillChip(name: 'SQLite & Hive DB', icon: '💾', isPrimary: true),
                              const _SkillChip(name: 'MongoDB', icon: '🍃'),
                              const _SkillChip(name: 'App Store / Play Store', icon: '📱'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildGlassCard(
                            context,
                            icon: '⚡',
                            category: 'Specialized Engineering',
                            badgeText: 'Core Strengths',
                            items: [
                              const _SkillChip(name: 'Offline-First Engine', icon: '🔒', isPrimary: true),
                              const _SkillChip(name: 'GIS & Geotagging', icon: '🗺️', isPrimary: true),
                              const _SkillChip(name: 'Bluetooth Thermal Print', icon: '🖨️'),
                              const _SkillChip(name: 'Image Compression', icon: '🖼️'),
                              const _SkillChip(name: 'Performance Profiling', icon: '⚡', isPrimary: true),
                              const _SkillChip(name: 'CI/CD Automation', icon: '🛠️'),
                            ],
                          ),
                        ],
                      )
                    : IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _buildGlassCard(
                                context,
                                icon: '📱',
                                category: 'Core Development',
                                badgeText: 'Production',
                                items: [
                                  const _SkillChip(name: 'Flutter & Dart', icon: '⚡', isPrimary: true),
                                  const _SkillChip(name: 'State — BLoC', icon: '📦', isPrimary: true),
                                  const _SkillChip(name: 'State — Provider', icon: '🔄'),
                                  const _SkillChip(name: 'Clean Architecture', icon: '📐', isPrimary: true),
                                  const _SkillChip(name: 'REST API Integration', icon: '🌐'),
                                  const _SkillChip(name: 'WebSocket Engine', icon: '🔌'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildGlassCard(
                                context,
                                icon: '🛠',
                                category: 'Tools & DevOps',
                                badgeText: 'Infrastructure',
                                items: [
                                  const _SkillChip(name: 'Fastlane Pipelines', icon: '🚀', isPrimary: true),
                                  const _SkillChip(name: 'GitHub Actions', icon: '🐙', isPrimary: true),
                                  const _SkillChip(name: 'Firebase Suite', icon: '🔥'),
                                  const _SkillChip(name: 'SQLite & Hive DB', icon: '💾', isPrimary: true),
                                  const _SkillChip(name: 'MongoDB', icon: '🍃'),
                                  const _SkillChip(name: 'App Store / Play Store', icon: '📱'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildGlassCard(
                                context,
                                icon: '⚡',
                                category: 'Specialized Engineering',
                                badgeText: 'Core Strengths',
                                items: [
                                  const _SkillChip(name: 'Offline-First Engine', icon: '🔒', isPrimary: true),
                                  const _SkillChip(name: 'GIS & Geotagging', icon: '🗺️', isPrimary: true),
                                  const _SkillChip(name: 'Bluetooth Thermal Print', icon: '🖨️'),
                                  const _SkillChip(name: 'Image Compression', icon: '🖼️'),
                                  const _SkillChip(name: 'Performance Profiling', icon: '⚡', isPrimary: true),
                                  const _SkillChip(name: 'CI/CD Automation', icon: '🛠️'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard(
    BuildContext context, {
    required String icon,
    required String category,
    required String badgeText,
    required List<Widget> items,
  }) {
    return _GlassHoverCard(
      icon: icon,
      category: category,
      badgeText: badgeText,
      items: items,
    );
  }
}

class _GlassHoverCard extends StatefulWidget {
  final String icon;
  final String category;
  final String badgeText;
  final List<Widget> items;

  const _GlassHoverCard({
    required this.icon,
    required this.category,
    required this.badgeText,
    required this.items,
  });

  @override
  State<_GlassHoverCard> createState() => _GlassHoverCardState();
}

class _GlassHoverCardState extends State<_GlassHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final accentColor = AppColors.accent(context);
    final lineBorder = AppColors.line(context);
    final textColor = AppColors.text(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: surfaceColor,
          border: Border.all(
            color: _isHovered ? accentColor.withOpacity(0.5) : lineBorder,
            width: _isHovered ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? accentColor.withOpacity(0.1) : Colors.black.withOpacity(0.04),
              blurRadius: _isHovered ? 24 : 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Icon & Category Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(widget.icon, style: const TextStyle(fontSize: 22)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _isHovered ? accentColor.withOpacity(0.12) : Colors.transparent,
                    border: Border.all(
                      color: _isHovered ? accentColor.withOpacity(0.4) : lineBorder,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.badgeText.toUpperCase(),
                    style: AppTheme.jetBrainsMono.copyWith(
                      fontSize: 9.5,
                      letterSpacing: 1.2,
                      color: _isHovered ? accentColor : AppColors.textCaption(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.category.toUpperCase(),
              style: AppTheme.syne.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: lineBorder, height: 1),
            const SizedBox(height: 20),
            // Skill Chips Wrap Grid
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: widget.items,
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String name;
  final String icon;
  final bool isPrimary;

  const _SkillChip({
    required this.name,
    required this.icon,
    this.isPrimary = false,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final lineBorder = AppColors.line(context);
    final elevatedColor = AppColors.elevated(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: _isHovered
              ? accentColor.withOpacity(0.12)
              : (widget.isPrimary ? elevatedColor : Colors.transparent),
          border: Border.all(
            color: _isHovered
                ? accentColor
                : (widget.isPrimary ? accentColor.withOpacity(0.3) : lineBorder),
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 6),
            Text(
              widget.name,
              style: AppTheme.inter.copyWith(
                fontSize: 12.5,
                fontWeight: widget.isPrimary ? FontWeight.w600 : FontWeight.w400,
                color: _isHovered
                    ? accentColor
                    : (widget.isPrimary ? textColor : textSubtleColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
