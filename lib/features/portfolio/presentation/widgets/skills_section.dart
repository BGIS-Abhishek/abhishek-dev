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
    final lineBorder = AppColors.line(context);

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
              const SizedBox(height: 60),
              RevealAnimation(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    color: lineBorder,
                    border: Border.all(color: lineBorder),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            _buildSkillCard(context, '📱', 'Core Development', [
                              'Flutter & Dart',
                              'State — Bloc',
                              'State — Provider',
                              'REST API Integration',
                              'WebSocket',
                              'Clean Architecture'
                            ]),
                            Container(height: 1, color: lineBorder),
                            _buildSkillCard(context, '🛠', 'Tools & Infra', [
                              'Fastlane + GitHub Actions',
                              'Firebase',
                              'SQLite & Hive',
                              'MongoDB',
                              'Git & GitHub',
                              'Play Store / App Store'
                            ]),
                            Container(height: 1, color: lineBorder),
                            _buildSkillCard(context, '⚡', 'Strengths', [
                              'Performance Optimization',
                              'Scalable Codebase',
                              'GIS & Geotagging',
                              'Image Processing',
                              'Offline-First Design',
                              'Production Deployment'
                            ]),
                          ],
                        )
                      : IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: _buildSkillCard(context, '📱', 'Core Development', [
                                  'Flutter & Dart',
                                  'State — Bloc',
                                  'State — Provider',
                                  'REST API Integration',
                                  'WebSocket',
                                  'Clean Architecture'
                                ]),
                              ),
                              Container(width: 1, color: lineBorder),
                              Expanded(
                                child: _buildSkillCard(context, '🛠', 'Tools & Infra', [
                                  'Fastlane + GitHub Actions',
                                  'Firebase',
                                  'SQLite & Hive',
                                  'MongoDB',
                                  'Git & GitHub',
                                  'Play Store / App Store'
                                ]),
                              ),
                              Container(width: 1, color: lineBorder),
                              Expanded(
                                child: _buildSkillCard(context, '⚡', 'Strengths', [
                                  'Performance Optimization',
                                  'Scalable Codebase',
                                  'GIS & Geotagging',
                                  'Image Processing',
                                  'Offline-First Design',
                                  'Production Deployment'
                                ]),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, String icon, String title, List<String> skills) {
    final accentColor = AppColors.accent(context);
    final lineBorder = AppColors.line(context);

    return _HoverCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: lineBorder)),
              ),
              child: Text(
                title.toUpperCase(),
                style: AppTheme.syne.copyWith(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.4,
                  color: accentColor,
                ),
              ),
            ),
            ...skills.map((s) => _HoverSkillItem(text: s)),
          ],
        ),
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = AppColors.bg(context);
    final surfaceColor = AppColors.surface(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _isHovered ? surfaceColor : bgColor,
        child: widget.child,
      ),
    );
  }
}

class _HoverSkillItem extends StatefulWidget {
  final String text;
  const _HoverSkillItem({required this.text});

  @override
  State<_HoverSkillItem> createState() => _HoverSkillItemState();
}

class _HoverSkillItemState extends State<_HoverSkillItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final accentColor = AppColors.accent(context);
    final line2Color = AppColors.line2(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: AppTheme.inter.copyWith(
                fontSize: 14.4,
                color: _isHovered ? textColor : textSubtleColor,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: _isHovered ? accentColor : line2Color,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
